#include "qemu/osdep.h"

#include <android/log.h>
#include <jni.h>
#include <pthread.h>
#include <errno.h>

#include "qemu/main-loop.h"
#include "qemu/timer.h"
#include "system/replay.h"
#include "system/runstate.h"
#include "system/system.h"
#include "crypto/init.h"
#include "hw/xbox/eeprom_generation.h"
#include "qapi/error.h"
#include "ui/console.h"
#include "ui/surface.h"
#include "hw/xbox/nv2a/nv2a.h"
#include "hw/xbox/nv2a/nv2a_int.h"
#include "hw/xbox/nv2a/boxdroid-m5-diagnostics.h"

#define ARG(value) ((char *)(value))
#define M5_RAW_FB_BASE UINT64_C(0x3c00000)
#define M5_RAW_FB_PITCH 2560U
#define M5_RAW_FB_WIDTH 640U
#define M5_RAW_FB_HEIGHT 480U
#define M5_RAW_FB_SIZE ((size_t) M5_RAW_FB_PITCH * M5_RAW_FB_HEIGHT)
#define M5_FB_WRITE_LOG_CAP 16
#define M5_VALUE_LOG_CAP 64

extern bool boxdroid_android_present_rgba(const uint8_t *pixels,
                                         uint32_t width, uint32_t height,
                                         uint32_t stride);

#define TAG "BoxDroidM5"

static pthread_mutex_t state_lock = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t state_changed = PTHREAD_COND_INITIALIZER;
static pthread_t qemu_thread;
static bool thread_created;
static bool init_finished;
static bool init_succeeded;
static bool loop_finished;
static int loop_status;
static char *arguments[33];
static char *eeprom_path;
static uint64_t guest_frame_count;
static uint64_t m5_diagnostic_sequence;
static uint64_t m5_pgraph_record_count;
static uint64_t m5_surface_record_count;
static pthread_mutex_t m5_order_lock = PTHREAD_MUTEX_INITIALIZER;
static uint64_t m5_last_pgraph_target[6], m5_last_pgraph_extent[6];
static uint64_t m5_last_pgraph_target_seq, m5_last_pgraph_extent_seq;
static int64_t m5_last_pgraph_target_time, m5_last_pgraph_extent_time;
static bool m5_have_pgraph_target, m5_have_pgraph_extent;
static bool m5_pcrtc_3c_seen;
static pthread_mutex_t m5_vram_write_lock = PTHREAD_MUTEX_INITIALIZER;
static uint64_t m5_fb_write_count, m5_fb_write_bytes;
static uint64_t m5_vram_write_event_log_count;
static int64_t m5_fb_first_write_us;
static char m5_fb_first_writer[32], m5_fb_last_writer[32];
static uint64_t m5_vram_read_count, m5_vram_read_bytes;
typedef struct BoxDroidM5FramebufferWrite {
    uint64_t sequence;
    int64_t timestamp_us;
    uint64_t address;
    uint64_t bytes;
    uint64_t source;
    uint64_t guest_pc;
    uint64_t overlap_bytes;
    char writer[32];
} BoxDroidM5FramebufferWrite;
static BoxDroidM5FramebufferWrite m5_fb_first_writes[M5_FB_WRITE_LOG_CAP];
static BoxDroidM5FramebufferWrite m5_fb_last_writes[M5_FB_WRITE_LOG_CAP];
typedef struct BoxDroidM5FramebufferSamples {
    uint64_t samples, nonzero_samples, rgb_samples;
    int64_t first_nonzero_us, first_rgb_us, last_sample_us;
    uint64_t last_nonzero_bytes, last_rgb_pixels;
} BoxDroidM5FramebufferSamples;
static BoxDroidM5FramebufferSamples m5_fb_samples[2];
static pthread_mutex_t m5_fb_sample_lock = PTHREAD_MUTEX_INITIALIZER;
static int64_t m5_fb_periodic_sample_us;
static bool m5_fb_first_pcrtc_sampled;
typedef struct BoxDroidM5ValueWrite {
    uint64_t sequence, address, guest_pc, before, after;
    int64_t pre_store_us;
    uint8_t size;
    uint8_t change;
} BoxDroidM5ValueWrite;
static uint64_t m5_value_count, m5_value_zero, m5_value_nonzero;
static uint64_t m5_value_zero_bytes, m5_value_nonzero_bytes;
static uint64_t m5_value_large, m5_value_after_switch;
static uint64_t m5_value_after_zero, m5_value_after_nonzero;
static uint64_t m5_value_first_nonzero_us;
static uint64_t m5_value_first_after_count, m5_value_first_nonzero_count;
static uint64_t m5_value_last_nonzero_count;
static uint64_t m5_value_unique_bytes, m5_value_unique_words;
static uint8_t m5_value_byte_seen[(M5_RAW_FB_SIZE + 7) / 8];
static uint8_t m5_value_word_seen[(M5_RAW_FB_SIZE / 4 + 7) / 8];
static BoxDroidM5ValueWrite m5_value_first_after[M5_VALUE_LOG_CAP];
static BoxDroidM5ValueWrite m5_value_first_nonzero[M5_VALUE_LOG_CAP];
static BoxDroidM5ValueWrite m5_value_last_nonzero[M5_VALUE_LOG_CAP];
static uint64_t diagnostic_counts[BOXDROID_M5_DIAG_COUNT];
static uint64_t diagnostic_sample_counts[BOXDROID_M5_SAMPLE_COUNT];
static const void *diagnostic_scanout_surface;
static bool diagnostic_binding_logged;
static bool diagnostic_late_miss_logged;
static bool diagnostic_display_surface_logged;
static bool diagnostic_vga_surface_logged;
static char *runtime_mcpx_path;
static char *runtime_hdd_path;
static pthread_mutex_t hdd_io_lock = PTHREAD_MUTEX_INITIALIZER;
static bool hdd_io_enabled;
static uint64_t hdd_read_requests, hdd_read_bytes, hdd_read_failures;
static uint64_t hdd_write_requests, hdd_write_bytes, hdd_write_failures;
static struct { uint64_t offset, bytes; } hdd_first_reads[8];
static size_t hdd_first_read_count;

typedef struct BoxDroidM5BindingJournal {
    uint64_t base;
    uint64_t generation;
    uint64_t counts[BOXDROID_M5_BINDING_EVENT_COUNT];
    uint64_t last_values[BOXDROID_M5_BINDING_EVENT_COUNT][8];
    BoxDroidM5BindingEvent last_event;
    uint64_t last_operation[8];
    BoxDroidM5BindingEvent before_scanout_event;
    uint64_t before_scanout_operation[8];
    uint32_t first_logged;
    uint32_t after_switch_logged;
} BoxDroidM5BindingJournal;

static pthread_mutex_t binding_journal_lock = PTHREAD_MUTEX_INITIALIZER;
static BoxDroidM5BindingJournal binding_journal[16];
static size_t binding_journal_count;

static const char *const binding_event_names[BOXDROID_M5_BINDING_EVENT_COUNT] = {
    "create", "reuse", "upload_pending", "upload", "draw_dirty", "clear",
    "guest_draw", "gpu_probe", "staging_compare", "scanout",
};
static void boxdroid_m5_diag_binding_summary_all(void);
static void boxdroid_m5_diag_value_summary(void);

uint64_t boxdroid_m5_diag_record(const char *event, uint64_t a, uint64_t b,
                                uint64_t c, uint64_t d, uint64_t e,
                                uint64_t f)
{
    uint64_t sequence = __atomic_add_fetch(&m5_diagnostic_sequence, 1,
                                            __ATOMIC_RELAXED);
    int64_t timestamp = g_get_monotonic_time();
    bool log_record = true;
    uint64_t target[6], extent[6], target_seq, extent_seq;
    int64_t target_time, extent_time;
    bool have_target, have_extent;

    pthread_mutex_lock(&m5_order_lock);
    if (g_strcmp0(event, "PGRAPH_COLOR_TARGET") == 0) {
        memcpy(m5_last_pgraph_target, (uint64_t[]){ a, b, c, d, e, f },
               sizeof(m5_last_pgraph_target));
        m5_last_pgraph_target_seq = sequence;
        m5_last_pgraph_target_time = timestamp;
        m5_have_pgraph_target = true;
        log_record = ++m5_pgraph_record_count <= 32;
    } else if (g_strcmp0(event, "PGRAPH_COLOR_TARGET_EXTENT") == 0) {
        memcpy(m5_last_pgraph_extent, (uint64_t[]){ a, b, c, d, e, f },
               sizeof(m5_last_pgraph_extent));
        m5_last_pgraph_extent_seq = sequence;
        m5_last_pgraph_extent_time = timestamp;
        m5_have_pgraph_extent = true;
        log_record = m5_pgraph_record_count <= 32;
    } else if (g_strcmp0(event, "VRAM_WRITE") == 0) {
        log_record = __atomic_add_fetch(&m5_vram_write_event_log_count, 1,
                                        __ATOMIC_RELAXED) <= 16;
    } else if (g_str_has_prefix(event, "SURFACE_")) {
        log_record = ++m5_surface_record_count <= 96;
    }
    if (g_strcmp0(event, "PCRTC_START") == 0 &&
        b == UINT64_C(0x3c00000)) {
        __atomic_store_n(&m5_pcrtc_3c_seen, true, __ATOMIC_RELAXED);
    }
    memcpy(target, m5_last_pgraph_target, sizeof(target));
    memcpy(extent, m5_last_pgraph_extent, sizeof(extent));
    target_seq = m5_last_pgraph_target_seq;
    extent_seq = m5_last_pgraph_extent_seq;
    target_time = m5_last_pgraph_target_time;
    extent_time = m5_last_pgraph_extent_time;
    have_target = m5_have_pgraph_target;
    have_extent = m5_have_pgraph_extent;
    pthread_mutex_unlock(&m5_order_lock);

    if (!log_record) {
        return sequence;
    }
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_ORDER seq=%" PRIu64 " mono_us=%" PRId64 " event=%s"
        " a=0x%" PRIx64 " b=0x%" PRIx64 " c=0x%" PRIx64
        " d=0x%" PRIx64 " e=0x%" PRIx64 " f=0x%" PRIx64,
        sequence, timestamp, event, a, b, c, d, e, f);
    if (g_strcmp0(event, "PCRTC_START") == 0 &&
        b == UINT64_C(0x3c00000)) {
        if (have_target) {
            __android_log_print(ANDROID_LOG_INFO, TAG,
                "M5_ORDER_CORRELATED pcrtc_seq=%" PRIu64
                " pgraph_target_seq=%" PRIu64 " pgraph_mono_us=%" PRId64
                " method=0x%" PRIx64 " raw=0x%" PRIx64
                " dma_base=0x%" PRIx64 " target=0x%" PRIx64
                " pitch=0x%" PRIx64 " format=0x%" PRIx64,
                sequence, target_seq, target_time, target[0], target[1],
                target[2], target[3], target[4], target[5]);
        }
        if (have_extent) {
            __android_log_print(ANDROID_LOG_INFO, TAG,
                "M5_ORDER_CORRELATED_EXTENT pcrtc_seq=%" PRIu64
                " pgraph_extent_seq=%" PRIu64 " pgraph_mono_us=%" PRId64
                " width=%" PRIu64 " height=%" PRIu64
                " type=%" PRIu64 " dma_limit=0x%" PRIx64,
                sequence, extent_seq, extent_time, extent[0], extent[1],
                extent[2], extent[3]);
        }
    }
    return sequence;
}

void boxdroid_m5_diag_vram_sample(const char *boundary, uint64_t start,
                                 uint32_t line_offset, uint32_t pitch,
                                 uint32_t width, uint32_t height, int depth,
                                 const uint8_t *data, size_t length)
{
    size_t sample_size = MIN(length, (size_t)(4 * 1024 * 1024));
    uint64_t hash = UINT64_C(1469598103934665603);
    uint64_t nonzero_bytes = 0, nonzero_pixels = 0, nonblack_pixels = 0;
    unsigned int bytes_per_pixel = depth > 0 ? (unsigned int)(depth + 7) / 8 : 0;

    if (!data || !boundary) {
        return;
    }
    for (size_t i = 0; i < sample_size; ++i) {
        hash ^= data[i];
        hash *= UINT64_C(1099511628211);
        nonzero_bytes += data[i] != 0;
    }
    if (bytes_per_pixel && bytes_per_pixel <= 4) {
        size_t pixels = sample_size / bytes_per_pixel;
        for (size_t i = 0; i < pixels; ++i) {
            const uint8_t *pixel = data + i * bytes_per_pixel;
            bool nonzero = false;
            for (unsigned int channel = 0; channel < bytes_per_pixel; ++channel) {
                nonzero |= pixel[channel] != 0;
            }
            nonzero_pixels += nonzero;
            if (depth == 32) {
                nonblack_pixels += pixel[0] || pixel[1] || pixel[2];
            } else {
                /* For packed 15/16-bit VGA modes, any nonzero packed value
                 * represents a nonblack RGB pixel. */
                nonblack_pixels += nonzero;
            }
        }
    }
    boxdroid_m5_diag_record(boundary, start, line_offset, pitch,
                            ((uint64_t)width << 32) | height,
                            ((uint64_t)(uint32_t)depth << 32) | bytes_per_pixel,
                            hash);
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_MEMORY_SAMPLE boundary=%s start=0x%" PRIx64
        " line_offset=%u pitch=%u extent=%ux%u depth=%d bpp=%u"
        " sample_bytes=%zu total_bytes=%zu nonzero_bytes=%" PRIu64
        " nonzero_pixels=%" PRIu64 " rgb_nonblack_pixels=%" PRIu64
        " hash=%016" PRIx64,
        boundary, start, line_offset, pitch, width, height, depth,
        bytes_per_pixel, sample_size, length, nonzero_bytes, nonzero_pixels,
        nonblack_pixels, hash);
}

void boxdroid_m5_diag_vram_write(const char *writer, uint64_t address,
                                uint64_t bytes, uint64_t source,
                                uint64_t guest_pc)
{
    const uint64_t watch_start = M5_RAW_FB_BASE;
    const uint64_t watch_end = M5_RAW_FB_BASE + M5_RAW_FB_SIZE;
    uint64_t end, overlap_start, overlap_end, overlap_bytes, sequence;
    int64_t timestamp_us;
    BoxDroidM5FramebufferWrite record;
    uint64_t write_number;

    if (!writer || !bytes || address > UINT64_MAX - bytes) {
        return;
    }
    end = address + bytes;
    overlap_start = MAX(address, watch_start);
    overlap_end = MIN(end, watch_end);
    if (overlap_start >= overlap_end) {
        return;
    }
    overlap_bytes = overlap_end - overlap_start;
    timestamp_us = g_get_monotonic_time();
    sequence = __atomic_add_fetch(&m5_diagnostic_sequence, 1,
                                  __ATOMIC_RELAXED);
    record = (BoxDroidM5FramebufferWrite) {
        .sequence = sequence,
        .timestamp_us = timestamp_us,
        .address = address,
        .bytes = bytes,
        .source = source,
        .guest_pc = guest_pc,
        .overlap_bytes = overlap_bytes,
    };
    g_strlcpy(record.writer, writer, sizeof(record.writer));
    pthread_mutex_lock(&m5_vram_write_lock);
    write_number = ++m5_fb_write_count;
    m5_fb_write_bytes += overlap_bytes;
    if (write_number == 1) {
        m5_fb_first_write_us = timestamp_us;
        g_strlcpy(m5_fb_first_writer, writer, sizeof(m5_fb_first_writer));
    }
    g_strlcpy(m5_fb_last_writer, writer, sizeof(m5_fb_last_writer));
    if (write_number <= M5_FB_WRITE_LOG_CAP) {
        m5_fb_first_writes[write_number - 1] = record;
    }
    m5_fb_last_writes[(write_number - 1) % M5_FB_WRITE_LOG_CAP] = record;
    pthread_mutex_unlock(&m5_vram_write_lock);

    if (write_number <= M5_FB_WRITE_LOG_CAP) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_FB_WRITE seq=%" PRIu64 " mono_us=%" PRId64
            " writer=%s address=0x%" PRIx64 " bytes=%" PRIu64
            " overlap_bytes=%" PRIu64 " source=0x%" PRIx64
            " guest_pc=0x%" PRIx64 " count=%" PRIu64,
            sequence, timestamp_us, writer, address, bytes, overlap_bytes,
            source, guest_pc, write_number);
    }
}

/* The QEMU memory callback fires before the store. Its caller samples the
 * bytes at the next callback on the same vCPU thread, after this store ran. */
void boxdroid_m5_diag_cpu_store_value(uint64_t address, size_t size,
                                      const uint8_t *before,
                                      const uint8_t *after, uint64_t guest_pc,
                                      uint64_t pcrtc_start,
                                      int64_t pre_store_us)
{
    uint64_t begin, end;
    uint64_t before_word = 0, after_word = 0;
    bool before_nonzero = false, after_nonzero = false;
    BoxDroidM5ValueWrite record;

    if (!before || !after || !size || address > UINT64_MAX - size) {
        return;
    }
    begin = MAX(address, M5_RAW_FB_BASE);
    end = MIN(address + size, M5_RAW_FB_BASE + M5_RAW_FB_SIZE);
    if (begin >= end) {
        return;
    }
    if (size > 8) {
        pthread_mutex_lock(&m5_vram_write_lock);
        m5_value_large++;
        pthread_mutex_unlock(&m5_vram_write_lock);
        return;
    }
    for (size_t i = 0; i < size; ++i) {
        before_word |= (uint64_t)before[i] << (8 * i);
        after_word |= (uint64_t)after[i] << (8 * i);
    }
    for (uint64_t offset = begin; offset < end; ++offset) {
        size_t i = offset - address;
        before_nonzero |= before[i] != 0;
        after_nonzero |= after[i] != 0;
    }
    record = (BoxDroidM5ValueWrite) {
        .sequence = __atomic_add_fetch(&m5_diagnostic_sequence, 1,
                                        __ATOMIC_RELAXED),
        .address = address, .guest_pc = guest_pc,
        .before = before_word, .after = after_word,
        .pre_store_us = pre_store_us, .size = size,
        .change = !before_nonzero && after_nonzero ? 1 :
                  before_nonzero && !after_nonzero ? 2 :
                  before_nonzero && after_nonzero &&
                  before_word != after_word ? 3 : 0,
    };
    pthread_mutex_lock(&m5_vram_write_lock);
    m5_value_count++;
    m5_value_zero += !after_nonzero;
    m5_value_nonzero += after_nonzero;
    for (uint64_t offset = begin; offset < end; ++offset) {
        size_t i = offset - address;
        uint64_t relative = offset - M5_RAW_FB_BASE;
        uint64_t word = relative / 4;
        uint8_t bit = 1u << (relative & 7);
        uint8_t word_bit = 1u << (word & 7);
        m5_value_zero_bytes += after[i] == 0;
        m5_value_nonzero_bytes += after[i] != 0;
        if (!(m5_value_byte_seen[relative / 8] & bit)) {
            m5_value_byte_seen[relative / 8] |= bit;
            m5_value_unique_bytes++;
        }
        if (!(m5_value_word_seen[word / 8] & word_bit)) {
            m5_value_word_seen[word / 8] |= word_bit;
            m5_value_unique_words++;
        }
    }
    if (pcrtc_start == M5_RAW_FB_BASE) {
        m5_value_after_switch++;
        m5_value_after_zero += !after_nonzero;
        m5_value_after_nonzero += after_nonzero;
        if (m5_value_first_after_count < M5_VALUE_LOG_CAP) {
            m5_value_first_after[m5_value_first_after_count++] = record;
        }
        if (after_nonzero) {
            if (!m5_value_first_nonzero_us) {
                m5_value_first_nonzero_us = pre_store_us;
            }
            if (m5_value_first_nonzero_count < M5_VALUE_LOG_CAP) {
                m5_value_first_nonzero[m5_value_first_nonzero_count++] = record;
            }
            m5_value_last_nonzero[m5_value_last_nonzero_count++ %
                                  M5_VALUE_LOG_CAP] = record;
        }
    }
    pthread_mutex_unlock(&m5_vram_write_lock);
}

void boxdroid_m5_diag_vram_read(const char *reader, uint64_t address,
                               uint64_t bytes)
{
    const uint64_t watch_start = M5_RAW_FB_BASE;
    const uint64_t watch_end = M5_RAW_FB_BASE + M5_RAW_FB_SIZE;
    uint64_t end, overlap_start, overlap_end, read_number;
    if (!reader || !bytes || address > UINT64_MAX - bytes) {
        return;
    }
    end = address + bytes;
    overlap_start = MAX(address, watch_start);
    overlap_end = MIN(end, watch_end);
    if (overlap_start >= overlap_end) {
        return;
    }
    pthread_mutex_lock(&m5_vram_write_lock);
    read_number = ++m5_vram_read_count;
    m5_vram_read_bytes += overlap_end - overlap_start;
    pthread_mutex_unlock(&m5_vram_write_lock);
    if (read_number <= 8) {
        boxdroid_m5_diag_record("VRAM_READ", address, bytes,
                                overlap_end - overlap_start, 0, 0, 0);
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_VRAM_READ seq=%" PRIu64 " reader=%s address=0x%" PRIx64
            " bytes=%" PRIu64, __atomic_load_n(&m5_diagnostic_sequence,
                                                __ATOMIC_RELAXED),
            reader, address, bytes);
    }
}

void boxdroid_m5_diag_target_vram_sample(const char *boundary,
                                        const uint8_t *vram,
                                        uint64_t vram_size,
                                        uint64_t sequence_event)
{
    const uint64_t starts[] = { UINT64_C(0x3c00000), UINT64_C(0x3d00000) };
    if (!vram || !boundary) {
        return;
    }
    if (!sequence_event) {
        sequence_event = __atomic_load_n(&m5_diagnostic_sequence,
                                         __ATOMIC_RELAXED);
    }
    for (size_t target = 0; target < ARRAY_SIZE(starts); ++target) {
        uint64_t start = starts[target];
        size_t length = start < vram_size ?
            (size_t)MIN(UINT64_C(0x200000), vram_size - start) : 0;
        uint64_t hash = UINT64_C(1469598103934665603);
        uint64_t nonzero = 0, rgb_nonblack = 0;
        if (!length) {
            continue;
        }
        for (size_t i = 0; i < length; ++i) {
            uint8_t value = vram[start + i];
            hash ^= value;
            hash *= UINT64_C(1099511628211);
            nonzero += value != 0;
        }
        /* VGA's observed 32-bit mode is little-endian BGRA; count RGB bytes. */
        if ((length & 3) == 0) {
            for (size_t i = 0; i < length; i += 4) {
                rgb_nonblack += vram[start + i] || vram[start + i + 1] ||
                                vram[start + i + 2];
            }
        }
        boxdroid_m5_diag_record(target == 0 ? "VRAM_SAMPLE_3C" :
                                "VRAM_SAMPLE_3D",
            start, length, nonzero, rgb_nonblack, hash, 0);
        sequence_event = __atomic_load_n(&m5_diagnostic_sequence,
                                         __ATOMIC_RELAXED);
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_TARGET_VRAM_SAMPLE event=%s seq=%" PRIu64
            " target=0x%" PRIx64 " bytes=%zu nonzero_bytes=%" PRIu64
            " rgb_nonblack_32bpp=%" PRIu64 " hash=%016" PRIx64,
            boundary, sequence_event, start, length, nonzero, rgb_nonblack,
            hash);
    }
}

void boxdroid_m5_diag_framebuffer_sample(const char *boundary,
                                        uint64_t pcrtc_start,
                                        const uint8_t *data,
                                        size_t length)
{
    size_t sample_bytes = MIN(length, M5_RAW_FB_SIZE);
    uint64_t hash = UINT64_C(1469598103934665603);
    uint64_t nonzero_bytes = 0, rgb_nonblack_pixels = 0;
    uint64_t packed16_nonzero = 0, packed24_nonzero = 0;
    uint64_t alpha_only_pixels = 0, white_rgb_pixels = 0;
    uint32_t min_x = M5_RAW_FB_WIDTH, min_y = M5_RAW_FB_HEIGHT;
    uint32_t max_x = 0, max_y = 0, active_rows = 0;
    bool row_active[M5_RAW_FB_HEIGHT] = { 0 };
    int64_t timestamp_us = g_get_monotonic_time();
    uint64_t sequence;

    if (!boundary || !data || sample_bytes < M5_RAW_FB_SIZE) {
        return;
    }
    for (size_t i = 0; i < sample_bytes; ++i) {
        hash ^= data[i];
        hash *= UINT64_C(1099511628211);
        nonzero_bytes += data[i] != 0;
    }
    for (size_t i = 0; i < sample_bytes; i += 4) {
        bool rgb = data[i] || data[i + 1] || data[i + 2];
        rgb_nonblack_pixels += rgb;
        alpha_only_pixels += !rgb && data[i + 3] != 0;
        white_rgb_pixels += data[i] == 0xff && data[i + 1] == 0xff &&
                            data[i + 2] == 0xff;
        if (rgb) {
            uint32_t pixel = i / 4;
            uint32_t x = pixel % M5_RAW_FB_WIDTH;
            uint32_t y = pixel / M5_RAW_FB_WIDTH;
            min_x = MIN(min_x, x);
            min_y = MIN(min_y, y);
            max_x = MAX(max_x, x);
            max_y = MAX(max_y, y);
            if (!row_active[y]) {
                row_active[y] = true;
                active_rows++;
            }
        }
    }
    for (size_t i = 0; i < sample_bytes; i += 2) {
        packed16_nonzero += data[i] || data[i + 1];
    }
    for (size_t i = 0; i + 2 < sample_bytes; i += 3) {
        packed24_nonzero += data[i] || data[i + 1] || data[i + 2];
    }
    sequence = boxdroid_m5_diag_record("FRAMEBUFFER_SAMPLE", pcrtc_start,
        M5_RAW_FB_BASE, M5_RAW_FB_PITCH,
        ((uint64_t)M5_RAW_FB_WIDTH << 32) | M5_RAW_FB_HEIGHT,
        nonzero_bytes, rgb_nonblack_pixels);

    if (g_strcmp0(boundary, "raw-vram-pcrtc-entry") == 0 &&
        __atomic_exchange_n(&m5_fb_first_pcrtc_sampled, true,
                            __ATOMIC_RELAXED)) {
        return;
    }
    size_t sample_index = g_str_has_prefix(boundary, "raw-vram") ? 0 : 1;
    BoxDroidM5FramebufferSamples *samples = &m5_fb_samples[sample_index];
    pthread_mutex_lock(&m5_fb_sample_lock);
    samples->samples++;
    if (nonzero_bytes) {
        if (!samples->first_nonzero_us) {
            samples->first_nonzero_us = timestamp_us;
        }
        samples->nonzero_samples++;
    }
    if (rgb_nonblack_pixels) {
        if (!samples->first_rgb_us) {
            samples->first_rgb_us = timestamp_us;
        }
        samples->rgb_samples++;
    }
    samples->last_sample_us = timestamp_us;
    samples->last_nonzero_bytes = nonzero_bytes;
    samples->last_rgb_pixels = rgb_nonblack_pixels;
    pthread_mutex_unlock(&m5_fb_sample_lock);

    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_FRAMEBUFFER_SAMPLE seq=%" PRIu64 " mono_us=%" PRId64
        " boundary=%s pcrtc=0x%" PRIx64 " base=0x%" PRIx64
        " pitch=%u extent=%ux%u bytes=%zu nonzero_bytes=%" PRIu64
        " rgb_nonblack_pixels=%" PRIu64 " hash=%016" PRIx64,
        sequence, timestamp_us, boundary, pcrtc_start, M5_RAW_FB_BASE,
        M5_RAW_FB_PITCH, M5_RAW_FB_WIDTH, M5_RAW_FB_HEIGHT, sample_bytes,
        nonzero_bytes, rgb_nonblack_pixels, hash);
    if (pcrtc_start == M5_RAW_FB_BASE &&
        (g_strcmp0(boundary, "raw-vram-stop") == 0 ||
         (rgb_nonblack_pixels && !m5_fb_samples[0].rgb_samples))) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_FRAMEBUFFER_GEOMETRY boundary=%s rgb_bbox=%u,%u-%u,%u"
            " active_rows=%u rgb_white=%" PRIu64 " alpha_only=%" PRIu64
            " packed16_nonzero=%" PRIu64 " packed24_nonzero=%" PRIu64,
            boundary, min_x, min_y, max_x, max_y, active_rows,
            white_rgb_pixels, alpha_only_pixels,
            packed16_nonzero, packed24_nonzero);
    }
}

void xemu_queue_notification(const char *message);
void xemu_queue_error_message(const char *message);

JNIEXPORT jint JNICALL
Java_org_boxdroid_m5_MainActivity_nativeXboxStart(JNIEnv *env, jobject self,
                                                   jstring bios, jstring mcpx,
                                                   jstring hdd, jstring log);
JNIEXPORT jint JNICALL
Java_org_boxdroid_m5_MainActivity_nativeXboxStop(JNIEnv *env, jobject self);

static void xbox_display_update(DisplayChangeListener *dcl,
                                int x, int y, int width, int height)
{
    DisplaySurface *surface = qemu_console_surface(dcl->con);
    int surface_width_px, surface_height_px, stride;
    uint8_t *rgba;
    pixman_image_t *converted;
    uint64_t frame_hash = UINT64_C(1469598103934665603);
    uint64_t nonblack_pixels = 0;
    (void) x;
    (void) y;
    (void) width;
    (void) height;
    boxdroid_m5_diag_event(BOXDROID_M5_DIAG_DISPLAY_CALLBACK,
                           (uint64_t) x, (uint64_t) y,
                           (uint64_t) width, (uint64_t) height, 0, 0);

    if (!surface || !surface->image) {
        return;
    }
    surface_width_px = surface_width(surface);
    surface_height_px = surface_height(surface);
    stride = surface_stride(surface);
    if (surface_width_px <= 0 || surface_height_px <= 0) {
        return;
    }
    if (g_nv2a && g_nv2a->pcrtc.start == UINT64_C(0x3c00000) &&
        !__atomic_exchange_n(&diagnostic_vga_surface_logged, true,
                             __ATOMIC_RELAXED)) {
        VGADisplayParams params;
        g_nv2a->vga.get_params(&g_nv2a->vga, &params);
        uint64_t framebuffer_start = (uint64_t)params.start_addr * 4;
        int surface_depth = PIXMAN_FORMAT_BPP(surface_format(surface));
        boxdroid_m5_diag_record("VGA_DISPLAY_SURFACE_AT_PCRTC_3C00000",
            framebuffer_start, params.line_offset, surface_format(surface),
            ((uint64_t)(uint32_t)surface_width_px << 32) |
                (uint32_t)surface_height_px,
            (uint64_t)(uint32_t)stride, (uint64_t)(uint32_t)surface_depth);
        boxdroid_m5_diag_vram_sample("qemu-vga-display-surface",
            framebuffer_start, params.line_offset, stride, surface_width_px,
            surface_height_px, surface_depth, surface_data(surface),
            (size_t)stride * surface_height_px);
    }
    /* Flush the current NV2A Vulkan scanout surface into shared Xbox VRAM.
     * With HAVE_EXTERNAL_MEMORY=0 this is Xemu's CPU-visible download path. */
    if (nv2a_get_framebuffer_surface() < 0) {
        nv2a_release_framebuffer_surface();
        return;
    }
    size_t display_surface_bytes = (size_t) stride * surface_height_px;
    uintptr_t surface_data_address = (uintptr_t) surface_data(surface);
    uintptr_t vram_begin = g_nv2a ? (uintptr_t) g_nv2a->vram_ptr : 0;
    uintptr_t vram_end = g_nv2a ? vram_begin + memory_region_size(g_nv2a->vram) : 0;
    bool direct_vram = g_nv2a && surface_data_address >= vram_begin &&
                       surface_data_address < vram_end;
    if (!__atomic_exchange_n(&diagnostic_display_surface_logged, true, __ATOMIC_RELAXED)) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
                            "M5_DISPLAY_SURFACE_FIRST format=0x%x stride=%d extent=%dx%d"
                            " flags=0x%x allocated=%d backing=%s share_handle=%d",
                            surface_format(surface), stride, surface_width_px,
                            surface_height_px, surface->flags,
                            surface_is_allocated(surface),
                            direct_vram ? "direct_vram" :
                                (surface_is_allocated(surface) ? "allocated_shadow" : "external"),
                            (int) surface->share_handle);
    }
    boxdroid_m5_diag_sample(BOXDROID_M5_SAMPLE_DISPLAY_SURFACE,
                            surface_data(surface), display_surface_bytes,
                            UINT64_MAX, direct_vram ? "direct-vram-before-pixman" :
                            "surface-before-pixman");

    rgba = g_malloc((size_t) surface_width_px * surface_height_px * 4);
    stride = surface_width_px * 4;
    converted = pixman_image_create_bits(PIXMAN_a8b8g8r8,
                                          surface_width_px,
                                          surface_height_px,
                                          (uint32_t *) rgba, stride);
    if (!converted) {
        g_free(rgba);
        nv2a_release_framebuffer_surface();
        return;
    }
    pixman_image_composite32(PIXMAN_OP_SRC, surface->image, NULL, converted,
                             0, 0, 0, 0, 0, 0,
                             surface_width_px, surface_height_px);
    nv2a_release_framebuffer_surface();
    for (size_t i = 0; i < (size_t) stride * surface_height_px; ++i) {
        frame_hash ^= rgba[i];
        frame_hash *= UINT64_C(1099511628211);
    }
    for (size_t i = 0; i < (size_t) surface_width_px * surface_height_px; ++i) {
        if (rgba[i * 4] || rgba[i * 4 + 1] || rgba[i * 4 + 2]) {
            nonblack_pixels++;
        }
    }
    boxdroid_m5_diag_sample(BOXDROID_M5_SAMPLE_PIXMAN_RGBA, rgba,
                            (size_t) stride * surface_height_px,
                            nonblack_pixels, "after-pixman-copy");
    if (boxdroid_android_present_rgba(rgba, surface_width_px,
                                      surface_height_px, stride)) {
        guest_frame_count++;
        boxdroid_m5_diag_event(BOXDROID_M5_DIAG_FRAME_PRESENT,
                               guest_frame_count, frame_hash,
                               surface_width_px, surface_height_px,
                               nonblack_pixels, 0);
        if (guest_frame_count == 1 || guest_frame_count % 120 == 0) {
            __android_log_print(ANDROID_LOG_INFO, TAG,
                                "XBOX_NV2A_FRAME_PRESENT count=%" PRIu64
                                " guest_extent=%dx%d pixel_hash=%016" PRIx64
                                " nonblack_pixels=%" PRIu64,
                                guest_frame_count, surface_width_px,
                                surface_height_px, frame_hash, nonblack_pixels);
        }
    }
    pixman_image_unref(converted);
    g_free(rgba);
}

static void xbox_display_refresh(DisplayChangeListener *dcl)
{
    int64_t now_us;
    boxdroid_m5_diag_event(BOXDROID_M5_DIAG_REFRESH_CALLBACK,
                           qemu_clock_get_ms(QEMU_CLOCK_REALTIME), 0, 0, 0, 0, 0);
    graphic_hw_update(dcl->con);
    boxdroid_m5_diag_event(BOXDROID_M5_DIAG_GRAPHIC_HW_UPDATE,
                           qemu_clock_get_ms(QEMU_CLOCK_REALTIME), 0, 0, 0, 0, 0);
    now_us = g_get_monotonic_time();
    if (now_us - m5_fb_periodic_sample_us >= G_USEC_PER_SEC) {
        m5_fb_periodic_sample_us = now_us;
        if (g_nv2a) {
            DisplaySurface *surface = qemu_console_surface(dcl->con);
            VGADisplayParams params;
            boxdroid_m5_diag_framebuffer_sample("raw-vram",
                g_nv2a->pcrtc.start, g_nv2a->vram_ptr + M5_RAW_FB_BASE,
                M5_RAW_FB_SIZE);
            g_nv2a->vga.get_params(&g_nv2a->vga, &params);
            __android_log_print(ANDROID_LOG_INFO, TAG,
                "M5_VGA_MODE pcrtc=0x%" PRIx64 " start=0x%x"
                " pitch=%u depth=%d cr28=0x%x extent=%dx%d",
                g_nv2a->pcrtc.start, params.start_addr * 4,
                params.line_offset, g_nv2a->vga.get_bpp(&g_nv2a->vga),
                g_nv2a->vga.cr[0x28],
                surface ? surface_width(surface) : 0,
                surface ? surface_height(surface) : 0);
            if (surface && surface->image &&
                (uint64_t)params.start_addr * 4 == M5_RAW_FB_BASE &&
                surface_stride(surface) * surface_height(surface) >=
                    (int)M5_RAW_FB_SIZE) {
                boxdroid_m5_diag_framebuffer_sample("qemu-vga",
                    g_nv2a->pcrtc.start, surface_data(surface),
                    (size_t)surface_stride(surface) * surface_height(surface));
            }
        }
    }
}

static const DisplayChangeListenerOps xbox_display_ops = {
    .dpy_name = "BoxDroid Android Vulkan",
    .dpy_refresh = xbox_display_refresh,
    .dpy_gfx_update = xbox_display_update,
};
static DisplayChangeListener xbox_display_listener = {
    .update_interval = GUI_REFRESH_INTERVAL_DEFAULT,
    .ops = &xbox_display_ops,
};

void boxdroid_m5_diag_event(BoxDroidM5Diagnostic event,
                            uint64_t a, uint64_t b, uint64_t c,
                            uint64_t d, uint64_t e, uint64_t f)
{
    uint64_t previous;

    if ((unsigned) event >= BOXDROID_M5_DIAG_COUNT) {
        return;
    }
    previous = __atomic_fetch_add(&diagnostic_counts[event], 1, __ATOMIC_RELAXED);
    if (previous != 0) {
        return;
    }

    switch (event) {
    case BOXDROID_M5_DIAG_REFRESH_CALLBACK:
        __android_log_print(ANDROID_LOG_INFO, TAG, "M5_REFRESH_FIRST time_ms=%" PRIu64, a);
        break;
    case BOXDROID_M5_DIAG_GRAPHIC_HW_UPDATE:
        __android_log_print(ANDROID_LOG_INFO, TAG, "M5_GRAPHIC_HW_UPDATE_FIRST time_ms=%" PRIu64, a);
        break;
    case BOXDROID_M5_DIAG_PCRTC_START:
        __android_log_print(ANDROID_LOG_INFO, TAG, "M5_PCRTC_START_FIRST value=0x%" PRIx64, a);
        break;
    case BOXDROID_M5_DIAG_VGA_CRTC_WRITE:
        __android_log_print(ANDROID_LOG_INFO, TAG,
                            "M5_VGA_CRTC_WRITE_FIRST register=0x%" PRIx64 " value=0x%" PRIx64, a, b);
        break;
    case BOXDROID_M5_DIAG_PGRAPH_COLOR_DMA:
    case BOXDROID_M5_DIAG_PGRAPH_SURFACE_FORMAT:
    case BOXDROID_M5_DIAG_PGRAPH_SURFACE_PITCH:
    case BOXDROID_M5_DIAG_PGRAPH_COLOR_OFFSET:
    {
        const char *name = event == BOXDROID_M5_DIAG_PGRAPH_COLOR_DMA ? "color_dma" :
                           event == BOXDROID_M5_DIAG_PGRAPH_SURFACE_FORMAT ? "surface_format" :
                           event == BOXDROID_M5_DIAG_PGRAPH_SURFACE_PITCH ? "surface_pitch" :
                           "color_offset";
        __android_log_print(ANDROID_LOG_INFO, TAG,
                            "M5_PGRAPH_SETUP_FIRST event=%s method=0x%" PRIx64 " value=0x%" PRIx64,
                            name, a, b);
        break;
    }
    case BOXDROID_M5_DIAG_COLOR_BINDING:
        __android_log_print(ANDROID_LOG_INFO, TAG,
                            "M5_COLOR_BINDING_FIRST address=0x%" PRIx64 " size=%" PRIu64
                            " pitch=%" PRIu64 " width=%" PRIu64 " height=%" PRIu64,
                            a, b, c, d, e);
        break;
    case BOXDROID_M5_DIAG_FRAMEBUFFER_LOOKUP:
        __android_log_print(ANDROID_LOG_INFO, TAG,
                            "M5_FRAMEBUFFER_LOOKUP_FIRST address=0x%" PRIx64
                            " pitch=%" PRIu64 " width=%" PRIu64 " height=%" PRIu64,
                            a, b, c, d);
        break;
    case BOXDROID_M5_DIAG_FRAMEBUFFER_HIT:
        __android_log_print(ANDROID_LOG_INFO, TAG,
                            "M5_FRAMEBUFFER_HIT_FIRST address=0x%" PRIx64 " binding=0x%" PRIx64
                            "+0x%" PRIx64 " pitch=%" PRIu64 " extent=%" PRIu64 "x%" PRIu64,
                            a, b, c, d, e, f);
        break;
    case BOXDROID_M5_DIAG_FRAMEBUFFER_MISS:
        if (b == UINT64_MAX) {
            __android_log_print(ANDROID_LOG_WARN, TAG,
                                "NV2A_SCANOUT_SURFACE_MISSING first=1 address=0x%" PRIx64
                                " binding=none pitch=%" PRIu64 " extent=%" PRIu64 "x%" PRIu64,
                                a, d, e, f);
        } else {
            __android_log_print(ANDROID_LOG_WARN, TAG,
                                "NV2A_SCANOUT_SURFACE_MISSING first=1 address=0x%" PRIx64
                                " binding=0x%" PRIx64 "+0x%" PRIx64
                                " pitch=%" PRIu64 " extent=%" PRIu64 "x%" PRIu64,
                                a, b, c, d, e, f);
        }
        break;
    case BOXDROID_M5_DIAG_READBACK_BEGIN:
    case BOXDROID_M5_DIAG_READBACK_COMPLETE:
        __android_log_print(ANDROID_LOG_INFO, TAG,
                            "%s first=1 extent=%" PRIu64 "x%" PRIu64,
                            event == BOXDROID_M5_DIAG_READBACK_BEGIN ?
                                "NV2A_SCANOUT_READBACK_BEGIN" :
                                "NV2A_SCANOUT_READBACK_COMPLETE", a, b);
        break;
    case BOXDROID_M5_DIAG_DISPLAY_CALLBACK:
        __android_log_print(ANDROID_LOG_INFO, TAG,
                            "M5_DISPLAY_CALLBACK_FIRST rect=%" PRIu64 ",%" PRIu64 ",%" PRIu64 "x%" PRIu64,
                            a, b, c, d);
        break;
    case BOXDROID_M5_DIAG_FRAME_PRESENT:
        __android_log_print(ANDROID_LOG_INFO, TAG,
                            "M5_REAL_FRAME_PRESENT_FIRST count=%" PRIu64
                            " hash=%016" PRIx64 " extent=%" PRIu64 "x%" PRIu64
                            " nonblack_pixels=%" PRIu64,
                            a, b, c, d, e);
        break;
    case BOXDROID_M5_DIAG_DOWNLOAD_WAIT:
        __android_log_print(ANDROID_LOG_INFO, TAG, "M5_DOWNLOAD_WAIT_FIRST");
        break;
    case BOXDROID_M5_DIAG_DOWNLOAD_DIRTY:
        __android_log_print(ANDROID_LOG_INFO, TAG, "M5_DOWNLOAD_DIRTY_FIRST");
        break;
    case BOXDROID_M5_DIAG_DOWNLOAD_REQUESTED:
        __android_log_print(ANDROID_LOG_INFO, TAG, "M5_DOWNLOAD_REQUESTED_FIRST");
        break;
    case BOXDROID_M5_DIAG_DOWNLOAD_SKIPPED:
        __android_log_print(ANDROID_LOG_INFO, TAG, "M5_DOWNLOAD_SKIPPED_FIRST");
        break;
    case BOXDROID_M5_DIAG_DOWNLOAD_PERFORMED:
        __android_log_print(ANDROID_LOG_INFO, TAG, "M5_DOWNLOAD_PERFORMED_FIRST");
        break;
    case BOXDROID_M5_DIAG_COUNT:
        break;
    }
}

static void boxdroid_m5_diag_value_summary(void)
{
    BoxDroidM5ValueWrite first_after[M5_VALUE_LOG_CAP];
    BoxDroidM5ValueWrite first_nonzero[M5_VALUE_LOG_CAP];
    BoxDroidM5ValueWrite last_nonzero[M5_VALUE_LOG_CAP];
    uint64_t count, zero, nonzero, zero_bytes, nonzero_bytes, large;
    uint64_t after_switch, after_zero, after_nonzero;
    uint64_t first_nonzero_us, unique_bytes, unique_words;
    uint64_t first_after_count, first_nonzero_count, last_nonzero_count;

    pthread_mutex_lock(&m5_vram_write_lock);
    count = m5_value_count;
    zero = m5_value_zero;
    nonzero = m5_value_nonzero;
    zero_bytes = m5_value_zero_bytes;
    nonzero_bytes = m5_value_nonzero_bytes;
    large = m5_value_large;
    after_switch = m5_value_after_switch;
    after_zero = m5_value_after_zero;
    after_nonzero = m5_value_after_nonzero;
    first_nonzero_us = m5_value_first_nonzero_us;
    unique_bytes = m5_value_unique_bytes;
    unique_words = m5_value_unique_words;
    first_after_count = m5_value_first_after_count;
    first_nonzero_count = m5_value_first_nonzero_count;
    last_nonzero_count = m5_value_last_nonzero_count;
    memcpy(first_after, m5_value_first_after, sizeof(first_after));
    memcpy(first_nonzero, m5_value_first_nonzero, sizeof(first_nonzero));
    memcpy(last_nonzero, m5_value_last_nonzero, sizeof(last_nonzero));
    pthread_mutex_unlock(&m5_vram_write_lock);

    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_VALUE_SUMMARY classified=%" PRIu64 " zero=%" PRIu64
        " nonzero=%" PRIu64 " zero_bytes=%" PRIu64
        " nonzero_bytes=%" PRIu64 " large_unclassified=%" PRIu64
        " after_pcrtc_3c=%" PRIu64 " after_zero=%" PRIu64
        " after_nonzero=%" PRIu64 " unique_bytes=%" PRIu64
        " unique_words=%" PRIu64 " first_nonzero_mono_us=%" PRIu64,
        count, zero, nonzero, zero_bytes, nonzero_bytes, large,
        after_switch, after_zero, after_nonzero,
        unique_bytes, unique_words, first_nonzero_us);
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_VALUE_RECORD_COUNTS first_after=%" PRIu64
        " first_nonzero=%" PRIu64 " last_nonzero_total=%" PRIu64,
        first_after_count, first_nonzero_count, last_nonzero_count);
    for (unsigned int group = 0; group < 3; ++group) {
        BoxDroidM5ValueWrite *entries = group == 0 ? first_after :
            (group == 1 ? first_nonzero : last_nonzero);
        uint64_t total = group == 0 ? first_after_count :
            (group == 1 ? first_nonzero_count : last_nonzero_count);
        uint64_t count_to_log = MIN(total, M5_VALUE_LOG_CAP);
        uint64_t start = group == 2 && total > M5_VALUE_LOG_CAP ?
            total % M5_VALUE_LOG_CAP : 0;
        const char *label = group == 0 ? "FIRST_AFTER_PCRTC" :
            (group == 1 ? "FIRST_NONZERO" : "LAST_NONZERO");
        for (uint64_t i = 0; i < count_to_log; i += 4) {
            char message[2048];
            size_t used = g_snprintf(message, sizeof(message),
                                     "M5_VALUE_%s", label);
            for (uint64_t j = i; j < MIN(i + 4, count_to_log); ++j) {
                BoxDroidM5ValueWrite *entry =
                    &entries[(start + j) % M5_VALUE_LOG_CAP];
                uint64_t relative = entry->address - M5_RAW_FB_BASE;
                uint64_t x = (relative % M5_RAW_FB_PITCH) / 4;
                uint64_t y = relative / M5_RAW_FB_PITCH;
                int written = g_snprintf(message + used, sizeof(message) - used,
                    " [%" PRIu64 ",s=%" PRIu64 ",t=%" PRId64
                    ",pc=%" PRIx64 ",a=%" PRIx64 ",n=%u,o=%" PRIx64
                    ",xy=%" PRIu64 ":%" PRIu64 ",old=%" PRIx64
                    ",new=%" PRIx64 ",c=%u]",
                    j, entry->sequence, entry->pre_store_us,
                    entry->guest_pc, entry->address, entry->size,
                    relative, x, y, entry->before, entry->after,
                    entry->change);
                if (written < 0 || (size_t)written >= sizeof(message) - used) {
                    break;
                }
                used += written;
            }
            __android_log_print(ANDROID_LOG_INFO, TAG, "%s", message);
        }
    }
}

void boxdroid_m5_diag_summary(void)
{
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_DIAG_SUMMARY refresh=%" PRIu64 " gfx_update=%" PRIu64
        " display_callback=%" PRIu64 " real_present=%" PRIu64,
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_REFRESH_CALLBACK], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_GRAPHIC_HW_UPDATE], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_DISPLAY_CALLBACK], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_FRAME_PRESENT], __ATOMIC_RELAXED));
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_DIAG_NV2A pcrtc_start=%" PRIu64 " vga_crtc=%" PRIu64
        " color_dma=%" PRIu64 " format=%" PRIu64 " pitch=%" PRIu64
        " color_offset=%" PRIu64 " color_binding=%" PRIu64,
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_PCRTC_START], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_VGA_CRTC_WRITE], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_PGRAPH_COLOR_DMA], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_PGRAPH_SURFACE_FORMAT], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_PGRAPH_SURFACE_PITCH], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_PGRAPH_COLOR_OFFSET], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_COLOR_BINDING], __ATOMIC_RELAXED));
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_DIAG_SCANOUT lookup=%" PRIu64 " hit=%" PRIu64 " miss=%" PRIu64
        " readback_begin=%" PRIu64 " readback_complete=%" PRIu64,
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_FRAMEBUFFER_LOOKUP], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_FRAMEBUFFER_HIT], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_FRAMEBUFFER_MISS], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_READBACK_BEGIN], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_READBACK_COMPLETE], __ATOMIC_RELAXED));
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_DIAG_DOWNLOAD wait=%" PRIu64 " dirty=%" PRIu64
        " requested=%" PRIu64 " skipped=%" PRIu64 " performed=%" PRIu64,
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_DOWNLOAD_WAIT], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_DOWNLOAD_DIRTY], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_DOWNLOAD_REQUESTED], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_DOWNLOAD_SKIPPED], __ATOMIC_RELAXED),
        __atomic_load_n(&diagnostic_counts[BOXDROID_M5_DIAG_DOWNLOAD_PERFORMED], __ATOMIC_RELAXED));
    if (g_nv2a) {
        boxdroid_m5_diag_target_vram_sample("45s-stop",
            g_nv2a->vram_ptr, memory_region_size(g_nv2a->vram),
            __atomic_load_n(&m5_diagnostic_sequence, __ATOMIC_RELAXED));
        boxdroid_m5_diag_framebuffer_sample("raw-vram-stop",
            g_nv2a->pcrtc.start, g_nv2a->vram_ptr + M5_RAW_FB_BASE,
            M5_RAW_FB_SIZE);
    }
    BoxDroidM5FramebufferWrite first_writes[M5_FB_WRITE_LOG_CAP];
    BoxDroidM5FramebufferWrite last_writes[M5_FB_WRITE_LOG_CAP];
    BoxDroidM5FramebufferSamples samples[2];
    uint64_t write_count, write_bytes;
    int64_t first_write_us;
    char first_writer[32], last_writer[32];
    pthread_mutex_lock(&m5_vram_write_lock);
    write_count = m5_fb_write_count;
    write_bytes = m5_fb_write_bytes;
    first_write_us = m5_fb_first_write_us;
    g_strlcpy(first_writer, m5_fb_first_writer, sizeof(first_writer));
    g_strlcpy(last_writer, m5_fb_last_writer, sizeof(last_writer));
    memcpy(first_writes, m5_fb_first_writes, sizeof(first_writes));
    memcpy(last_writes, m5_fb_last_writes, sizeof(last_writes));
    pthread_mutex_unlock(&m5_vram_write_lock);
    pthread_mutex_lock(&m5_fb_sample_lock);
    memcpy(samples, m5_fb_samples, sizeof(samples));
    pthread_mutex_unlock(&m5_fb_sample_lock);
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_FB_WRITE_SUMMARY range=[0x%" PRIx64 ",0x%" PRIx64 ")"
        " pitch=%u extent=%ux%u count=%" PRIu64 " overlap_bytes=%" PRIu64
        " first_writer=%s first_mono_us=%" PRId64 " last_writer=%s",
        M5_RAW_FB_BASE, M5_RAW_FB_BASE + M5_RAW_FB_SIZE, M5_RAW_FB_PITCH,
        M5_RAW_FB_WIDTH, M5_RAW_FB_HEIGHT, write_count, write_bytes,
        first_writer[0] ? first_writer : "none", first_write_us,
        last_writer[0] ? last_writer : "none");
    for (size_t i = 0; i < MIN(write_count, M5_FB_WRITE_LOG_CAP); ++i) {
        const BoxDroidM5FramebufferWrite *event = &first_writes[i];
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_FB_WRITE_FIRST index=%zu seq=%" PRIu64
            " mono_us=%" PRId64 " writer=%s address=0x%" PRIx64
            " bytes=%" PRIu64 " overlap_bytes=%" PRIu64
            " source=0x%" PRIx64 " guest_pc=0x%" PRIx64,
            i, event->sequence, event->timestamp_us, event->writer,
            event->address, event->bytes, event->overlap_bytes,
            event->source, event->guest_pc);
    }
    size_t last_count = MIN(write_count, M5_FB_WRITE_LOG_CAP);
    size_t last_start = write_count >= M5_FB_WRITE_LOG_CAP ?
        write_count % M5_FB_WRITE_LOG_CAP : 0;
    for (size_t i = 0; i < last_count; ++i) {
        const BoxDroidM5FramebufferWrite *event =
            &last_writes[(last_start + i) % M5_FB_WRITE_LOG_CAP];
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_FB_WRITE_LAST index=%zu seq=%" PRIu64
            " mono_us=%" PRId64 " writer=%s address=0x%" PRIx64
            " bytes=%" PRIu64 " overlap_bytes=%" PRIu64
            " source=0x%" PRIx64 " guest_pc=0x%" PRIx64,
            i, event->sequence, event->timestamp_us, event->writer,
            event->address, event->bytes, event->overlap_bytes,
            event->source, event->guest_pc);
    }
    for (size_t i = 0; i < ARRAY_SIZE(samples); ++i) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_FB_SAMPLE_SUMMARY boundary=%s samples=%" PRIu64
            " nonzero_samples=%" PRIu64 " rgb_samples=%" PRIu64
            " first_nonzero_mono_us=%" PRId64
            " first_rgb_mono_us=%" PRId64 " last_mono_us=%" PRId64
            " last_nonzero_bytes=%" PRIu64 " last_rgb_pixels=%" PRIu64,
            i == 0 ? "raw-vram" : "qemu-vga", samples[i].samples,
            samples[i].nonzero_samples, samples[i].rgb_samples,
            samples[i].first_nonzero_us, samples[i].first_rgb_us,
            samples[i].last_sample_us, samples[i].last_nonzero_bytes,
            samples[i].last_rgb_pixels);
    }
    boxdroid_m5_diag_value_summary();
    pthread_mutex_lock(&m5_order_lock);
    if (m5_have_pgraph_target) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_PGRAPH_LAST_TARGET seq=%" PRIu64 " mono_us=%" PRId64
            " method=0x%" PRIx64 " raw=0x%" PRIx64
            " dma_base=0x%" PRIx64 " target=0x%" PRIx64
            " pitch=0x%" PRIx64 " format=0x%" PRIx64,
            m5_last_pgraph_target_seq, m5_last_pgraph_target_time,
            m5_last_pgraph_target[0], m5_last_pgraph_target[1],
            m5_last_pgraph_target[2], m5_last_pgraph_target[3],
            m5_last_pgraph_target[4], m5_last_pgraph_target[5]);
    }
    if (m5_have_pgraph_extent) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_PGRAPH_LAST_EXTENT seq=%" PRIu64 " mono_us=%" PRId64
            " width=%" PRIu64 " height=%" PRIu64 " type=%" PRIu64
            " dma_limit=0x%" PRIx64,
            m5_last_pgraph_extent_seq, m5_last_pgraph_extent_time,
            m5_last_pgraph_extent[0], m5_last_pgraph_extent[1],
            m5_last_pgraph_extent[2], m5_last_pgraph_extent[3]);
    }
    pthread_mutex_unlock(&m5_order_lock);
    boxdroid_m5_diag_binding_summary_all();
}

void boxdroid_m5_diag_binding(const BoxDroidM5BindingInfo *info)
{
    if (__atomic_exchange_n(&diagnostic_binding_logged, true, __ATOMIC_RELAXED)) {
        return;
    }
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_SCANOUT_BINDING_FIRST pcrtc=0x%" PRIx64 " line_offset=0x%" PRIx64
        " lookup=0x%" PRIx64 " range=[0x%" PRIx64 ",0x%" PRIx64 ")"
        " delta=0x%" PRIx64 " pitch=%" PRIu64 " extent=%" PRIu64 "x%" PRIu64
        " format=0x%" PRIx64 " vk_format=%" PRIu64
        " generation=%" PRIu64 " image=0x%" PRIx64 " view=0x%" PRIx64
        " layout=%" PRIu64 " draw_dirty=%d"
        " upload_pending=%d initialized=%d cleared=%d frame_time=%" PRId64
        " draw_time=%" PRId64,
        info->pcrtc_start, info->line_offset, info->lookup_address,
        info->binding_base, info->binding_end, info->delta,
        info->pitch, info->width, info->height, info->color_format,
        info->host_vk_format, info->generation, info->image, info->image_view,
        info->image_layout, info->draw_dirty, info->upload_pending,
        info->initialized, info->cleared, info->frame_time, info->draw_time);
}

void boxdroid_m5_diag_late_miss(uint64_t pcrtc_start, uint64_t line_offset,
                                uint64_t lookup_address,
                                const BoxDroidM5BindingInfo *nearest,
                                const BoxDroidM5BindingInfo *binding_32a4000,
                                const BoxDroidM5BindingInfo *binding_3628000)
{
    if (__atomic_exchange_n(&diagnostic_late_miss_logged, true, __ATOMIC_RELAXED)) {
        return;
    }
    if (nearest) {
        __android_log_print(ANDROID_LOG_WARN, TAG,
            "M5_SCANOUT_LATE_MISS_FIRST pcrtc=0x%" PRIx64 " line_offset=0x%" PRIx64
            " lookup=0x%" PRIx64 " nearest=[0x%" PRIx64 ",0x%" PRIx64 ")"
            " pitch=%" PRIu64 " extent=%" PRIu64 "x%" PRIu64 " format=0x%" PRIx64,
            pcrtc_start, line_offset, lookup_address, nearest->binding_base,
            nearest->binding_end, nearest->pitch, nearest->width, nearest->height,
            nearest->color_format);
    } else {
        __android_log_print(ANDROID_LOG_WARN, TAG,
            "M5_SCANOUT_LATE_MISS_FIRST pcrtc=0x%" PRIx64 " line_offset=0x%" PRIx64
            " lookup=0x%" PRIx64 " nearest=none",
            pcrtc_start, line_offset, lookup_address);
    }
    if (binding_32a4000) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_SCANOUT_MISS_BINDING base=0x32a4000 generation=%" PRIu64
            " range=[0x%" PRIx64 ",0x%" PRIx64 ") pitch=%" PRIu64
            " extent=%" PRIu64 "x%" PRIu64 " format=0x%" PRIx64
            " image=0x%" PRIx64 " draw_dirty=%d upload_pending=%d",
            binding_32a4000->generation, binding_32a4000->binding_base,
            binding_32a4000->binding_end, binding_32a4000->pitch,
            binding_32a4000->width, binding_32a4000->height,
            binding_32a4000->color_format, binding_32a4000->image,
            binding_32a4000->draw_dirty, binding_32a4000->upload_pending);
    }
    if (binding_3628000) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_SCANOUT_MISS_BINDING base=0x3628000 generation=%" PRIu64
            " range=[0x%" PRIx64 ",0x%" PRIx64 ") pitch=%" PRIu64
            " extent=%" PRIu64 "x%" PRIu64 " format=0x%" PRIx64
            " image=0x%" PRIx64 " draw_dirty=%d upload_pending=%d",
            binding_3628000->generation, binding_3628000->binding_base,
            binding_3628000->binding_end, binding_3628000->pitch,
            binding_3628000->width, binding_3628000->height,
            binding_3628000->color_format, binding_3628000->image,
            binding_3628000->draw_dirty, binding_3628000->upload_pending);
    }
}

void boxdroid_m5_diag_track_surface(const void *surface)
{
    __atomic_store_n(&diagnostic_scanout_surface, surface, __ATOMIC_RELAXED);
}

bool boxdroid_m5_diag_is_tracked_surface(const void *surface)
{
    return __atomic_load_n(&diagnostic_scanout_surface, __ATOMIC_RELAXED) == surface;
}

void boxdroid_m5_diag_sample(BoxDroidM5SampleBoundary boundary,
                             const void *data, size_t size,
                             uint64_t nonblack_pixels,
                             const char *copy_status)
{
    static const char *const names[BOXDROID_M5_SAMPLE_COUNT] = {
        "nv2a_staging", "xbox_vram", "display_surface", "pixman_rgba",
    };
    const size_t limit = 4 * 1024 * 1024;
    size_t sample_size = MIN(size, limit);
    uint64_t hash = UINT64_C(1469598103934665603);
    uint64_t nonzero_bytes = 0;
    const uint8_t *bytes = data;

    if ((unsigned) boundary >= BOXDROID_M5_SAMPLE_COUNT || !data ||
        __atomic_exchange_n(&diagnostic_sample_counts[boundary], 1, __ATOMIC_RELAXED)) {
        return;
    }
    for (size_t i = 0; i < sample_size; ++i) {
        hash ^= bytes[i];
        hash *= UINT64_C(1099511628211);
        nonzero_bytes += bytes[i] != 0;
    }
    if (nonblack_pixels == UINT64_MAX) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_SAMPLE_FIRST boundary=%s sample_bytes=%zu total_bytes=%zu"
            " nonzero_bytes=%" PRIu64 " nonblack_pixels=n/a"
            " hash=%016" PRIx64 " status=%s",
            names[boundary], sample_size, size, nonzero_bytes, hash, copy_status);
    } else {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_SAMPLE_FIRST boundary=%s sample_bytes=%zu total_bytes=%zu"
            " nonzero_bytes=%" PRIu64 " nonblack_pixels=%" PRIu64
            " hash=%016" PRIx64 " status=%s",
            names[boundary], sample_size, size, nonzero_bytes, nonblack_pixels,
            hash, copy_status);
    }
}

void boxdroid_m5_diag_binding_event(BoxDroidM5BindingEvent event,
                                    uint64_t base, uint64_t generation,
                                    const uint64_t values[8])
{
    BoxDroidM5BindingJournal *journal = NULL;
    bool first, order_log = false, after_switch = false;
    uint64_t event_count = 0;

    if ((unsigned) event >= BOXDROID_M5_BINDING_EVENT_COUNT || !values ||
        (base != UINT64_C(0x32a4000) && base != UINT64_C(0x3628000) &&
         base != UINT64_C(0x3d00000))) {
        return;
    }

    pthread_mutex_lock(&binding_journal_lock);
    for (size_t i = 0; i < binding_journal_count; ++i) {
        if (binding_journal[i].base == base &&
            binding_journal[i].generation == generation) {
            journal = &binding_journal[i];
            break;
        }
    }
    if (!journal && binding_journal_count < ARRAY_SIZE(binding_journal)) {
        journal = &binding_journal[binding_journal_count++];
        memset(journal, 0, sizeof(*journal));
        journal->base = base;
        journal->generation = generation;
    }
    if (!journal) {
        pthread_mutex_unlock(&binding_journal_lock);
        return;
    }

    if (event == BOXDROID_M5_BINDING_SCANOUT &&
        journal->counts[BOXDROID_M5_BINDING_SCANOUT] == 0) {
        journal->before_scanout_event = journal->last_event;
        memcpy(journal->before_scanout_operation, journal->last_operation,
               sizeof(journal->before_scanout_operation));
    }

    first = !(journal->first_logged & (UINT32_C(1) << event));
    journal->first_logged |= UINT32_C(1) << event;
    journal->counts[event]++;
    event_count = journal->counts[event];
    memcpy(journal->last_values[event], values, sizeof(journal->last_values[event]));

    if (base == UINT64_C(0x3d00000) && event != BOXDROID_M5_BINDING_SCANOUT) {
        after_switch = __atomic_load_n(&m5_pcrtc_3c_seen, __ATOMIC_RELAXED);
        if (first || (after_switch &&
            !(journal->after_switch_logged & (UINT32_C(1) << event)))) {
            order_log = true;
            if (after_switch) {
                journal->after_switch_logged |= (UINT32_C(1) << event);
            }
        }
    }

    if (event != BOXDROID_M5_BINDING_SCANOUT) {
        journal->last_event = event;
        memcpy(journal->last_operation, values, sizeof(journal->last_operation));
    }
    pthread_mutex_unlock(&binding_journal_lock);

    if (order_log) {
        boxdroid_m5_diag_record(after_switch ? "BINDING_3D_AFTER_PCRTC" :
                                "BINDING_3D_BEFORE_PCRTC",
            base, generation, event, event_count, values[0], values[1]);
    }

    if (!first || event == BOXDROID_M5_BINDING_SCANOUT) {
        return;
    }

    switch (event) {
    case BOXDROID_M5_BINDING_CREATE:
    case BOXDROID_M5_BINDING_REUSE:
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_BINDING_%s_FIRST base=0x%" PRIx64 " generation=%" PRIu64
            " image=0x%" PRIx64 " view=0x%" PRIx64 " extent=%" PRIu64 "x%" PRIu64
            " pitch=%" PRIu64 " format=%" PRIu64 " image_reused=%" PRIu64
            " initialized=%" PRIu64,
            binding_event_names[event], base, generation, values[0], values[1],
            values[2], values[3], values[4], values[5], values[6], values[7]);
        break;
    case BOXDROID_M5_BINDING_UPLOAD_PENDING:
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_BINDING_UPLOAD_PENDING_FIRST base=0x%" PRIx64 " generation=%" PRIu64
            " old=%" PRIu64 " new=%" PRIu64 " cause=%" PRIu64,
            base, generation, values[0], values[1], values[2]);
        break;
    case BOXDROID_M5_BINDING_UPLOAD:
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_BINDING_UPLOAD_FIRST base=0x%" PRIx64 " generation=%" PRIu64
            " source_hash=%016" PRIx64 " hashed_bytes=%" PRIu64
            " bytes_per_pixel=%" PRIu64 " swizzle=%" PRIu64,
            base, generation, values[0], values[1], values[2], values[3]);
        break;
    case BOXDROID_M5_BINDING_DRAW_DIRTY:
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_BINDING_DRAW_DIRTY_FIRST base=0x%" PRIx64 " generation=%" PRIu64
            " old=%" PRIu64 " new=%" PRIu64 " source=%" PRIu64,
            base, generation, values[0], values[1], values[2]);
        break;
    case BOXDROID_M5_BINDING_CLEAR:
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_BINDING_CLEAR_FIRST base=0x%" PRIx64 " generation=%" PRIu64
            " raw=0x%08" PRIx64 " rgba_bits=%08" PRIx64 ",%08" PRIx64 ",%08" PRIx64 ",%08" PRIx64
            " rect=%" PRIu64 ",%" PRIu64 "+%" PRIu64 "x%" PRIu64
            " channels=0x%" PRIx64,
            base, generation, values[0], values[1], values[2], values[3], values[4],
            values[5] >> 32, values[5] & UINT32_MAX, values[6] >> 32,
            values[6] & UINT32_MAX, values[7]);
        break;
    case BOXDROID_M5_BINDING_GUEST_DRAW:
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_BINDING_GUEST_DRAW_FIRST base=0x%" PRIx64 " generation=%" PRIu64
            " api=%" PRIu64 " primitive=%" PRIu64 " vertices=%" PRIu64
            " indices=%" PRIu64 " color_mask=0x%" PRIx64
            " scissor=%" PRIu64 ",%" PRIu64 "+%" PRIu64 "x%" PRIu64
            " cull=%" PRIu64 " depth=%" PRIu64 " stencil=%" PRIu64
            " depth_write=%" PRIu64,
            base, generation, values[0], values[1], values[2], values[3], values[4],
            values[5] >> 32, values[5] & UINT32_MAX, values[6] >> 32,
            values[6] & UINT32_MAX, values[7] & 0xff, (values[7] >> 8) & 0xff,
            (values[7] >> 16) & 0xff, (values[7] >> 24) & 0xff);
        break;
    case BOXDROID_M5_BINDING_GPU_PROBE:
    case BOXDROID_M5_BINDING_STAGING_COMPARE:
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_BINDING_%s_FIRST base=0x%" PRIx64 " generation=%" PRIu64
            " patch=%" PRIu64 "x%" PRIu64 " samples=%" PRIu64
            " nonblack=%" PRIu64 " hash=%016" PRIx64
            " format=%" PRIu64 " layout=%" PRIu64 " nonzero=%" PRIu64,
            binding_event_names[event], base, generation, values[0], values[1],
            values[2], values[3], values[4], values[5], values[6], values[7]);
        break;
    case BOXDROID_M5_BINDING_SCANOUT:
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_BINDING_SCANOUT_FIRST base=0x%" PRIx64 " generation=%" PRIu64
            " image=0x%" PRIx64 " view=0x%" PRIx64 " extent=%" PRIu64 "x%" PRIu64
            " pitch=%" PRIu64 " format=%" PRIu64 " draw_dirty=%" PRIu64
            " upload_pending=%" PRIu64 " layout=color_attachment_optimal(2)",
            base, generation, values[0], values[1], values[2], values[3],
            values[4], values[5], values[6], values[7]);
        break;
    case BOXDROID_M5_BINDING_EVENT_COUNT:
        break;
    }
}

static void boxdroid_m5_diag_binding_summary_all(void)
{
    pthread_mutex_lock(&binding_journal_lock);
    for (size_t i = 0; i < binding_journal_count; i++) {
        const BoxDroidM5BindingJournal *j = &binding_journal[i];
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_BINDING_SUMMARY base=0x%" PRIx64 " generation=%" PRIu64
            " create=%" PRIu64 " reuse=%" PRIu64 " upload_pending=%" PRIu64
            " uploads=%" PRIu64 " draw_dirty=%" PRIu64 " clears=%" PRIu64
            " guest_draws=%" PRIu64 " probes=%" PRIu64
            " staging_compare=%" PRIu64 " scanout=%" PRIu64
            " last_upload_hash=%016" PRIx64 " pre_scanout_op=%s"
            " last_values=%" PRIu64 ",%" PRIu64 ",%" PRIu64 ",%" PRIu64,
            j->base, j->generation,
            j->counts[BOXDROID_M5_BINDING_CREATE],
            j->counts[BOXDROID_M5_BINDING_REUSE],
            j->counts[BOXDROID_M5_BINDING_UPLOAD_PENDING],
            j->counts[BOXDROID_M5_BINDING_UPLOAD],
            j->counts[BOXDROID_M5_BINDING_DRAW_DIRTY],
            j->counts[BOXDROID_M5_BINDING_CLEAR],
            j->counts[BOXDROID_M5_BINDING_GUEST_DRAW],
            j->counts[BOXDROID_M5_BINDING_GPU_PROBE],
            j->counts[BOXDROID_M5_BINDING_STAGING_COMPARE],
            j->counts[BOXDROID_M5_BINDING_SCANOUT],
            j->last_values[BOXDROID_M5_BINDING_UPLOAD][0],
            binding_event_names[j->before_scanout_event],
            j->before_scanout_operation[0], j->before_scanout_operation[1],
            j->before_scanout_operation[2], j->before_scanout_operation[3]);
    }
    pthread_mutex_unlock(&binding_journal_lock);
}

static void log_message(int priority, const char *message)
{
    __android_log_write(priority, TAG, message);
}

void xemu_queue_notification(const char *message)
{
    __android_log_print(ANDROID_LOG_INFO, TAG, "XEMU_NOTIFICATION %s", message);
}

void xemu_queue_error_message(const char *message)
{
    __android_log_print(ANDROID_LOG_ERROR, TAG, "XEMU_ERROR %s", message);
}

void boxdroid_m5_diag_firmware_event(const char *kind, const char *stage,
                                    const char *path, int64_t result,
                                    uint64_t bytes)
{
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_FIRMWARE_%s stage=%s path=%s result=%" PRId64 " bytes=%" PRIu64,
        kind, stage, path ? path : "(null)", result, bytes);
}

void boxdroid_m5_diag_hdd_open(const char *path, int result,
                               uint64_t virtual_size)
{
    bool path_match = runtime_hdd_path && path &&
                      g_str_has_suffix(path, runtime_hdd_path);
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_HDD_QCOW2_OPEN result=%d path=%s expected=%s path_match=%d virtual_size=%" PRIu64,
        result, path ? path : "(null)", runtime_hdd_path ? runtime_hdd_path : "(unset)",
        path_match, virtual_size);
}

void boxdroid_m5_diag_guest_io_start(void)
{
    pthread_mutex_lock(&hdd_io_lock);
    hdd_io_enabled = true;
    pthread_mutex_unlock(&hdd_io_lock);
    __android_log_print(ANDROID_LOG_INFO, TAG,
                        "M5_HDD_GUEST_IO_WINDOW_START path=%s",
                        runtime_hdd_path ? runtime_hdd_path : "(unset)");
}

void boxdroid_m5_diag_guest_io_stop(void)
{
    pthread_mutex_lock(&hdd_io_lock);
    hdd_io_enabled = false;
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_HDD_GUEST_IO_SUMMARY path=%s reads=%" PRIu64
        " read_bytes=%" PRIu64 " read_failures=%" PRIu64
        " writes=%" PRIu64 " write_bytes=%" PRIu64
        " write_failures=%" PRIu64 " first_read_count=%zu",
        runtime_hdd_path ? runtime_hdd_path : "(unset)", hdd_read_requests,
        hdd_read_bytes, hdd_read_failures, hdd_write_requests, hdd_write_bytes,
        hdd_write_failures, hdd_first_read_count);
    for (size_t i = 0; i < hdd_first_read_count; i++) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_HDD_GUEST_READ_FIRST index=%zu offset=0x%" PRIx64 " bytes=%" PRIu64,
            i, hdd_first_reads[i].offset, hdd_first_reads[i].bytes);
    }
    pthread_mutex_unlock(&hdd_io_lock);
}

void boxdroid_m5_diag_hdd_io(bool write, const char *path, uint64_t offset,
                             uint64_t bytes, int result)
{
    bool path_match = runtime_hdd_path && path &&
                      g_str_has_suffix(path, runtime_hdd_path);
    pthread_mutex_lock(&hdd_io_lock);
    if (!hdd_io_enabled || !path_match) {
        pthread_mutex_unlock(&hdd_io_lock);
        return;
    }
    if (write) {
        hdd_write_requests++;
        if (result == 0) hdd_write_bytes += bytes;
        else hdd_write_failures++;
        if (hdd_write_requests == 1) {
            boxdroid_m5_diag_record("HDD_GUEST_WRITE_FIRST", offset, bytes,
                                    (uint64_t)(uint32_t)result, 0, 0, 0);
        }
    } else {
        hdd_read_requests++;
        if (result == 0) hdd_read_bytes += bytes;
        else hdd_read_failures++;
        if (hdd_first_read_count < G_N_ELEMENTS(hdd_first_reads)) {
            size_t index = hdd_first_read_count++;
            hdd_first_reads[index].offset = offset;
            hdd_first_reads[index].bytes = bytes;
            boxdroid_m5_diag_record("HDD_GUEST_READ", offset, bytes,
                                    (uint64_t)(uint32_t)result, index, 0, 0);
            __android_log_print(ANDROID_LOG_INFO, TAG,
                "M5_HDD_GUEST_READ_FIRST index=%zu offset=0x%" PRIx64
                " bytes=%" PRIu64 " result=%d", index, offset, bytes, result);
        }
    }
    pthread_mutex_unlock(&hdd_io_lock);
}

static void *run_xbox(void *unused)
{
    int status;
    (void) unused;

    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_QEMU_INPUT_PATHS bios=%s mcpx=%s hdd=%s machine_arg=%s hdd_arg=%s",
        arguments[4], runtime_mcpx_path, runtime_hdd_path,
        arguments[2], arguments[6]);
    log_message(ANDROID_LOG_INFO, "XEMU_QEMU_INIT_ENTER");
    qemu_init(g_strv_length(arguments), arguments);
    log_message(ANDROID_LOG_INFO, "XEMU_QEMU_INIT_RETURN");
    xbox_display_listener.con = qemu_console_lookup_by_index(0);
    if (xbox_display_listener.con) {
        register_displaychangelistener(&xbox_display_listener);
        log_message(ANDROID_LOG_INFO, "XBOX_DISPLAY_LISTENER_REGISTERED console=0");
    } else {
        log_message(ANDROID_LOG_WARN, "XBOX_DISPLAY_LISTENER_UNAVAILABLE console=0");
    }
    bql_unlock();
    replay_mutex_unlock();
    pthread_mutex_lock(&state_lock);
    init_succeeded = true;
    init_finished = true;
    pthread_cond_broadcast(&state_changed);
    pthread_mutex_unlock(&state_lock);

    replay_mutex_lock();
    bql_lock();
    log_message(ANDROID_LOG_INFO, "XBOX_MAIN_LOOP_START guest=i386 host=aarch64 tcg=on");
    boxdroid_m5_diag_guest_io_start();
    status = qemu_main_loop();
    __android_log_print(ANDROID_LOG_INFO, TAG,
                        "XBOX_QEMU_LOOP_RETURN status=%d", status);
    if (xbox_display_listener.ds) {
        unregister_displaychangelistener(&xbox_display_listener);
    }
    log_message(ANDROID_LOG_INFO, "XBOX_QEMU_CLEANUP_BEGIN");
    qemu_cleanup(status);
    log_message(ANDROID_LOG_INFO, "XBOX_QEMU_CLEANUP_COMPLETE");
    bql_unlock();
    replay_mutex_unlock();

    pthread_mutex_lock(&state_lock);
    loop_status = status;
    loop_finished = true;
    pthread_cond_broadcast(&state_changed);
    pthread_mutex_unlock(&state_lock);
    __android_log_print(ANDROID_LOG_INFO, TAG,
                        "XBOX_MAIN_LOOP_STOP status=%d", status);
    return NULL;
}

JNIEXPORT jint JNICALL
Java_org_boxdroid_m5_MainActivity_nativeXboxStart(JNIEnv *env, jobject self,
                                                   jstring bios, jstring mcpx,
                                                   jstring hdd, jstring log)
{
    const char *bios_path, *mcpx_path, *hdd_path, *log_path;
    (void) self;
    if (thread_created) return -EALREADY;
    bios_path = (*env)->GetStringUTFChars(env, bios, NULL);
    mcpx_path = (*env)->GetStringUTFChars(env, mcpx, NULL);
    hdd_path = (*env)->GetStringUTFChars(env, hdd, NULL);
    log_path = (*env)->GetStringUTFChars(env, log, NULL);
    if (!bios_path || !mcpx_path || !hdd_path || !log_path) return -EINVAL;
    if (access(bios_path, R_OK) || access(mcpx_path, R_OK) || access(hdd_path, R_OK)) {
        __android_log_print(ANDROID_LOG_ERROR, TAG,
                            "XBOX_INPUT_OPEN_FAIL errno=%d (%s)", errno, strerror(errno));
        return -errno;
    }
    arguments[0] = ARG("boxdroid-xemu");
    arguments[1] = ARG("-machine");
    arguments[2] = ARG("xbox,bootrom=BOXDROID_MCPX");
    arguments[3] = ARG("-bios");
    arguments[4] = (char *) bios_path;
    arguments[5] = ARG("-drive");
    arguments[6] = "file=BOXDROID_HDD,if=ide,index=0,media=disk,format=qcow2";
    arguments[7] = ARG("-drive");
    arguments[8] = ARG("if=ide,index=1,media=cdrom,file=");
    arguments[9] = ARG("-display");
    arguments[10] = ARG("none");
    arguments[11] = ARG("-serial");
    arguments[12] = ARG("none");
    arguments[13] = ARG("-monitor");
    arguments[14] = ARG("none");
    arguments[15] = ARG("-net");
    arguments[16] = ARG("none");
    arguments[17] = ARG("-accel");
    arguments[18] = ARG("tcg,thread=single");
    arguments[19] = ARG("-D");
    arguments[20] = (char *) log_path;
    arguments[21] = ARG("-d");
    arguments[22] = ARG("guest_errors,cpu_reset,exec");
    arguments[23] = ARG("-dfilter");
    arguments[24] = ARG("0x0..0x03ffffff,0x80000000..0x83ffffff,0xa0000000..0xa3ffffff,0xfff00000..0xffffffff");
    arguments[25] = ARG("-device");
    arguments[26] = NULL;
    arguments[27] = ARG("-m");
    arguments[28] = ARG("64");
    arguments[29] = ARG("-device");
    arguments[30] = ARG("usb-hub,port=1,ports=4");
    arguments[31] = NULL;
    arguments[32] = NULL;

    /* Replace placeholders after preserving the Java strings through qemu_init. */
    arguments[2] = g_strdup_printf("xbox,bootrom=%s,kernel-irqchip=off,avpack=scart", mcpx_path);
    arguments[6] = g_strdup_printf("file=%s,if=ide,index=0,media=disk,format=qcow2", hdd_path);
    g_free(runtime_mcpx_path);
    g_free(runtime_hdd_path);
    runtime_mcpx_path = g_strdup(mcpx_path);
    runtime_hdd_path = g_strdup(hdd_path);
    pthread_mutex_lock(&hdd_io_lock);
    hdd_read_requests = hdd_read_bytes = hdd_read_failures = 0;
    hdd_write_requests = hdd_write_bytes = hdd_write_failures = 0;
    hdd_first_read_count = 0;
    pthread_mutex_unlock(&hdd_io_lock);
    g_autofree gchar *app_private_dir = g_path_get_dirname(log_path);
    eeprom_path = g_strdup_printf("%s/m5-eeprom.bin", app_private_dir);
    Error *crypto_error = NULL;
    if (qcrypto_init(&crypto_error) < 0) {
        __android_log_print(ANDROID_LOG_ERROR, TAG, "XBOX_EEPROM_CRYPTO_INIT_FAIL %s",
                            error_get_pretty(crypto_error));
        error_free(crypto_error);
        (*env)->ReleaseStringUTFChars(env, bios, bios_path);
        (*env)->ReleaseStringUTFChars(env, mcpx, mcpx_path);
        (*env)->ReleaseStringUTFChars(env, hdd, hdd_path);
        (*env)->ReleaseStringUTFChars(env, log, log_path);
        return -EIO;
    }
    struct stat eeprom_stat;
    if ((stat(eeprom_path, &eeprom_stat) != 0 || eeprom_stat.st_size != sizeof(XboxEEPROM)) &&
        !xbox_eeprom_generate(eeprom_path, XBOX_EEPROM_VERSION_R1)) {
        __android_log_print(ANDROID_LOG_ERROR, TAG, "XBOX_EEPROM_GENERATE_FAIL path=%s", eeprom_path);
        (*env)->ReleaseStringUTFChars(env, bios, bios_path);
        (*env)->ReleaseStringUTFChars(env, mcpx, mcpx_path);
        (*env)->ReleaseStringUTFChars(env, hdd, hdd_path);
        (*env)->ReleaseStringUTFChars(env, log, log_path);
        return -EIO;
    }
    arguments[26] = g_strdup_printf("smbus-storage,file=%s", eeprom_path);
    __android_log_print(ANDROID_LOG_INFO, TAG, "XBOX_EEPROM_READY size=256 app_private=1");
    __android_log_print(ANDROID_LOG_INFO, TAG,
                        "XBOX_INIT_BEGIN machine=xbox guest=i386 host=aarch64 target=tcg");
    pthread_mutex_lock(&state_lock);
    init_finished = init_succeeded = loop_finished = false;
    pthread_mutex_unlock(&state_lock);
    if (pthread_create(&qemu_thread, NULL, run_xbox, NULL) != 0) return -EAGAIN;
    thread_created = true;
    pthread_mutex_lock(&state_lock);
    while (!init_finished && !loop_finished) pthread_cond_wait(&state_changed, &state_lock);
    pthread_mutex_unlock(&state_lock);
    (*env)->ReleaseStringUTFChars(env, bios, bios_path);
    (*env)->ReleaseStringUTFChars(env, mcpx, mcpx_path);
    (*env)->ReleaseStringUTFChars(env, hdd, hdd_path);
    (*env)->ReleaseStringUTFChars(env, log, log_path);
    return init_succeeded ? 0 : -EIO;
}

JNIEXPORT jint JNICALL
Java_org_boxdroid_m5_MainActivity_nativeXboxStop(JNIEnv *env, jobject self)
{
    (void) env;
    (void) self;
    if (!thread_created) return 0;
    boxdroid_m5_diag_guest_io_stop();
    boxdroid_m5_diag_summary();
    log_message(ANDROID_LOG_INFO, "XBOX_SHUTDOWN_REQUEST");
    bql_lock();
    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_QMP_QUIT);
    bql_unlock();
    log_message(ANDROID_LOG_INFO, "XBOX_SHUTDOWN_REQUEST_QUEUED");
    pthread_join(qemu_thread, NULL);
    thread_created = false;
    return loop_status;
}
