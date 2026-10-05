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
#include "system/blockdev.h"
#include "system/block-backend-io.h"
#include "crypto/init.h"
#include "hw/xbox/eeprom_generation.h"
#include "qapi/error.h"
#include "ui/console.h"
#include "ui/surface.h"
#include "hw/xbox/nv2a/nv2a.h"
#include "hw/xbox/nv2a/nv2a_int.h"
#include "hw/xbox/nv2a/boxdroid-m5-diagnostics.h"
#include "target/i386/cpu.h"
#ifdef BOXDROID_M62_INPUT
#include "boxdroid-m62-input.h"
#endif
#ifdef BOXDROID_M53_RUNTIME
#include "qemu/bswap.h"
static void m53_video_mode_probe(CPUState *cpu, uint64_t pc);
static void m53_sample_progress(uint64_t pc, uintptr_t tb, uint16_t instructions);
static int64_t m53_pc_start;
#ifdef BOXDROID_M54_X87_PROFILE
int64_t boxdroid_m54_x87_start;
#endif
#endif

#define ARG(value) ((char *)(value))
#define M5_RAW_FB_BASE UINT64_C(0x3c00000)
#define M5_BOOT_VGA_BASE UINT64_C(0x3e86040)
#define M5_RAW_FB_PITCH 2560U
#define M5_RAW_FB_WIDTH 640U
#define M5_RAW_FB_HEIGHT 480U
#define M5_RAW_FB_SIZE ((size_t) M5_RAW_FB_PITCH * M5_RAW_FB_HEIGHT)
#define M5_BOOT_VGA_GREEN_MIN 1024U
#define M5_FB_WRITE_LOG_CAP 16
#define M5_VALUE_LOG_CAP 64
#define M5_PROGRESS_PC_SLOTS 4096
#define M5_PROGRESS_TB_SLOTS 2048
#define M5_PROGRESS_DEVICE_SLOTS 64
#define M5_VIDEO_TIMELINE_LOG_CAP 128

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
static char *arguments[40];
#ifdef BOXDROID_M55_RUNTIME
#define M55_DVD_FDSET 55
/* QEMU consumes this duplicate via -add-fd during qemu_init(). */
static int m55_dvd_source_fd = -1;
static uint64_t m55_dvd_expected_size;
#endif
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
static bool diagnostic_nv2a_hit_logged;
static bool diagnostic_nv2a_miss_logged;
static bool diagnostic_vga_fallback_logged;
static bool diagnostic_vga_fallback_rejected_logged;
static bool diagnostic_vga_fallback_result_logged;
static bool diagnostic_vga_fallback_success_logged;
static bool diagnostic_vga_fallback_nonblack_logged;
static bool diagnostic_vga_fallback_nonblack_success_logged;
static bool diagnostic_boot_vga_fallback_logged;
static bool diagnostic_boot_vga_fallback_result_logged;
static uint64_t m5_boot_vga_fallback_candidates;
static uint64_t m5_boot_vga_fallback_present_successes;
static uint64_t m5_boot_vga_fallback_present_failures;
static uint64_t m5_vga_fallback_callbacks;
static uint64_t m5_vga_fallback_black_frames;
static uint64_t m5_vga_fallback_nonblack_frames;
static uint64_t m5_vga_fallback_present_successes;
static uint64_t m5_vga_fallback_present_failures;
static uint64_t m5_vga_fallback_last_hash;
static uint64_t m5_vga_fallback_last_nonblack_pixels;
static uint64_t m5_vga_fallback_first_nonblack_hash;
static int64_t m5_vga_fallback_first_nonblack_us;
static int64_t m5_vga_fallback_last_nonblack_us;
static uint64_t m5_vga_fallback_logged_content_changes;
static uint64_t m5_video_timeline_callbacks;
static uint64_t m5_video_timeline_changes;
static uint64_t m5_video_timeline_logged;
static uint64_t m5_video_timeline_suppressed;
static uint64_t m5_video_nv2a_hits;
static uint64_t m5_video_nv2a_misses;
static uint64_t m5_video_present_calls;
static uint64_t m5_video_present_successes;
static uint64_t m5_video_present_failures;
static uint64_t m5_video_nonblack_callbacks;
static uint64_t m5_video_green_callbacks;
static uint64_t m5_video_last_config;
static uint64_t m5_video_last_hash;
static uint64_t m5_video_last_nonblack;
static uint64_t m5_video_last_green;
static int64_t m5_video_first_nonblack_us;
static int64_t m5_video_first_green_us;
static uint64_t m5_video_green_peak;
static uint64_t m5_video_missing_surfaces;
static bool m5_video_timeline_has_previous;
static bool m5_video_last_present_called;
static bool m5_video_last_present_succeeded;
static bool m5_video_surface_missing_logged;
static char *runtime_mcpx_path;
static char *runtime_hdd_path;
static pthread_mutex_t hdd_io_lock = PTHREAD_MUTEX_INITIALIZER;
static bool hdd_io_enabled;
static uint64_t hdd_read_requests, hdd_read_bytes, hdd_read_failures;
static uint64_t hdd_write_requests, hdd_write_bytes, hdd_write_failures;
static struct { uint64_t offset, bytes; } hdd_first_reads[8];
static size_t hdd_first_read_count;
static int64_t m5_progress_last_change_us;
static int64_t m5_progress_started_us;
static int64_t m5_progress_ended_us;
static int64_t m5_progress_last_sample_us;
static uint64_t m5_progress_probe_ticks;
static bool m5_progress_first_tb_logged;
static uint64_t m5_progress_tb_count, m5_progress_guest_insns;
static uint64_t m5_progress_unique_pcs, m5_progress_pc_collisions;
static uint64_t m5_progress_unique_tbs, m5_progress_tb_collisions;
static uint64_t m5_progress_halt_exits, m5_progress_other_exits;
static uint64_t m5_progress_interrupt_samples;
static uint64_t m5_progress_device_reads, m5_progress_device_writes;
static uint64_t m5_progress_device_overflow;
static struct { uint64_t pc, count; bool used; }
    m5_progress_pcs[M5_PROGRESS_PC_SLOTS];
static struct { uintptr_t id; bool used; }
    m5_progress_tbs[M5_PROGRESS_TB_SLOTS];
static struct {
    char name[48];
    uint64_t offset, reads, writes, last_value, last_pc;
    bool used;
} m5_progress_devices[M5_PROGRESS_DEVICE_SLOTS];

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
            if (record.change) {
                __atomic_store_n(&m5_progress_last_change_us, pre_store_us,
                                 __ATOMIC_RELAXED);
            }
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

#ifdef BOXDROID_M54_RUNTIME
/* Single vCPU owns these counters. Logs use host time only once per 4096
 * dispatches. Count dispatches separately from chained guest TBs. */
static struct {
    uint64_t dispatches, idle, returns, chains, exits[4], events[4];
    uint64_t reads, writes, samples, execution_us;
    int64_t sample_begin, report_us;
    bool decoded;
} m54_exec;

void boxdroid_m54_tcg_event(unsigned kind)
{
    if (kind < G_N_ELEMENTS(m54_exec.events)) ++m54_exec.events[kind];
}

/* Sample indirect-chain lookups as well as outer C dispatches. The latter
 * disproportionately sample STI's interrupt-shadow exits in the idle loop. */
void boxdroid_m54_lookup_pc(uint64_t pc)
{
    static uint64_t ticks, samples, overflow;
    static bool done;
    static struct { uint64_t pc, hits; } pcs[512];
    ++m54_exec.events[0];
    if ((++ticks & 1023) || done) return;
    int64_t begin = __atomic_load_n(&m53_pc_start, __ATOMIC_RELAXED);
    if (!begin) return;
    int64_t now = g_get_monotonic_time();
    if (now - begin >= 5 * G_USEC_PER_SEC) {
        done = true;
        __android_log_print(ANDROID_LOG_INFO, "BoxDroidM54",
            "LOOKUP_SAMPLE elapsed_us=%lld samples=%llu overflow=%llu stride=1024",
            (long long)(now-begin), (unsigned long long)samples,
            (unsigned long long)overflow);
        for (unsigned rank = 0; rank < 12; ++rank) {
            int best = -1;
            for (unsigned i = 0; i < G_N_ELEMENTS(pcs); ++i)
                if (pcs[i].hits && (best < 0 || pcs[i].hits > pcs[best].hits)) best = i;
            if (best < 0) break;
            __android_log_print(ANDROID_LOG_INFO, "BoxDroidM54",
                "LOOKUP_PC rank=%u pc=0x%llx samples=%llu", rank,
                (unsigned long long)pcs[best].pc, (unsigned long long)pcs[best].hits);
            pcs[best].hits = 0;
        }
        return;
    }
    ++samples;
    unsigned slot = (pc ^ (pc >> 12)) % G_N_ELEMENTS(pcs);
    for (unsigned count = 0; count < G_N_ELEMENTS(pcs); ++count) {
        unsigned index = (slot + count) % G_N_ELEMENTS(pcs);
        if (!pcs[index].hits || pcs[index].pc == pc) {
            pcs[index].pc = pc; ++pcs[index].hits; return;
        }
    }
    ++overflow;
}

void boxdroid_m54_tb_return(bool chained, unsigned exit_index)
{
    ++m54_exec.returns;
    m54_exec.chains += chained;
    if (exit_index < G_N_ELEMENTS(m54_exec.exits)) ++m54_exec.exits[exit_index];
    if (m54_exec.sample_begin) {
        m54_exec.execution_us += g_get_monotonic_time() - m54_exec.sample_begin;
        m54_exec.sample_begin = 0;
        ++m54_exec.samples;
    }
}

static void m54_tb_profile(CPUState *cpu, uint64_t pc)
{
    ++m54_exec.dispatches;
    m54_exec.idle += pc == 0x8001b02f || pc == 0x8001b030;
    if ((m54_exec.dispatches & 4095) != 0) return;
    int64_t now = g_get_monotonic_time();
    CPUX86State *env = &X86_CPU(cpu)->env;
    if (!m54_exec.report_us) m54_exec.report_us = now;
    if (now - m54_exec.report_us >= G_USEC_PER_SEC) {
        uint32_t queue = 0, next = 0;
        uint8_t bytes[4];
        /* These offsets describe the idle-loop KPCR, not arbitrary EBX/EBP
         * values in application code. Never probe a device address by mistake. */
        bool idle_context = (pc == 0x8001b02f || pc == 0x8001b030) &&
            env->regs[R_EBX] == env->segs[R_FS].base &&
            env->regs[R_EBP] == env->regs[R_EBX] + 0x50 &&
            env->regs[R_EBX] >= 0x80000000 && env->regs[R_EBX] < 0x83ffffa0;
        bool queue_ok = idle_context &&
            !cpu_memory_rw_debug(cpu, env->regs[R_EBP], bytes, 4, false);
        if (queue_ok) queue = ldl_le_p(bytes);
        bool next_ok = idle_context &&
            !cpu_memory_rw_debug(cpu, env->regs[R_EBX] + 0x2c, bytes, 4, false);
        if (next_ok) next = ldl_le_p(bytes);
        __android_log_print(ANDROID_LOG_INFO, "BoxDroidM54",
            "EXEC_WINDOW mono_us=%lld elapsed_us=%lld dispatch=%llu idle=%llu returns=%llu chain_returns=%llu exit0=%llu exit1=%llu requested=%llu lookup_hit=%llu lookup_miss=%llu mmio_reads=%llu mmio_writes=%llu samples=%llu execution_us=%llu pc=0x%llx queue_addr=0x%llx queue=0x%x queue_ok=%d next_addr=0x%llx next=0x%x next_ok=%d eflags=0x%x hflags=0x%x",
            (long long)now, (long long)(now-m54_exec.report_us),
            (unsigned long long)m54_exec.dispatches, (unsigned long long)m54_exec.idle,
            (unsigned long long)m54_exec.returns, (unsigned long long)m54_exec.chains,
            (unsigned long long)m54_exec.exits[0], (unsigned long long)m54_exec.exits[1],
            (unsigned long long)m54_exec.exits[3], (unsigned long long)m54_exec.events[0],
            (unsigned long long)m54_exec.events[1], (unsigned long long)m54_exec.reads,
            (unsigned long long)m54_exec.writes, (unsigned long long)m54_exec.samples,
            (unsigned long long)m54_exec.execution_us, (unsigned long long)pc,
            (unsigned long long)env->regs[R_EBP], queue, queue_ok,
            (unsigned long long)(env->regs[R_EBX]+0x2c), next, next_ok,
            env->eflags, env->hflags);
        memset(&m54_exec, 0, sizeof(m54_exec));
        m54_exec.report_us = now;
    }
    m54_exec.sample_begin = g_get_monotonic_time();
}
#endif

/* M5-only, single-vCPU window: start after the last changing white pixel has
 * been quiet for one second, then profile five seconds without per-TB logs. */
void boxdroid_m5_diag_tb_exec(CPUState *cpu, uint64_t pc,
                              uintptr_t tb_id, uint16_t guest_insns)
{
#ifdef BOXDROID_M54_RUNTIME
    m54_tb_profile(cpu, pc);
#endif
#ifdef BOXDROID_M53_RUNTIME
    m53_video_mode_probe(cpu, pc);
    m53_sample_progress(pc, tb_id, guest_insns);
#endif
    int64_t last_change = __atomic_load_n(&m5_progress_last_change_us,
                                           __ATOMIC_RELAXED);
    int64_t now;
    size_t slot;

    if (!m5_progress_first_tb_logged) {
        m5_progress_first_tb_logged = true;
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_TCG_TB_EXEC_FIRST pc=0x%" PRIx64 " guest_insns=%u",
            pc, guest_insns);
    }

    if (!last_change || m5_progress_ended_us) {
        return;
    }
    if (!m5_progress_started_us) {
        if (++m5_progress_probe_ticks % 1024) {
            return;
        }
        now = g_get_monotonic_time();
        if (now - last_change < G_USEC_PER_SEC) {
            return;
        }
        m5_progress_started_us = now;
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_PROGRESS_START mono_us=%" PRId64 " last_change_us=%" PRId64
            " quiet_us=%" PRId64 " pc=0x%" PRIx64,
            now, last_change, now - last_change, pc);
    }

    m5_progress_tb_count++;
    m5_progress_guest_insns += guest_insns;
    slot = (pc ^ (pc >> 12)) & (M5_PROGRESS_PC_SLOTS - 1);
    if (!m5_progress_pcs[slot].used) {
        m5_progress_pcs[slot].used = true;
        m5_progress_pcs[slot].pc = pc;
        m5_progress_unique_pcs++;
    }
    if (m5_progress_pcs[slot].pc == pc) {
        m5_progress_pcs[slot].count++;
    } else {
        m5_progress_pc_collisions++;
    }
    slot = ((tb_id >> 4) ^ (tb_id >> 15)) & (M5_PROGRESS_TB_SLOTS - 1);
    if (!m5_progress_tbs[slot].used) {
        m5_progress_tbs[slot].used = true;
        m5_progress_tbs[slot].id = tb_id;
        m5_progress_unique_tbs++;
    } else if (m5_progress_tbs[slot].id != tb_id) {
        m5_progress_tb_collisions++;
    }
    m5_progress_interrupt_samples += cpu->interrupt_request != 0;

    if (m5_progress_tb_count % 16384 == 0) {
        now = g_get_monotonic_time();
        if (now - m5_progress_started_us >= 5 * G_USEC_PER_SEC) {
            m5_progress_ended_us = now;
        }
    }
    if (m5_progress_tb_count == 1 ||
        (m5_progress_tb_count % 262144 == 0 && !m5_progress_ended_us &&
         (now = g_get_monotonic_time()) - m5_progress_last_sample_us >=
             G_USEC_PER_SEC)) {
        const CPUX86State *env = &X86_CPU(cpu)->env;
        uint8_t queue_bytes[4] = { 0 }, flag_bytes[4] = { 0 };
        int queue_status = cpu_memory_rw_debug(cpu,
            (vaddr)env->regs[R_EBP], queue_bytes, sizeof(queue_bytes), 0);
        int flag_status = cpu_memory_rw_debug(cpu,
            (vaddr)env->regs[R_EBX] + 0x2c,
            flag_bytes, sizeof(flag_bytes), 0);
        uint32_t queue_word = (uint32_t)queue_bytes[0] |
            ((uint32_t)queue_bytes[1] << 8) |
            ((uint32_t)queue_bytes[2] << 16) |
            ((uint32_t)queue_bytes[3] << 24);
        uint32_t flag_word = (uint32_t)flag_bytes[0] |
            ((uint32_t)flag_bytes[1] << 8) |
            ((uint32_t)flag_bytes[2] << 16) |
            ((uint32_t)flag_bytes[3] << 24);
        m5_progress_last_sample_us = g_get_monotonic_time();
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_PROGRESS_SAMPLE mono_us=%" PRId64 " tb=%" PRIu64
            " pc=0x%" PRIx64 " eax=0x%" PRIx64 " ecx=0x%" PRIx64
            " edx=0x%" PRIx64 " ebx=0x%" PRIx64 " ebp=0x%" PRIx64
            " queue_word=0x%x queue_status=%d flag_word=0x%x"
            " flag_status=%d halted=%d interrupts=0x%x",
            g_get_monotonic_time(), m5_progress_tb_count, pc,
            (uint64_t)env->regs[R_EAX], (uint64_t)env->regs[R_ECX],
            (uint64_t)env->regs[R_EDX], (uint64_t)env->regs[R_EBX],
            (uint64_t)env->regs[R_EBP], queue_word, queue_status,
            flag_word, flag_status, cpu->halted,
            cpu->interrupt_request);
    }
}

void boxdroid_m5_diag_cpu_exit(int result, bool halted, uint32_t interrupts)
{
    if (!m5_progress_started_us || m5_progress_ended_us) {
        return;
    }
    m5_progress_halt_exits += halted;
    m5_progress_other_exits += !halted;
    m5_progress_interrupt_samples += interrupts != 0;
    if (m5_progress_halt_exits + m5_progress_other_exits <= 8) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_PROGRESS_CPU_EXIT result=%d halted=%d interrupts=0x%x",
            result, halted, interrupts);
    }
}

void boxdroid_m5_diag_device_access(bool write, const char *region,
                                    uint64_t offset, unsigned size,
                                    uint64_t value, int result,
                                    CPUState *cpu)
{
    uint64_t pc;
    size_t i;
#ifdef BOXDROID_M54_RUNTIME
    if (cpu) {
        if (write) ++m54_exec.writes;
        else ++m54_exec.reads;
    }
#endif

    if (!m5_progress_started_us || m5_progress_ended_us || !cpu) {
        return;
    }
    pc = cpu->cc->get_pc ? cpu->cc->get_pc(cpu) : 0;
    if (write) m5_progress_device_writes++;
    else m5_progress_device_reads++;
    for (i = 0; i < M5_PROGRESS_DEVICE_SLOTS; ++i) {
        if (!m5_progress_devices[i].used ||
            (m5_progress_devices[i].offset == offset &&
             strcmp(m5_progress_devices[i].name, region) == 0)) {
            break;
        }
    }
    if (i < M5_PROGRESS_DEVICE_SLOTS) {
        if (!m5_progress_devices[i].used) {
            m5_progress_devices[i].used = true;
            g_strlcpy(m5_progress_devices[i].name, region,
                      sizeof(m5_progress_devices[i].name));
            m5_progress_devices[i].offset = offset;
        }
        m5_progress_devices[i].reads += !write;
        m5_progress_devices[i].writes += write;
        m5_progress_devices[i].last_value = value;
        m5_progress_devices[i].last_pc = pc;
    } else {
        m5_progress_device_overflow++;
    }
    if (m5_progress_device_reads + m5_progress_device_writes <= 16) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_PROGRESS_DEVICE %s region=%s offset=0x%" PRIx64
            " size=%u value=0x%" PRIx64 " result=%d pc=0x%" PRIx64,
            write ? "write" : "read", region, offset, size, value,
            result, pc);
    }
}

void boxdroid_m5_diag_progress_summary(void)
{
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_PROGRESS_SUMMARY last_change_us=%" PRId64
        " start_us=%" PRId64 " end_us=%" PRId64
        " tb=%" PRIu64 " guest_insns=%" PRIu64
        " unique_pc_slots=%" PRIu64 " pc_collisions=%" PRIu64
        " unique_tb_slots=%" PRIu64 " tb_collisions=%" PRIu64
        " halt_exits=%" PRIu64 " other_exits=%" PRIu64
        " interrupt_samples=%" PRIu64 " device_reads=%" PRIu64
        " device_writes=%" PRIu64 " device_overflow=%" PRIu64,
        m5_progress_last_change_us, m5_progress_started_us,
        m5_progress_ended_us, m5_progress_tb_count,
        m5_progress_guest_insns, m5_progress_unique_pcs,
        m5_progress_pc_collisions, m5_progress_unique_tbs,
        m5_progress_tb_collisions, m5_progress_halt_exits,
        m5_progress_other_exits, m5_progress_interrupt_samples,
        m5_progress_device_reads, m5_progress_device_writes,
        m5_progress_device_overflow);
    for (unsigned rank = 0; rank < 8; ++rank) {
        size_t best = M5_PROGRESS_PC_SLOTS;
        for (size_t i = 0; i < M5_PROGRESS_PC_SLOTS; ++i) {
            if (!m5_progress_pcs[i].used || !m5_progress_pcs[i].count) continue;
            if (best == M5_PROGRESS_PC_SLOTS ||
                m5_progress_pcs[i].count > m5_progress_pcs[best].count) {
                best = i;
            }
        }
        if (best == M5_PROGRESS_PC_SLOTS) break;
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_PROGRESS_TOP_PC rank=%u pc=0x%" PRIx64 " tb=%" PRIu64,
            rank + 1, m5_progress_pcs[best].pc,
            m5_progress_pcs[best].count);
        m5_progress_pcs[best].count = 0;
    }
    for (size_t i = 0; i < M5_PROGRESS_DEVICE_SLOTS; ++i) {
        if (!m5_progress_devices[i].used) continue;
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_PROGRESS_DEVICE_SUMMARY region=%s offset=0x%" PRIx64
            " reads=%" PRIu64 " writes=%" PRIu64
            " last_value=0x%" PRIx64 " last_pc=0x%" PRIx64,
            m5_progress_devices[i].name, m5_progress_devices[i].offset,
            m5_progress_devices[i].reads, m5_progress_devices[i].writes,
            m5_progress_devices[i].last_value,
            m5_progress_devices[i].last_pc);
    }
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
        if (g_strcmp0(boundary, "raw-vram-stop") == 0) {
            /* Seven scanlines of the observed 5x7 text band, once per run. */
            for (unsigned y = 25; y <= 31; ++y) {
                char row[257];
                for (unsigned x = 25; x <= 280; ++x) {
                    size_t i = (size_t)y * M5_RAW_FB_PITCH + x * 4;
                    row[x - 25] = data[i] || data[i + 1] || data[i + 2] ?
                        '#' : '.';
                }
                row[256] = '\0';
                __android_log_print(ANDROID_LOG_INFO, TAG,
                    "M5_TEXT_BAND y=%u x=25..280 %s", y, row);
            }
        }
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

typedef struct BoxDroidM5VideoStats {
    uint64_t hash;
    uint64_t nonblack;
    uint64_t green;
    uint64_t white;
    int green_min_x;
    int green_min_y;
    int green_max_x;
    int green_max_y;
} BoxDroidM5VideoStats;

static void m5_video_measure_rgba(const uint8_t *rgba, int width, int height,
                                  int stride, BoxDroidM5VideoStats *stats)
{
    stats->hash = UINT64_C(1469598103934665603);
    stats->nonblack = 0;
    stats->green = 0;
    stats->white = 0;
    stats->green_min_x = width;
    stats->green_min_y = height;
    stats->green_max_x = -1;
    stats->green_max_y = -1;
    for (size_t i = 0; i < (size_t)stride * height; ++i) {
        stats->hash ^= rgba[i];
        stats->hash *= UINT64_C(1099511628211);
    }
    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < width; ++x) {
            const uint8_t *pixel = rgba + (size_t)y * stride + (size_t)x * 4;
            uint8_t red = pixel[0], green = pixel[1], blue = pixel[2];
            if (red || green || blue) {
                stats->nonblack++;
            }
            if (red >= 220 && green >= 220 && blue >= 220) {
                stats->white++;
            }
            if (green >= 48 && (uint32_t)green * 4 > (uint32_t)red * 5 &&
                (uint32_t)green * 4 > (uint32_t)blue * 5) {
                stats->green++;
                stats->green_min_x = MIN(stats->green_min_x, x);
                stats->green_min_y = MIN(stats->green_min_y, y);
                stats->green_max_x = MAX(stats->green_max_x, x);
                stats->green_max_y = MAX(stats->green_max_y, y);
            }
        }
    }
}

/* Diagnostic-only normalization for a display surface that the existing
 * strict NV2A/VGA presenter paths reject. It observes Pixman output without
 * changing guest VRAM or presenting the frame. */
static bool m5_video_measure_unpresented_surface(DisplaySurface *surface,
                                                  BoxDroidM5VideoStats *stats)
{
    int width = surface_width(surface);
    int height = surface_height(surface);
    int stride = width * 4;
    size_t bytes;
    uint8_t *rgba;
    pixman_image_t *converted;

    if (width <= 0 || height <= 0 ||
        (size_t)width > SIZE_MAX / 4 / (size_t)height) {
        return false;
    }
    bytes = (size_t)stride * height;
    rgba = g_try_malloc(bytes);
    if (!rgba) {
        return false;
    }
    converted = pixman_image_create_bits(PIXMAN_a8b8g8r8, width, height,
                                          (uint32_t *)rgba, stride);
    if (!converted) {
        g_free(rgba);
        return false;
    }
    pixman_image_composite32(PIXMAN_OP_SRC, surface->image, NULL, converted,
                             0, 0, 0, 0, 0, 0, width, height);
    m5_video_measure_rgba(rgba, width, height, stride, stats);
    pixman_image_unref(converted);
    g_free(rgba);
    return true;
}

static uint64_t m5_video_config_hash(uint64_t pcrtc_start,
                                    uint64_t vga_start,
                                    uint32_t line_offset, int vga_bpp,
                                    int width, int height, int stride,
                                    pixman_format_code_t format,
                                    uint8_t cr28, uint32_t pramdac_control,
                                    unsigned int path_id)
{
    const uint64_t values[] = {
        pcrtc_start, vga_start, line_offset, (uint64_t)(uint32_t)vga_bpp,
        (uint64_t)(uint32_t)width, (uint64_t)(uint32_t)height,
        (uint64_t)(uint32_t)stride, format, cr28, pramdac_control, path_id,
    };
    uint64_t hash = UINT64_C(1469598103934665603);
    for (size_t i = 0; i < G_N_ELEMENTS(values); ++i) {
        for (unsigned int byte = 0; byte < sizeof(values[i]); ++byte) {
            hash ^= (values[i] >> (byte * 8)) & 0xff;
            hash *= UINT64_C(1099511628211);
        }
    }
    return hash;
}

static void m5_video_timeline_record(uint64_t pcrtc_start,
                                     uint64_t vga_start,
                                     uint32_t line_offset, int vga_bpp,
                                     DisplaySurface *surface,
                                     uint8_t cr28, uint32_t pramdac_control,
                                     const char *path, unsigned int path_id,
                                     bool nv2a_hit,
                                     const BoxDroidM5VideoStats *stats,
                                     bool present_called,
                                     bool present_succeeded)
{
    int width = surface_width(surface);
    int height = surface_height(surface);
    int stride = surface_stride(surface);
    pixman_format_code_t format = surface_format(surface);
    uint64_t config = m5_video_config_hash(pcrtc_start, vga_start,
        line_offset, vga_bpp, width, height, stride, format, cr28,
        pramdac_control, path_id);
    int64_t now_us = g_get_monotonic_time();
    uint64_t callback = __atomic_add_fetch(&m5_video_timeline_callbacks, 1,
                                            __ATOMIC_RELAXED);
    bool first;
    bool config_changed;
    bool hash_changed;
    bool result_changed;
    uint64_t event_seq;
    const char *reason;

    if (nv2a_hit) {
        __atomic_add_fetch(&m5_video_nv2a_hits, 1, __ATOMIC_RELAXED);
    } else {
        __atomic_add_fetch(&m5_video_nv2a_misses, 1, __ATOMIC_RELAXED);
    }
    if (present_called) {
        __atomic_add_fetch(&m5_video_present_calls, 1, __ATOMIC_RELAXED);
        __atomic_add_fetch(present_succeeded ? &m5_video_present_successes :
                           &m5_video_present_failures, 1, __ATOMIC_RELAXED);
    }
    if (stats->nonblack) {
        __atomic_add_fetch(&m5_video_nonblack_callbacks, 1, __ATOMIC_RELAXED);
        int64_t expected = 0;
        __atomic_compare_exchange_n(&m5_video_first_nonblack_us, &expected,
                                    now_us, false, __ATOMIC_RELAXED,
                                    __ATOMIC_RELAXED);
    }
    if (stats->green) {
        __atomic_add_fetch(&m5_video_green_callbacks, 1, __ATOMIC_RELAXED);
        int64_t expected = 0;
        __atomic_compare_exchange_n(&m5_video_first_green_us, &expected,
                                    now_us, false, __ATOMIC_RELAXED,
                                    __ATOMIC_RELAXED);
        uint64_t peak = __atomic_load_n(&m5_video_green_peak, __ATOMIC_RELAXED);
        while (stats->green > peak &&
               !__atomic_compare_exchange_n(&m5_video_green_peak, &peak,
                                            stats->green, false,
                                            __ATOMIC_RELAXED,
                                            __ATOMIC_RELAXED)) {
        }
    }

    first = !m5_video_timeline_has_previous;
    config_changed = first || config != m5_video_last_config;
    hash_changed = first || stats->hash != m5_video_last_hash;
    result_changed = first || present_called != m5_video_last_present_called ||
                     present_succeeded != m5_video_last_present_succeeded;
    if (!config_changed && !hash_changed && !result_changed) {
        return;
    }
    __atomic_add_fetch(&m5_video_timeline_changes, 1, __ATOMIC_RELAXED);
    m5_video_timeline_has_previous = true;
    m5_video_last_config = config;
    m5_video_last_hash = stats->hash;
    m5_video_last_nonblack = stats->nonblack;
    m5_video_last_green = stats->green;
    m5_video_last_present_called = present_called;
    m5_video_last_present_succeeded = present_succeeded;
    if (__atomic_load_n(&m5_video_timeline_logged, __ATOMIC_RELAXED) >=
        M5_VIDEO_TIMELINE_LOG_CAP) {
        __atomic_add_fetch(&m5_video_timeline_suppressed, 1, __ATOMIC_RELAXED);
        return;
    }
    __atomic_add_fetch(&m5_video_timeline_logged, 1, __ATOMIC_RELAXED);
    event_seq = boxdroid_m5_diag_record("VIDEO_TIMELINE", pcrtc_start,
        vga_start, ((uint64_t)(uint32_t)width << 32) | (uint32_t)height,
        ((uint64_t)format << 32) | (uint32_t)stride,
        (uint64_t)(uint32_t)vga_bpp, path_id);
    reason = first ? "first" : config_changed ? "scanout-config" :
             hash_changed ? "new-frame-hash" : "present-result-change";
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_VIDEO_TIMELINE seq=%" PRIu64 " callback=%" PRIu64
        " mono_us=%" PRId64 " reason=%s pcrtc=0x%" PRIx64
        " vga_start=0x%" PRIx64 " line_offset=%u vga_bpp=%d"
        " surface=%dx%d stride=%d format=0x%x path=%s"
        " nv2a_lookup=%s hash=%016" PRIx64 " nonblack=%" PRIu64
        " green=%" PRIu64 " green_bbox=%d,%d..%d,%d white=%" PRIu64
        " present_called=%d vk_present=%s cr28=0x%x pramdac_gc=0x%x",
        event_seq, callback, now_us, reason, pcrtc_start, vga_start,
        line_offset, vga_bpp, width, height, stride, format, path,
        nv2a_hit ? "hit" : "miss", stats->hash, stats->nonblack,
        stats->green, stats->green_min_x, stats->green_min_y,
        stats->green_max_x, stats->green_max_y, stats->white,
        present_called, present_called ? (present_succeeded ? "success" : "failed") :
        "not-called", cr28, pramdac_control);
}

/* Display callbacks run with the BQL held. Accelerated scanout waits for
 * PFIFO; that worker may need the BQL to deliver NV097 notification/context
 * interrupts. Desktop's render loop acquires scanout outside the BQL. */
#ifdef BOXDROID_M53_RUNTIME
/* The guest kernel ABI (export ordinal 3) carries the actively selected
 * Xbox AV mode. Observe it without editing firmware or emulated registers.
 * Mode definitions: XboxDev/nxdk lib/hal/video.c; unknown modes stay unknown. */
static const struct { uint32_t mode; unsigned hz; } m53_av_modes[] = {
    { 0x04010101, 60 },
    { 0x04010103, 60 },
    { 0x0401010b, 60 },
    { 0x04020202, 60 },
    { 0x04020204, 60 },
    { 0x0402020c, 60 },
    { 0x0801010d, 60 },
    { 0x08010119, 60 },
    { 0x0802020e, 60 },
    { 0x0802021a, 60 },
    { 0x20010101, 60 },
    { 0x20010103, 60 },
    { 0x2001010b, 60 },
    { 0x20020202, 60 },
    { 0x20020204, 60 },
    { 0x2002020c, 60 },
    { 0x44030307, 50 },
    { 0x44040408, 50 },
    { 0x48030314, 50 },
    { 0x48040415, 50 },
    { 0x60030307, 50 },
    { 0x60040408, 50 },
    { 0x88070701, 60 },
    { 0x88080801, 60 },
    { 0x880b0a02, 60 },
    { 0x880e0c03, 60 },
    { 0xc0030303, 60 },
    { 0xc0040404, 60 },
    { 0xc0060601, 60 },
};
static uint32_t m53_av_entry, m53_av_mode;
static uint64_t m53_probe_ticks;
static unsigned m53_target_hz;
uint64_t boxdroid_m53_guest_refresh_period_ns(void)
{
    unsigned hz=__atomic_load_n(&m53_target_hz,__ATOMIC_RELAXED);
    return hz ? UINT64_C(1000000000)/hz : 0;
}
static bool m53_read32(CPUState *cpu, uint32_t address, uint32_t *value)
{
    uint8_t bytes[4];
    if (cpu_memory_rw_debug(cpu,address,bytes,4,false)) return false;
    *value=ldl_le_p(bytes); return true;
}
static void m53_video_mode_probe(CPUState *cpu, uint64_t pc)
{
    if (!m53_av_entry) {
        if (++m53_probe_ticks % 4096) return;
        const uint32_t base=0x80010000;
        uint32_t mz,pe,signature,exportRva,ordinalBase,functions,count,rva;
        if (!m53_read32(cpu,base,&mz) || (mz&0xffff)!=0x5a4d ||
            !m53_read32(cpu,base+0x3c,&pe) || pe>0x1000 ||
            !m53_read32(cpu,base+pe,&signature) || signature!=0x4550 ||
            !m53_read32(cpu,base+pe+0x78,&exportRva) || exportRva>0x400000 ||
            !m53_read32(cpu,base+exportRva+16,&ordinalBase) || ordinalBase>3 ||
            !m53_read32(cpu,base+exportRva+20,&count) || count<4-ordinalBase || count>4096 ||
            !m53_read32(cpu,base+exportRva+28,&functions) || functions>0x400000 ||
            !m53_read32(cpu,base+functions+4*(3-ordinalBase),&rva) || !rva || rva>0x400000) return;
        m53_av_entry=base+rva;
        __android_log_print(ANDROID_LOG_INFO,"BoxDroidM53","AV_MODE_OBSERVER entry=0x%x ordinal=3",m53_av_entry);
    }
    if (pc!=m53_av_entry) return;
    CPUX86State *env=&X86_CPU(cpu)->env;
    uint32_t mode, step, pitch, framebuffer;
    uint32_t sp=env->regs[R_ESP]+env->segs[R_SS].base;
    if (!m53_read32(cpu,sp+12,&mode) || !m53_read32(cpu,sp+8,&step) ||
        !m53_read32(cpu,sp+20,&pitch) || !m53_read32(cpu,sp+24,&framebuffer)) return;
    if (mode==m53_av_mode) return;
    m53_av_mode=mode;
    unsigned hz=0;
    for (size_t i=0;i<G_N_ELEMENTS(m53_av_modes);++i) {
        if (m53_av_modes[i].mode==mode) { hz=m53_av_modes[i].hz; break; }
    }
    __atomic_store_n(&m53_target_hz,hz,__ATOMIC_RELAXED);
    __android_log_print(ANDROID_LOG_INFO,"BoxDroidM53",
        "ACTIVE_GUEST_MODE mode=0x%x step=%u pitch=%u framebuffer=0x%x target_hz=%u budget_ns=%llu source=guest-AvSetDisplayMode",
        mode,step,pitch,framebuffer,hz,hz ? (unsigned long long)(1000000000ULL/hz) : 0);
}
/* Sample 1/1024 TB entries for five wall-clock seconds after first green
 * scanout. No instruction logging, guest memory edits, or per-TB clock read. */
static bool m53_pc_done;
static uint64_t m53_pc_ticks, m53_pc_overflow;
static struct { uint64_t pc, hits, instructions; uintptr_t tb; } m53_pcs[512];
static void m53_sample_progress(uint64_t pc, uintptr_t tb, uint16_t instructions)
{
    int64_t begin=__atomic_load_n(&m53_pc_start,__ATOMIC_RELAXED);
    if (!begin || m53_pc_done || (++m53_pc_ticks & 1023)) return;
    if (g_get_monotonic_time()-begin>5*G_USEC_PER_SEC) {
        m53_pc_done=true;
        __android_log_print(ANDROID_LOG_INFO,"BoxDroidM53",
            "TB_SAMPLE entries=%llu interval_us=%lld stride=1024 overflow=%llu",
            (unsigned long long)m53_pc_ticks,(long long)(g_get_monotonic_time()-begin),
            (unsigned long long)m53_pc_overflow);
        for (int top=0;top<16;++top) {
            int best=-1;
            for (int i=0;i<512;++i) if (m53_pcs[i].hits &&
                (best<0 || m53_pcs[i].hits>m53_pcs[best].hits)) best=i;
            if (best<0) break;
            __android_log_print(ANDROID_LOG_INFO,"BoxDroidM53",
                "TB_TOP pc=0x%llx tb=0x%llx samples=%llu guest_instructions=%llu",
                (unsigned long long)m53_pcs[best].pc,(unsigned long long)m53_pcs[best].tb,
                (unsigned long long)m53_pcs[best].hits,(unsigned long long)m53_pcs[best].instructions);
            m53_pcs[best].hits=0;
        }
        return;
    }
    unsigned slot=(pc>>2)%512;
    bool stored = false;
    for (unsigned i=0;i<512;++i) {
        unsigned n=(slot+i)%512;
        if (!m53_pcs[n].hits || m53_pcs[n].pc==pc) {
            m53_pcs[n].pc=pc; m53_pcs[n].tb=tb;
            ++m53_pcs[n].hits; m53_pcs[n].instructions+=instructions;
            stored = true; break;
        }
    }
    if (!stored) ++m53_pc_overflow;
}
static uint64_t m53_unique, m53_last_hash, m53_frames, m53_green, m53_refreshes;
static int64_t m53_report_us, m53_period_us, m53_last_start_us;
static int64_t m53_scanout_us, m53_bql_us, m53_refresh_us, m53_present_us;
static int64_t m53_conversion_us;
JNIEXPORT jlong JNICALL
Java_org_boxdroid_m5_PerformanceActivity_nativeM53UniqueFrames(JNIEnv *env, jobject self)
{
    return __atomic_load_n(&m53_unique, __ATOMIC_RELAXED);
}
extern uint64_t boxdroid_m53_guest_flips(void);
static void m53_report(int64_t now)
{
    if (!m53_report_us) m53_report_us = now;
    if (now - m53_report_us < G_USEC_PER_SEC) return;
    VGACommonState *v = &g_nv2a->vga;
    static uint64_t last_unique, last_flips;
    uint64_t flips = boxdroid_m53_guest_flips();
    __android_log_print(ANDROID_LOG_INFO, "BoxDroidM53",
        "PERF mono_us=%" PRId64 " elapsed_us=%" PRId64
        " unique=%" PRIu64 " frames=%" PRIu64 " green=%" PRIu64 " guest_flips=%" PRIu64
        " refresh=%" PRIu64 " period_us=%" PRId64 " callback_us=%" PRId64
        " scanout_us=%" PRId64 " bql_reacquire_us=%" PRId64
        " conversion_us=%" PRId64 " presenter_us=%" PRId64
        " vpll=0x%x htotal=0x%x vtotal=0x%x overflow=0x%x cr25=0x%x"
        " sr1=0x%x msr=0x%x fp_h=%u fp_v=%u pcrtc=0x%" PRIx64,
        now, now-m53_report_us, m53_unique-last_unique, m53_frames, m53_green, flips-last_flips,
        m53_refreshes, m53_period_us, m53_refresh_us, m53_scanout_us, m53_bql_us,
        m53_conversion_us, m53_present_us, g_nv2a->pramdac.video_clock_coeff,
        v->cr[0],v->cr[6],v->cr[7],v->cr[0x25],v->sr[1],v->msr,
        g_nv2a->pramdac.fp_hcrtc,g_nv2a->pramdac.fp_vcrtc,g_nv2a->pcrtc.start);
    last_unique=m53_unique; last_flips=flips; m53_report_us=now;
    m53_frames=m53_green=m53_refreshes=0;
    m53_period_us=m53_scanout_us=m53_bql_us=m53_refresh_us=0;
    m53_conversion_us=m53_present_us=0;
}
#endif

static int xbox_acquire_scanout(void)
{
    int result;
    assert(bql_locked());
    bql_unlock();
#ifdef BOXDROID_M53_RUNTIME
    int64_t begin = g_get_monotonic_time();
#endif
    result = nv2a_get_framebuffer_surface();
#ifdef BOXDROID_M53_RUNTIME
    int64_t done = g_get_monotonic_time();
    m53_scanout_us += done - begin;
#endif
    bql_lock();
#ifdef BOXDROID_M53_RUNTIME
    m53_bql_us += g_get_monotonic_time() - done;
#endif
    return result;
}

static void xbox_display_update(DisplayChangeListener *dcl,
                                int x, int y, int width, int height)
{
    DisplaySurface *surface = qemu_console_surface(dcl->con);
    VGADisplayParams video_params = { 0 };
    int surface_width_px, surface_height_px, stride;
    size_t display_surface_bytes;
    uintptr_t surface_data_address, vram_begin, vram_end;
    bool direct_vram, nv2a_surface, vga_fallback = false;
    bool startup_vga_fallback = false;
    uint64_t vga_framebuffer_start = 0;
    uint32_t vga_pitch = 0;
    uint8_t vga_cr28 = 0;
    uint32_t pramdac_gc = 0;
    int vga_bpp = -1;
    uint8_t *rgba;
    pixman_image_t *converted;
    uint64_t frame_hash = UINT64_C(1469598103934665603);
    uint64_t nonblack_pixels = 0;
    uint64_t fallback_nonblack_pixels = 0;
    uint64_t green_pixels = 0, white_pixels = 0;
    int green_min_x = 0, green_min_y = 0, green_max_x = -1, green_max_y = -1;
    uint64_t fallback_sequence = 0;
    bool log_fallback_frame_state = false;
    bool fallback_was_nonblack = false;
    bool fallback_content_changed = false;
    (void) x;
    (void) y;
    (void) width;
    (void) height;
    boxdroid_m5_diag_event(BOXDROID_M5_DIAG_DISPLAY_CALLBACK,
                           (uint64_t) x, (uint64_t) y,
                           (uint64_t) width, (uint64_t) height, 0, 0);

    if (!surface || !surface->image) {
        __atomic_add_fetch(&m5_video_missing_surfaces, 1, __ATOMIC_RELAXED);
        if (!__atomic_exchange_n(&m5_video_surface_missing_logged, true,
                                 __ATOMIC_RELAXED)) {
            __android_log_print(ANDROID_LOG_WARN, TAG,
                "M5_VIDEO_SURFACE_UNAVAILABLE first=1 console=%p", dcl->con);
        }
        return;
    }
    surface_width_px = surface_width(surface);
    surface_height_px = surface_height(surface);
    stride = surface_stride(surface);
    if (surface_width_px <= 0 || surface_height_px <= 0) {
        return;
    }
    display_surface_bytes = (size_t) stride * surface_height_px;
    surface_data_address = (uintptr_t) surface_data(surface);
    vram_begin = g_nv2a ? (uintptr_t) g_nv2a->vram_ptr : 0;
    vram_end = g_nv2a ? vram_begin + memory_region_size(g_nv2a->vram) : 0;
    direct_vram = g_nv2a && surface_data_address >= vram_begin &&
                  surface_data_address < vram_end;
    if (g_nv2a) {
        g_nv2a->vga.get_params(&g_nv2a->vga, &video_params);
        vga_framebuffer_start = (uint64_t)video_params.start_addr * 4;
        vga_pitch = video_params.line_offset;
        vga_cr28 = g_nv2a->vga.cr[0x28];
        pramdac_gc = g_nv2a->pramdac.general_control;
        switch (vga_cr28 & 3) {
        case 0:
            vga_bpp = 0;
            break;
        case 2:
        case 3:
            vga_bpp = g_nv2a->vga.get_bpp(&g_nv2a->vga);
            break;
        default:
            /* Upstream nv2a_get_bpp() asserts for this unhandled VGA mode. */
            vga_bpp = -1;
            break;
        }
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
            display_surface_bytes);
    }
    /* Flush the current NV2A Vulkan scanout surface into shared Xbox VRAM.
     * With HAVE_EXTERNAL_MEMORY=0 this is Xemu's CPU-visible download path. */
    nv2a_surface = xbox_acquire_scanout() >= 0;
    if (!nv2a_surface) {
        nv2a_release_framebuffer_surface();
        if (!__atomic_exchange_n(&diagnostic_nv2a_miss_logged, true,
                                 __ATOMIC_RELAXED)) {
            __android_log_print(ANDROID_LOG_INFO, TAG,
                "M5_DISPLAY_NV2A_PATH=MISS pcrtc=0x%" PRIx64
                " surface=%dx%d pitch=%d format=0x%x",
                g_nv2a ? g_nv2a->pcrtc.start : UINT64_C(0),
                surface_width_px, surface_height_px, stride,
                surface_format(surface));
        }

        /* M5-only bridge for the already-verified direct VGA framebuffer.
         * Keep this intentionally narrow: the active PCRTC address, VGA
         * start/pitch/depth, DisplaySurface geometry/format, and backing
         * pointer must all identify the proven 640x480x32 scanout. */
        if (g_nv2a && g_nv2a->pcrtc.start == M5_RAW_FB_BASE) {
            VGADisplayParams params;
            uint64_t vram_size = memory_region_size(g_nv2a->vram);
            uintptr_t expected_data = vram_begin + M5_RAW_FB_BASE;
            uint64_t required_bytes = M5_RAW_FB_SIZE;
            const uint8_t *source = surface_data(surface);
            bool range_valid;

            g_nv2a->vga.get_params(&g_nv2a->vga, &params);
            vga_framebuffer_start = (uint64_t) params.start_addr * 4;
            vga_pitch = params.line_offset;
            vga_bpp = g_nv2a->vga.get_bpp(&g_nv2a->vga);
            range_valid = M5_RAW_FB_BASE <= vram_size &&
                          required_bytes <= vram_size - M5_RAW_FB_BASE;

            if (source && direct_vram && range_valid &&
                vga_framebuffer_start == g_nv2a->pcrtc.start &&
                vga_framebuffer_start == M5_RAW_FB_BASE &&
                vga_pitch == M5_RAW_FB_PITCH && stride == (int) vga_pitch &&
                surface_width_px == (int) M5_RAW_FB_WIDTH &&
                surface_height_px == (int) M5_RAW_FB_HEIGHT &&
                vga_bpp == 32 &&
                PIXMAN_FORMAT_BPP(surface_format(surface)) == 32 &&
                surface_format(surface) == PIXMAN_x8r8g8b8 &&
                display_surface_bytes == required_bytes &&
                surface_data_address == expected_data) {
                bool log_selection = !__atomic_exchange_n(
                    &diagnostic_vga_fallback_logged, true,
                    __ATOMIC_RELAXED);
                if (log_selection) {
                    for (uint32_t row = 0; row < M5_RAW_FB_HEIGHT; ++row) {
                        const uint32_t *pixels = (const uint32_t *)
                            (source + (size_t) row * stride);
                        for (uint32_t col = 0; col < M5_RAW_FB_WIDTH; ++col) {
                            if (pixels[col] & UINT32_C(0x00ffffff)) {
                                fallback_nonblack_pixels++;
                            }
                        }
                    }
                    __android_log_print(ANDROID_LOG_INFO, TAG,
                        "M5_DISPLAY_VGA_FALLBACK=SELECTED"
                        " source=%dx%d pitch=%d depth=%d format=0x%x"
                        " pcrtc=0x%" PRIx64 " vga_start=0x%" PRIx64
                        " backing=direct_vram nonblack_pixels=%" PRIu64,
                        surface_width_px, surface_height_px, stride, vga_bpp,
                        surface_format(surface), g_nv2a->pcrtc.start,
                        vga_framebuffer_start, fallback_nonblack_pixels);
                }
                vga_fallback = true;
            } else if (!__atomic_exchange_n(
                           &diagnostic_vga_fallback_rejected_logged, true,
                           __ATOMIC_RELAXED)) {
                __android_log_print(ANDROID_LOG_WARN, TAG,
                    "M5_DISPLAY_VGA_FALLBACK=REJECTED"
                    " source=%dx%d pitch=%d depth=%d format=0x%x"
                    " pcrtc=0x%" PRIx64 " vga_start=0x%" PRIx64
                    " vga_pitch=%u direct_vram=%d range_valid=%d"
                    " data_matches_vram=%d",
                    surface_width_px, surface_height_px, stride, vga_bpp,
                    surface_format(surface), g_nv2a->pcrtc.start,
                    vga_framebuffer_start, vga_pitch, direct_vram,
                    range_valid,
                    surface_data_address == expected_data);
            }
        }
        if (!vga_fallback) {
            BoxDroidM5VideoStats stats;
            if (m5_video_measure_unpresented_surface(surface, &stats)) {
                uint64_t vram_size = g_nv2a ?
                    memory_region_size(g_nv2a->vram) : 0;
                bool boot_vga_range_valid =
                    M5_BOOT_VGA_BASE <= vram_size &&
                    M5_RAW_FB_SIZE <= vram_size - M5_BOOT_VGA_BASE;
                bool exact_boot_vga_mode = g_nv2a && direct_vram &&
                    g_nv2a->pcrtc.start == M5_BOOT_VGA_BASE &&
                    vga_framebuffer_start == M5_BOOT_VGA_BASE &&
                    vga_pitch == M5_RAW_FB_PITCH && stride == (int)vga_pitch &&
                    surface_width_px == (int)M5_RAW_FB_WIDTH &&
                    surface_height_px == (int)M5_RAW_FB_HEIGHT &&
                    vga_bpp == 32 && vga_cr28 == 0x83 &&
                    pramdac_gc == 0x100030 &&
                    surface_format(surface) == PIXMAN_x8r8g8b8 &&
                    display_surface_bytes == M5_RAW_FB_SIZE &&
                    boot_vga_range_valid &&
                    surface_data_address == vram_begin + M5_BOOT_VGA_BASE;

                /* Bridge only the exact pre-dashboard direct-VRAM mode
                 * observed on-device, and only after its guest surface
                 * contains the substantial green content seen in the
                 * boot timeline. The earlier base-zero surface remains
                 * diagnostic-only because presenting it showed corruption. */
                if (exact_boot_vga_mode &&
                    stats.green >= M5_BOOT_VGA_GREEN_MIN) {
                    startup_vga_fallback = true;
                    vga_fallback = true;
                    __atomic_add_fetch(&m5_boot_vga_fallback_candidates, 1,
                                       __ATOMIC_RELAXED);
                    if (!__atomic_exchange_n(
                            &diagnostic_boot_vga_fallback_logged, true,
                            __ATOMIC_RELAXED)) {
                        __android_log_print(ANDROID_LOG_INFO, TAG,
                            "M5_DISPLAY_VGA_PREDASH_FALLBACK=SELECTED"
                            " source=%dx%d pitch=%d depth=%d format=0x%x"
                            " pcrtc=0x%" PRIx64 " vga_start=0x%" PRIx64
                            " backing=direct_vram range_valid=%d"
                            " green_pixels=%" PRIu64 " green_bbox=%d,%d..%d,%d"
                            " minimum_green_pixels=%u",
                            surface_width_px, surface_height_px, stride,
                            vga_bpp, surface_format(surface),
                            g_nv2a->pcrtc.start, vga_framebuffer_start,
                            boot_vga_range_valid, stats.green,
                            stats.green_min_x, stats.green_min_y,
                            stats.green_max_x, stats.green_max_y,
                            M5_BOOT_VGA_GREEN_MIN);
                    }
                } else {
                    const char *path = direct_vram ?
                        "VGA_DIRECT_VRAM_UNBRIDGED" :
                        "QEMU_DISPLAY_SURFACE_UNBRIDGED";
                    m5_video_timeline_record(
                        g_nv2a ? g_nv2a->pcrtc.start : 0,
                        vga_framebuffer_start, vga_pitch, vga_bpp, surface,
                        vga_cr28, pramdac_gc, path, direct_vram ? 3 : 4,
                        false, &stats, false, false);
                }
            } else {
                __android_log_print(ANDROID_LOG_WARN, TAG,
                    "M5_VIDEO_UNPRESENTED_SAMPLE_FAILED surface=%dx%d format=0x%x",
                    surface_width_px, surface_height_px, surface_format(surface));
            }
            if (!vga_fallback) {
                return;
            }
        }
    } else if (!__atomic_exchange_n(&diagnostic_nv2a_hit_logged, true,
                                    __ATOMIC_RELAXED)) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_DISPLAY_NV2A_PATH=HIT pcrtc=0x%" PRIx64
            " surface=%dx%d pitch=%d format=0x%x",
            g_nv2a ? g_nv2a->pcrtc.start : UINT64_C(0),
            surface_width_px, surface_height_px, stride,
            surface_format(surface));
    }
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

#ifdef BOXDROID_M53_RUNTIME
    int64_t m53_convert_begin = g_get_monotonic_time();
#endif
    rgba = g_malloc((size_t) surface_width_px * surface_height_px * 4);
    stride = surface_width_px * 4;
    converted = pixman_image_create_bits(PIXMAN_a8b8g8r8,
                                          surface_width_px,
                                          surface_height_px,
                                          (uint32_t *) rgba, stride);
    if (!converted) {
        g_free(rgba);
        if (nv2a_surface) {
            nv2a_release_framebuffer_surface();
        }
        return;
    }
    pixman_image_composite32(PIXMAN_OP_SRC, surface->image, NULL, converted,
                             0, 0, 0, 0, 0, 0,
                             surface_width_px, surface_height_px);
    if (nv2a_surface) {
        nv2a_release_framebuffer_surface();
    }
    for (size_t i = 0; i < (size_t) stride * surface_height_px; ++i) {
        frame_hash ^= rgba[i];
        frame_hash *= UINT64_C(1099511628211);
    }
    for (int py = 0; py < surface_height_px; ++py) {
        for (int px = 0; px < surface_width_px; ++px) {
            const uint8_t *pixel = rgba + (size_t)py * stride + (size_t)px * 4;
            uint8_t red = pixel[0], green = pixel[1], blue = pixel[2];
            if (red || green || blue) {
                nonblack_pixels++;
            }
            if (red >= 220 && green >= 220 && blue >= 220) {
                white_pixels++;
            }
            if (green >= 48 && (uint32_t)green * 4 > (uint32_t)red * 5 &&
                (uint32_t)green * 4 > (uint32_t)blue * 5) {
                green_pixels++;
                if (green_max_x < 0) {
                    green_min_x = green_max_x = px;
                    green_min_y = green_max_y = py;
                } else {
                    green_min_x = MIN(green_min_x, px);
                    green_min_y = MIN(green_min_y, py);
                    green_max_x = MAX(green_max_x, px);
                    green_max_y = MAX(green_max_y, py);
                }
            }
        }
    }
    boxdroid_m5_diag_sample(BOXDROID_M5_SAMPLE_PIXMAN_RGBA, rgba,
                            (size_t) stride * surface_height_px,
                            nonblack_pixels, "after-pixman-copy");
    if (vga_fallback) {
        uint64_t previous_hash = __atomic_load_n(&m5_vga_fallback_last_hash,
                                                  __ATOMIC_RELAXED);
        uint64_t previous_pixels = __atomic_load_n(
            &m5_vga_fallback_last_nonblack_pixels, __ATOMIC_RELAXED);
        int64_t now_us = g_get_monotonic_time();
        fallback_sequence = __atomic_add_fetch(&m5_vga_fallback_callbacks, 1,
                                                __ATOMIC_RELAXED);
        fallback_was_nonblack = previous_pixels != 0;
        fallback_content_changed = frame_hash != previous_hash;
        if (nonblack_pixels) {
            __atomic_add_fetch(&m5_vga_fallback_nonblack_frames, 1,
                               __ATOMIC_RELAXED);
            int64_t expected = 0;
            if (__atomic_compare_exchange_n(&m5_vga_fallback_first_nonblack_us,
                                            &expected, now_us, false,
                                            __ATOMIC_RELAXED,
                                            __ATOMIC_RELAXED)) {
                __atomic_store_n(&m5_vga_fallback_first_nonblack_hash,
                                 frame_hash, __ATOMIC_RELAXED);
            }
            __atomic_store_n(&m5_vga_fallback_last_nonblack_us, now_us,
                             __ATOMIC_RELAXED);
        } else {
            __atomic_add_fetch(&m5_vga_fallback_black_frames, 1,
                               __ATOMIC_RELAXED);
        }
        log_fallback_frame_state = fallback_sequence == 1 ||
            (nonblack_pixels && !fallback_was_nonblack) ||
            (!nonblack_pixels && fallback_was_nonblack) ||
            (frame_hash != previous_hash &&
             m5_vga_fallback_logged_content_changes < 8);
        if (frame_hash != previous_hash && fallback_sequence > 1 &&
            m5_vga_fallback_logged_content_changes < 8) {
            m5_vga_fallback_logged_content_changes++;
        }
        __atomic_store_n(&m5_vga_fallback_last_hash, frame_hash,
                         __ATOMIC_RELAXED);
        __atomic_store_n(&m5_vga_fallback_last_nonblack_pixels,
                         nonblack_pixels, __ATOMIC_RELAXED);
    }
#ifdef BOXDROID_M53_RUNTIME
    int64_t m53_present_begin = g_get_monotonic_time();
    m53_conversion_us += m53_present_begin - m53_convert_begin;
    ++m53_frames;
    if (frame_hash != m53_last_hash) {
        __atomic_add_fetch(&m53_unique, 1, __ATOMIC_RELAXED);
        if (green_pixels > 1024) {
            ++m53_green;
            if (!__atomic_load_n(&m53_pc_start,__ATOMIC_RELAXED))
                __atomic_store_n(&m53_pc_start,g_get_monotonic_time(),__ATOMIC_RELAXED);
#ifdef BOXDROID_M54_X87_PROFILE
            if (!__atomic_load_n(&boxdroid_m54_x87_start,__ATOMIC_RELAXED))
                __atomic_store_n(&boxdroid_m54_x87_start,g_get_monotonic_time(),__ATOMIC_RELAXED);
#endif
        }
        m53_last_hash = frame_hash;
    }
#endif
#ifdef BOXDROID_M53_RUNTIME
    /* rgba is an owned CPU copy and the NV2A scanout binding is released.
     * Presenter/window lifetime is serialized by its own mutex. Let vCPU and
     * device IRQ delivery proceed during CPU fitting and WSI queue waits. */
    assert(bql_locked());
    bql_unlock();
#endif
    bool presented = boxdroid_android_present_rgba(rgba, surface_width_px,
                                                   surface_height_px, stride);
#ifdef BOXDROID_M53_RUNTIME
    int64_t m53_present_end = g_get_monotonic_time();
    m53_present_us += m53_present_end - m53_present_begin;
    bql_lock();
    m53_bql_us += g_get_monotonic_time() - m53_present_end;
#endif
    BoxDroidM5VideoStats video_stats = {
        .hash = frame_hash,
        .nonblack = nonblack_pixels,
        .green = green_pixels,
        .white = white_pixels,
        .green_min_x = green_pixels ? green_min_x : surface_width_px,
        .green_min_y = green_pixels ? green_min_y : surface_height_px,
        .green_max_x = green_max_x,
        .green_max_y = green_max_y,
    };
    m5_video_timeline_record(g_nv2a ? g_nv2a->pcrtc.start : 0,
        vga_framebuffer_start, vga_pitch, vga_bpp, surface, vga_cr28,
        pramdac_gc, nv2a_surface ? "NV2A_VULKAN_BACKED" :
            startup_vga_fallback ? "VGA_PREDASH_DIRECT_VRAM" :
                                   "VGA_DIRECT_VRAM",
        nv2a_surface ? 1 : startup_vga_fallback ? 5 : 2,
        nv2a_surface, &video_stats, true, presented);
    if (startup_vga_fallback) {
        if (presented) {
            __atomic_add_fetch(&m5_boot_vga_fallback_present_successes, 1,
                               __ATOMIC_RELAXED);
        } else {
            __atomic_add_fetch(&m5_boot_vga_fallback_present_failures, 1,
                               __ATOMIC_RELAXED);
        }
        if (!__atomic_exchange_n(&diagnostic_boot_vga_fallback_result_logged,
                                 true, __ATOMIC_RELAXED)) {
            __android_log_print(ANDROID_LOG_INFO, TAG,
                "M5_DISPLAY_VGA_PREDASH_FALLBACK_PRESENT"
                " presenter_called=1 vk_present_succeeded=%d"
                " source=%dx%d green_pixels=%" PRIu64
                " nonblack_pixels=%" PRIu64 " rgba_hash=%016" PRIx64,
                presented, surface_width_px, surface_height_px,
                green_pixels, nonblack_pixels, frame_hash);
        }
    }
    if (vga_fallback) {
        if (presented) {
            __atomic_add_fetch(&m5_vga_fallback_present_successes, 1,
                               __ATOMIC_RELAXED);
        } else {
            __atomic_add_fetch(&m5_vga_fallback_present_failures, 1,
                               __ATOMIC_RELAXED);
        }
        if (log_fallback_frame_state) {
            __android_log_print(ANDROID_LOG_INFO, TAG,
                "M5_VGA_FRAME seq=%" PRIu64 " mono_us=%" PRId64
                " state=%s nonblack_pixels=%" PRIu64
                " hash=%016" PRIx64 " content_changed=%d"
                " presented=%d guest_frame=%" PRIu64,
                fallback_sequence, g_get_monotonic_time(),
                nonblack_pixels ? "NONBLACK" : "BLACK", nonblack_pixels,
                frame_hash, fallback_content_changed,
                presented, guest_frame_count + (presented ? 1 : 0));
        }
    }
    if (vga_fallback &&
        !__atomic_exchange_n(&diagnostic_vga_fallback_result_logged, true,
                             __ATOMIC_RELAXED)) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_DISPLAY_VGA_FALLBACK_PRESENT present_called=1"
            " vk_present_succeeded=%d source=%dx%d nonblack_pixels=%" PRIu64
            " rgba_hash=%016" PRIx64,
            presented, surface_width_px, surface_height_px,
            nonblack_pixels, frame_hash);
    }
    if (vga_fallback && presented &&
        !__atomic_exchange_n(&diagnostic_vga_fallback_success_logged, true,
                             __ATOMIC_RELAXED)) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_DISPLAY_VGA_FALLBACK_FIRST_SUCCESS frame=%" PRIu64
            " source=%dx%d nonblack_pixels=%" PRIu64
            " rgba_hash=%016" PRIx64,
            guest_frame_count + 1, surface_width_px, surface_height_px,
            nonblack_pixels, frame_hash);
    }
    if (vga_fallback && nonblack_pixels > 0 &&
        !__atomic_exchange_n(&diagnostic_vga_fallback_nonblack_logged, true,
                             __ATOMIC_RELAXED)) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_DISPLAY_VGA_FALLBACK_NONBLACK presenter_called=1"
            " vk_present_succeeded=%d source=%dx%d"
            " nonblack_pixels=%" PRIu64 " rgba_hash=%016" PRIx64,
            presented, surface_width_px, surface_height_px,
            nonblack_pixels, frame_hash);
    }
    if (vga_fallback && nonblack_pixels > 0 && presented &&
        !__atomic_exchange_n(
            &diagnostic_vga_fallback_nonblack_success_logged, true,
            __ATOMIC_RELAXED)) {
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_DISPLAY_VGA_FALLBACK_NONBLACK_PRESENTED frame=%" PRIu64
            " source=%dx%d nonblack_pixels=%" PRIu64
            " rgba_hash=%016" PRIx64,
            guest_frame_count + 1, surface_width_px, surface_height_px,
            nonblack_pixels, frame_hash);
    }
    if (presented) {
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
#ifdef BOXDROID_M53_RUNTIME
    int64_t m53_begin = g_get_monotonic_time();
    if (m53_last_start_us) m53_period_us += m53_begin - m53_last_start_us;
    m53_last_start_us = m53_begin;
    ++m53_refreshes;
#endif
    int64_t now_us;
    boxdroid_m5_diag_event(BOXDROID_M5_DIAG_REFRESH_CALLBACK,
                           qemu_clock_get_ms(QEMU_CLOCK_REALTIME), 0, 0, 0, 0, 0);
    /* GPU rendering does not dirty QEMU's CPU VRAM bitmap. Desktop Xemu
     * requests accelerated scanout from its render loop independently of
     * dpy_gfx_update. Pull scanout before the VGA dirty check: Xemu's existing
     * download marks DIRTY_MEMORY_VGA and the normal callback then presents.
     * Release before graphic_hw_update so its callback can acquire normally. */
    if (g_nv2a && g_nv2a->pgraph.renderer) {
        xbox_acquire_scanout();
        nv2a_release_framebuffer_surface();
    }
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
#ifdef BOXDROID_M53_RUNTIME
    m53_refresh_us += g_get_monotonic_time() - m53_begin;
    m53_report(g_get_monotonic_time());
#endif
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
        "M5_VGA_FALLBACK_SUMMARY callbacks=%" PRIu64 " black=%" PRIu64
        " nonblack=%" PRIu64 " presents_ok=%" PRIu64 " presents_failed=%" PRIu64
        " first_nonblack_us=%" PRId64 " first_nonblack_hash=%016" PRIx64
        " last_nonblack_us=%" PRId64 " last_hash=%016" PRIx64
        " last_nonblack_pixels=%" PRIu64,
        __atomic_load_n(&m5_vga_fallback_callbacks, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_vga_fallback_black_frames, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_vga_fallback_nonblack_frames, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_vga_fallback_present_successes, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_vga_fallback_present_failures, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_vga_fallback_first_nonblack_us, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_vga_fallback_first_nonblack_hash, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_vga_fallback_last_nonblack_us, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_vga_fallback_last_hash, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_vga_fallback_last_nonblack_pixels, __ATOMIC_RELAXED));
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_VIDEO_SUMMARY callbacks=%" PRIu64 " state_or_hash_changes=%" PRIu64
        " logged=%" PRIu64 " suppressed=%" PRIu64
        " nv2a_hits=%" PRIu64 " nv2a_misses=%" PRIu64
        " present_calls=%" PRIu64 " present_success=%" PRIu64
        " present_failures=%" PRIu64 " nonblack_callbacks=%" PRIu64
        " green_callbacks=%" PRIu64 " green_peak=%" PRIu64
        " first_nonblack_us=%" PRId64 " first_green_us=%" PRId64
        " missing_display_surface=%" PRIu64,
        __atomic_load_n(&m5_video_timeline_callbacks, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_timeline_changes, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_timeline_logged, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_timeline_suppressed, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_nv2a_hits, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_nv2a_misses, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_present_calls, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_present_successes, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_present_failures, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_nonblack_callbacks, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_green_callbacks, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_green_peak, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_first_nonblack_us, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_first_green_us, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_video_missing_surfaces, __ATOMIC_RELAXED));
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_VIDEO_BOOT_VGA_SUMMARY candidates=%" PRIu64
        " present_success=%" PRIu64 " present_failures=%" PRIu64
        " min_green_pixels=%u",
        __atomic_load_n(&m5_boot_vga_fallback_candidates, __ATOMIC_RELAXED),
        __atomic_load_n(&m5_boot_vga_fallback_present_successes,
                        __ATOMIC_RELAXED),
        __atomic_load_n(&m5_boot_vga_fallback_present_failures,
                        __ATOMIC_RELAXED),
        M5_BOOT_VGA_GREEN_MIN);
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
    bool scanout_draw_snapshot = false;
    uint64_t scanout_ordinal = 0;
    uint64_t scanout_draw_count = 0;
    uint64_t scanout_last_draw[8] = {0};

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
        base == UINT64_C(0x32a4000) &&
        journal->counts[BOXDROID_M5_BINDING_SCANOUT] < 2) {
        journal->before_scanout_event = journal->last_event;
        memcpy(journal->before_scanout_operation, journal->last_operation,
               sizeof(journal->before_scanout_operation));
        scanout_draw_snapshot = true;
        scanout_ordinal = journal->counts[BOXDROID_M5_BINDING_SCANOUT] + 1;
        scanout_draw_count =
            journal->counts[BOXDROID_M5_BINDING_GUEST_DRAW];
        memcpy(scanout_last_draw,
               journal->last_values[BOXDROID_M5_BINDING_GUEST_DRAW],
               sizeof(scanout_last_draw));
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

    if (scanout_draw_snapshot) {
        uint64_t sequence = boxdroid_m5_diag_record(
            "VK32_LAST_DRAW_AT_SCANOUT", base, generation,
            scanout_ordinal, scanout_draw_count, scanout_last_draw[0],
            scanout_last_draw[2]);
        __android_log_print(ANDROID_LOG_INFO, TAG,
            "M5_VK32_LAST_DRAW_AT_SCANOUT seq=%" PRIu64
            " scanout=%" PRIu64 " draw_count=%" PRIu64 " api=%" PRIu64
            " primitive=%" PRIu64
            " vertices=%" PRIu64 " indices=%" PRIu64
            " color_mask=0x%" PRIx64 " scissor_xy=%016" PRIx64
            " scissor_wh=%016" PRIx64 " cull_depth_stencil_write=0x%" PRIx64,
            sequence, scanout_ordinal, scanout_draw_count,
            scanout_last_draw[0], scanout_last_draw[1],
            scanout_last_draw[2], scanout_last_draw[3], scanout_last_draw[4],
            scanout_last_draw[5], scanout_last_draw[6], scanout_last_draw[7]);
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
            " last_values=%" PRIu64 ",%" PRIu64 ",%" PRIu64 ",%" PRIu64
            " last_draw_api=%" PRIu64 " primitive=%" PRIu64
            " vertices=%" PRIu64 " indices=%" PRIu64
            " color_mask=0x%" PRIx64 " scissor_xy=%016" PRIx64
            " scissor_wh=%016" PRIx64 " draw_state=0x%" PRIx64,
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
            j->before_scanout_operation[2], j->before_scanout_operation[3],
            j->last_values[BOXDROID_M5_BINDING_GUEST_DRAW][0],
            j->last_values[BOXDROID_M5_BINDING_GUEST_DRAW][1],
            j->last_values[BOXDROID_M5_BINDING_GUEST_DRAW][2],
            j->last_values[BOXDROID_M5_BINDING_GUEST_DRAW][3],
            j->last_values[BOXDROID_M5_BINDING_GUEST_DRAW][4],
            j->last_values[BOXDROID_M5_BINDING_GUEST_DRAW][5],
            j->last_values[BOXDROID_M5_BINDING_GUEST_DRAW][6],
            j->last_values[BOXDROID_M5_BINDING_GUEST_DRAW][7]);
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

#ifdef BOXDROID_M55_RUNTIME
/* qemu_init() creates the block backend before guest execution enters
 * qemu_main_loop(). Reject QEMU's empty-DVD fallback for the selected image.
 */
static bool m55_verify_selected_dvd(uint64_t *actual_size)
{
    DriveInfo *dinfo = drive_get_by_index(IF_IDE, 1);
    BlockBackend *blk;
    int64_t length;

    if (!dinfo) return false;
    blk = blk_by_legacy_dinfo(dinfo);
    if (!blk || !blk_is_inserted(blk)) return false;
    length = blk_getlength(blk);
    if (length < 0) return false;
    *actual_size = (uint64_t) length;
    return *actual_size == m55_dvd_expected_size;
}

static void m55_publish_init_failure(int status)
{
    pthread_mutex_lock(&state_lock);
    init_succeeded = false;
    init_finished = true;
    loop_finished = true;
    loop_status = status;
    pthread_cond_broadcast(&state_changed);
    pthread_mutex_unlock(&state_lock);
}
#endif

static void *run_xbox(void *unused)
{
    int status;
    const char *hdd_arg = arguments[6];
    (void) unused;

#ifdef BOXDROID_M54_RUNTIME
    qemu_thread_naming(true);
#endif
#ifdef BOXDROID_M55_RUNTIME
    hdd_arg = arguments[8];
#endif
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M5_QEMU_INPUT_PATHS bios=%s mcpx=%s hdd=%s machine_arg=%s hdd_arg=%s",
        arguments[4], runtime_mcpx_path, runtime_hdd_path,
        arguments[2], hdd_arg);
#ifdef BOXDROID_M55_RUNTIME
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M55_QEMU_DVD_CONFIG fdset=%d drive_arg=%s expected_bytes=%" PRIu64,
        M55_DVD_FDSET, arguments[10], m55_dvd_expected_size);
#endif
    log_message(ANDROID_LOG_INFO, "XEMU_QEMU_INIT_ENTER");
    qemu_init(g_strv_length(arguments), arguments);
    log_message(ANDROID_LOG_INFO, "XEMU_QEMU_INIT_RETURN");
#ifdef BOXDROID_M55_RUNTIME
    /* QEMU's early -add-fd handling has duplicated the supplied descriptor
     * into fdset 55 and closed this original duplicate. */
    m55_dvd_source_fd = -1;
    uint64_t attached_size = 0;
    if (!m55_verify_selected_dvd(&attached_size)) {
        __android_log_print(ANDROID_LOG_ERROR, TAG,
            "M55_DVD_ATTACH_FAILED fdset=%d expected_bytes=%" PRIu64
            " actual_bytes=%" PRIu64 " guest_started=0",
            M55_DVD_FDSET, m55_dvd_expected_size, attached_size);
        qemu_cleanup(1);
        bql_unlock();
        replay_mutex_unlock();
        m55_dvd_expected_size = 0;
        m55_publish_init_failure(1);
        return NULL;
    }
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M55_DVD_ATTACHED drive=ide,index=1 fdset=%d bytes=%" PRIu64
        " inserted=1 format=raw",
        M55_DVD_FDSET, attached_size);
#endif
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
#ifdef BOXDROID_M55_RUNTIME
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M55_GAME_BOOT_ATTEMPT guest_start=1 dvd_attached=1");
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M55_MCPX_BIOS_START dvd_attached=1");
#endif
    log_message(ANDROID_LOG_INFO, "XBOX_MAIN_LOOP_START guest=i386 host=aarch64 tcg=on");
    boxdroid_m5_diag_guest_io_start();
    status = qemu_main_loop();
    __android_log_print(ANDROID_LOG_INFO, TAG,
                        "XBOX_QEMU_LOOP_RETURN status=%d", status);
    if (xbox_display_listener.ds) {
        unregister_displaychangelistener(&xbox_display_listener);
    }
#ifdef BOXDROID_M62_INPUT
    boxdroid_m62_input_clear_all();
#endif
    log_message(ANDROID_LOG_INFO, "XBOX_QEMU_CLEANUP_BEGIN");
    qemu_cleanup(status);
    log_message(ANDROID_LOG_INFO, "XBOX_QEMU_CLEANUP_COMPLETE");
#ifdef BOXDROID_M55_RUNTIME
    m55_dvd_expected_size = 0;
#endif
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
#ifdef BOXDROID_M55_RUNTIME
    const int arg_shift = 2;
#else
    const int arg_shift = 0;
#endif
    (void) self;
    if (thread_created) return -EALREADY;
#ifdef BOXDROID_M55_RUNTIME
    if (m55_dvd_source_fd < 0 || m55_dvd_expected_size == 0) {
        __android_log_print(ANDROID_LOG_ERROR, TAG,
                            "M55_START_REJECTED reason=no_validated_dvd");
        return -EPERM;
    }
#endif
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
#ifdef BOXDROID_M55_RUNTIME
    arguments[5] = ARG("-add-fd");
    arguments[6] = g_strdup_printf("fd=%d,set=%d", m55_dvd_source_fd,
                                   M55_DVD_FDSET);
    arguments[7] = ARG("-drive");
    arguments[8] = "file=BOXDROID_HDD,if=ide,index=0,media=disk,format=qcow2";
    arguments[9] = ARG("-drive");
    arguments[10] = ARG("file=/dev/fdset/55,if=ide,index=1,media=cdrom,format=raw");
#else
    arguments[8] = ARG("if=ide,index=1,media=cdrom,file=");
#endif
    arguments[9 + arg_shift] = ARG("-display");
    arguments[10 + arg_shift] = ARG("none");
    arguments[11 + arg_shift] = ARG("-serial");
    arguments[12 + arg_shift] = ARG("none");
    arguments[13 + arg_shift] = ARG("-monitor");
    arguments[14 + arg_shift] = ARG("none");
    arguments[15 + arg_shift] = ARG("-net");
    arguments[16 + arg_shift] = ARG("none");
    arguments[17 + arg_shift] = ARG("-accel");
    arguments[18 + arg_shift] = ARG("tcg,thread=single");
    arguments[19 + arg_shift] = ARG("-D");
    arguments[20 + arg_shift] = (char *) log_path;
    arguments[21 + arg_shift] = ARG("-d");
    arguments[22 + arg_shift] = ARG("guest_errors,cpu_reset,exec,in_asm");
    arguments[23 + arg_shift] = ARG("-dfilter");
    /* Capture only the reset vector and the observed late polling range.
     * The M5 TCG hook suppresses per-execution logs for that polling range. */
    arguments[24 + arg_shift] = ARG("0x8001b000..0x8001b080,0xfffffff0..0xffffffff");
#ifdef BOXDROID_M54_X87_PROFILE
    arguments[22 + arg_shift] = ARG("guest_errors,in_asm,op,out_asm");
    arguments[24 + arg_shift] = ARG("0x80058c00..0x80058d00,0x80058180..0x80058300,0x800566cf..0x80056980,0x80042980..0x80042a00");
#endif
    arguments[25 + arg_shift] = ARG("-device");
    arguments[26 + arg_shift] = NULL;
    arguments[27 + arg_shift] = ARG("-m");
    arguments[28 + arg_shift] = ARG("64");
    arguments[29 + arg_shift] = ARG("-device");
    arguments[30 + arg_shift] = ARG("usb-hub,port=1,ports=4");
    arguments[31 + arg_shift] = NULL;
    arguments[32 + arg_shift] = NULL;
#ifdef BOXDROID_M62_INPUT
    /* Reuse Xemu's existing Xbox XID device on player-one's internal hub.
     * QEMU creates it during qemu_init, before MCPX/BIOS enters guest code. */
    arguments[31 + arg_shift] = ARG("-device");
    arguments[32 + arg_shift] = ARG("usb-hub,port=1.3,ports=3");
    arguments[33 + arg_shift] = ARG("-device");
    arguments[34 + arg_shift] = ARG("usb-xbox-gamepad,port=1.3.1,index=0");
    arguments[35 + arg_shift] = NULL;
#endif

    /* Replace placeholders after preserving the Java strings through qemu_init. */
    arguments[2] = g_strdup_printf("xbox,bootrom=%s,kernel-irqchip=off,avpack=scart", mcpx_path);
#ifdef BOXDROID_M55_RUNTIME
    arguments[8] = g_strdup_printf("file=%s,if=ide,index=0,media=disk,format=qcow2", hdd_path);
#else
    arguments[6] = g_strdup_printf("file=%s,if=ide,index=0,media=disk,format=qcow2", hdd_path);
#endif
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
    arguments[26 + arg_shift] = g_strdup_printf("smbus-storage,file=%s", eeprom_path);
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
    bool started = init_succeeded;
    if (!started) {
        pthread_join(qemu_thread, NULL);
        thread_created = false;
    }
    (*env)->ReleaseStringUTFChars(env, bios, bios_path);
    (*env)->ReleaseStringUTFChars(env, mcpx, mcpx_path);
    (*env)->ReleaseStringUTFChars(env, hdd, hdd_path);
    (*env)->ReleaseStringUTFChars(env, log, log_path);
    return started ? 0 : -EIO;
}

#ifdef BOXDROID_M55_RUNTIME
JNIEXPORT jint JNICALL
Java_org_boxdroid_m5_MainActivity_nativeXboxStartWithDvd(JNIEnv *env, jobject self,
                                                          jstring bios, jstring mcpx,
                                                          jstring hdd, jstring log,
                                                          jint selected_fd,
                                                          jlong selected_size)
{
    struct stat st;
    uint8_t probe;
    int fd_flags;
    int qemu_fd;
    ssize_t first_read, last_read;
    int result;

    if (m55_dvd_source_fd >= 0 || selected_fd < STDERR_FILENO + 1) {
        return -EINVAL;
    }
    if (fstat(selected_fd, &st) < 0 || st.st_size < 2048) {
        __android_log_print(ANDROID_LOG_ERROR, TAG,
            "M55_URI_FD_REJECTED reason=invalid_size_or_unreadable errno=%d", errno);
        return -EINVAL;
    }
    first_read = pread(selected_fd, &probe, sizeof(probe), 0);
    last_read = pread(selected_fd, &probe, sizeof(probe), st.st_size - 1);
    if (first_read != 1 || last_read != 1 ||
        (selected_size > 0 && (uint64_t) selected_size != (uint64_t) st.st_size)) {
        __android_log_print(ANDROID_LOG_ERROR, TAG,
            "M55_URI_FD_REJECTED reason=random_read_or_size_mismatch size=%" PRIu64
            " metadata_size=%" PRId64 " first=%zd last=%zd errno=%d",
            (uint64_t) st.st_size, (int64_t) selected_size,
            first_read, last_read, errno);
        return -EIO;
    }

    qemu_fd = fcntl(selected_fd, F_DUPFD, STDERR_FILENO + 1);
    if (qemu_fd < 0) {
        __android_log_print(ANDROID_LOG_ERROR, TAG,
            "M55_URI_FD_DUP_FAILED errno=%d", errno);
        return -errno;
    }
    fd_flags = fcntl(qemu_fd, F_GETFD);
    if (fd_flags < 0 || fcntl(qemu_fd, F_SETFD, fd_flags & ~FD_CLOEXEC) < 0) {
        int saved_errno = errno;
        close(qemu_fd);
        __android_log_print(ANDROID_LOG_ERROR, TAG,
            "M55_URI_FD_PREPARE_FAILED errno=%d", saved_errno);
        return -saved_errno;
    }

    m55_dvd_source_fd = qemu_fd;
    m55_dvd_expected_size = (uint64_t) st.st_size;
    __android_log_print(ANDROID_LOG_INFO, TAG,
        "M55_URI_FD_VALIDATED fd_ready=1 fdset=%d size=%" PRIu64
        " first_byte_read=1 last_byte_read=1 owner=QEMU_add-fd",
        M55_DVD_FDSET, m55_dvd_expected_size);

    result = Java_org_boxdroid_m5_MainActivity_nativeXboxStart(
        env, self, bios, mcpx, hdd, log);
    if (result != 0 && m55_dvd_source_fd >= 0) {
        close(m55_dvd_source_fd);
        m55_dvd_source_fd = -1;
        m55_dvd_expected_size = 0;
    }
    return result;
}
#endif

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
    boxdroid_m5_diag_progress_summary();
    thread_created = false;
    return loop_status;
}
