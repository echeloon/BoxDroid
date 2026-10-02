#ifndef BOXDROID_M5_DIAGNOSTICS_H
#define BOXDROID_M5_DIAGNOSTICS_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

typedef enum BoxDroidM5Diagnostic {
    BOXDROID_M5_DIAG_REFRESH_CALLBACK,
    BOXDROID_M5_DIAG_GRAPHIC_HW_UPDATE,
    BOXDROID_M5_DIAG_PCRTC_START,
    BOXDROID_M5_DIAG_VGA_CRTC_WRITE,
    BOXDROID_M5_DIAG_PGRAPH_COLOR_DMA,
    BOXDROID_M5_DIAG_PGRAPH_SURFACE_FORMAT,
    BOXDROID_M5_DIAG_PGRAPH_SURFACE_PITCH,
    BOXDROID_M5_DIAG_PGRAPH_COLOR_OFFSET,
    BOXDROID_M5_DIAG_COLOR_BINDING,
    BOXDROID_M5_DIAG_FRAMEBUFFER_LOOKUP,
    BOXDROID_M5_DIAG_FRAMEBUFFER_HIT,
    BOXDROID_M5_DIAG_FRAMEBUFFER_MISS,
    BOXDROID_M5_DIAG_READBACK_BEGIN,
    BOXDROID_M5_DIAG_READBACK_COMPLETE,
    BOXDROID_M5_DIAG_DISPLAY_CALLBACK,
    BOXDROID_M5_DIAG_FRAME_PRESENT,
    BOXDROID_M5_DIAG_DOWNLOAD_WAIT,
    BOXDROID_M5_DIAG_DOWNLOAD_DIRTY,
    BOXDROID_M5_DIAG_DOWNLOAD_REQUESTED,
    BOXDROID_M5_DIAG_DOWNLOAD_SKIPPED,
    BOXDROID_M5_DIAG_DOWNLOAD_PERFORMED,
    BOXDROID_M5_DIAG_COUNT,
} BoxDroidM5Diagnostic;

typedef enum BoxDroidM5SampleBoundary {
    BOXDROID_M5_SAMPLE_NV2A_STAGING,
    BOXDROID_M5_SAMPLE_XBOX_VRAM,
    BOXDROID_M5_SAMPLE_DISPLAY_SURFACE,
    BOXDROID_M5_SAMPLE_PIXMAN_RGBA,
    BOXDROID_M5_SAMPLE_COUNT,
} BoxDroidM5SampleBoundary;

typedef struct BoxDroidM5BindingInfo {
    uint64_t pcrtc_start;
    uint64_t line_offset;
    uint64_t lookup_address;
    uint64_t binding_base;
    uint64_t binding_end;
    uint64_t delta;
    uint64_t pitch;
    uint64_t width;
    uint64_t height;
    uint64_t color_format;
    uint64_t host_vk_format;
    int64_t frame_time;
    int64_t draw_time;
    bool draw_dirty;
    bool upload_pending;
    bool initialized;
    bool cleared;
} BoxDroidM5BindingInfo;

void boxdroid_m5_diag_event(BoxDroidM5Diagnostic event,
                            uint64_t a, uint64_t b, uint64_t c,
                            uint64_t d, uint64_t e, uint64_t f);
void boxdroid_m5_diag_summary(void);
void boxdroid_m5_diag_binding(const BoxDroidM5BindingInfo *info);
void boxdroid_m5_diag_late_miss(uint64_t pcrtc_start, uint64_t line_offset,
                                uint64_t lookup_address,
                                const BoxDroidM5BindingInfo *nearest);
void boxdroid_m5_diag_track_surface(const void *surface);
bool boxdroid_m5_diag_is_tracked_surface(const void *surface);
void boxdroid_m5_diag_sample(BoxDroidM5SampleBoundary boundary,
                             const void *data, size_t size,
                             uint64_t nonblack_pixels,
                             const char *copy_status);

#endif
