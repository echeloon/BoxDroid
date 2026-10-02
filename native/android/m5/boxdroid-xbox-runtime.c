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
static uint64_t diagnostic_counts[BOXDROID_M5_DIAG_COUNT];
static uint64_t diagnostic_sample_counts[BOXDROID_M5_SAMPLE_COUNT];
static const void *diagnostic_scanout_surface;
static bool diagnostic_binding_logged;
static bool diagnostic_late_miss_logged;
static bool diagnostic_display_surface_logged;

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
    boxdroid_m5_diag_event(BOXDROID_M5_DIAG_REFRESH_CALLBACK,
                           qemu_clock_get_ms(QEMU_CLOCK_REALTIME), 0, 0, 0, 0, 0);
    graphic_hw_update(dcl->con);
    boxdroid_m5_diag_event(BOXDROID_M5_DIAG_GRAPHIC_HW_UPDATE,
                           qemu_clock_get_ms(QEMU_CLOCK_REALTIME), 0, 0, 0, 0, 0);
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
        " format=0x%" PRIx64 " vk_format=%" PRIu64 " draw_dirty=%d"
        " upload_pending=%d initialized=%d cleared=%d frame_time=%" PRId64
        " draw_time=%" PRId64,
        info->pcrtc_start, info->line_offset, info->lookup_address,
        info->binding_base, info->binding_end, info->delta,
        info->pitch, info->width, info->height, info->color_format,
        info->host_vk_format, info->draw_dirty, info->upload_pending,
        info->initialized, info->cleared, info->frame_time, info->draw_time);
}

void boxdroid_m5_diag_late_miss(uint64_t pcrtc_start, uint64_t line_offset,
                                uint64_t lookup_address,
                                const BoxDroidM5BindingInfo *nearest)
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

static void *run_xbox(void *unused)
{
    int status;
    (void) unused;

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
