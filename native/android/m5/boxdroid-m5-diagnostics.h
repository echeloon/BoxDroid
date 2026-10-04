#ifndef BOXDROID_M5_DIAGNOSTICS_H
#define BOXDROID_M5_DIAGNOSTICS_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

struct CPUState;

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

typedef enum BoxDroidM5BindingEvent {
    BOXDROID_M5_BINDING_CREATE,
    BOXDROID_M5_BINDING_REUSE,
    BOXDROID_M5_BINDING_UPLOAD_PENDING,
    BOXDROID_M5_BINDING_UPLOAD,
    BOXDROID_M5_BINDING_DRAW_DIRTY,
    BOXDROID_M5_BINDING_CLEAR,
    BOXDROID_M5_BINDING_GUEST_DRAW,
    BOXDROID_M5_BINDING_GPU_PROBE,
    BOXDROID_M5_BINDING_STAGING_COMPARE,
    BOXDROID_M5_BINDING_SCANOUT,
    BOXDROID_M5_BINDING_EVENT_COUNT,
} BoxDroidM5BindingEvent;

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
    uint64_t generation;
    uint64_t image;
    uint64_t image_view;
    uint64_t image_layout;
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
uint64_t boxdroid_m5_diag_record(const char *event, uint64_t a, uint64_t b,
                                uint64_t c, uint64_t d, uint64_t e,
                                uint64_t f);
void boxdroid_m5_diag_vram_sample(const char *boundary, uint64_t start,
                                 uint32_t line_offset, uint32_t pitch,
                                 uint32_t width, uint32_t height, int depth,
                                 const uint8_t *data, size_t length);
void boxdroid_m5_diag_vram_write(const char *writer, uint64_t address,
                                uint64_t bytes, uint64_t source,
                                uint64_t guest_pc);
void boxdroid_m5_diag_cpu_store_value(uint64_t address, size_t size,
                                      const uint8_t *before,
                                      const uint8_t *after, uint64_t guest_pc,
                                      uint64_t pcrtc_start,
                                      int64_t pre_store_us);
void boxdroid_m5_diag_vram_read(const char *reader, uint64_t address,
                               uint64_t bytes);
void boxdroid_m5_diag_target_vram_sample(const char *boundary,
                                        const uint8_t *vram,
                                        uint64_t vram_size,
                                        uint64_t sequence_event);
void boxdroid_m5_diag_framebuffer_sample(const char *boundary,
                                        uint64_t pcrtc_start,
                                        const uint8_t *data,
                                        size_t length);
void boxdroid_m5_diag_summary(void);
void boxdroid_m5_diag_binding(const BoxDroidM5BindingInfo *info);
void boxdroid_m5_diag_late_miss(uint64_t pcrtc_start, uint64_t line_offset,
                                uint64_t lookup_address,
                                const BoxDroidM5BindingInfo *nearest,
                                const BoxDroidM5BindingInfo *binding_32a4000,
                                const BoxDroidM5BindingInfo *binding_3628000);
void boxdroid_m5_diag_track_surface(const void *surface);
bool boxdroid_m5_diag_is_tracked_surface(const void *surface);
void boxdroid_m5_diag_sample(BoxDroidM5SampleBoundary boundary,
                             const void *data, size_t size,
                             uint64_t nonblack_pixels,
                             const char *copy_status);
void boxdroid_m5_diag_binding_event(BoxDroidM5BindingEvent event,
                                    uint64_t base, uint64_t generation,
                                    const uint64_t values[8]);
void boxdroid_m5_diag_firmware_event(const char *kind, const char *stage,
                                    const char *path, int64_t result,
                                    uint64_t bytes);
void boxdroid_m5_diag_hdd_open(const char *path, int result,
                               uint64_t virtual_size);
void boxdroid_m5_diag_guest_io_start(void);
void boxdroid_m5_diag_guest_io_stop(void);
void boxdroid_m5_diag_hdd_io(bool write, const char *path, uint64_t offset,
                             uint64_t bytes, int result);
void boxdroid_m5_diag_tb_exec(struct CPUState *cpu, uint64_t pc,
                              uintptr_t tb_id, uint16_t guest_insns);
void boxdroid_m5_diag_cpu_exit(int result, bool halted,
                               uint32_t interrupts);
void boxdroid_m5_diag_device_access(bool write, const char *region,
                                    uint64_t offset, unsigned size,
                                    uint64_t value, int result,
                                    struct CPUState *cpu);
void boxdroid_m5_diag_progress_summary(void);

#ifdef BOXDROID_M54_RUNTIME
void boxdroid_m54_tb_return(bool chained, unsigned exit_index);
void boxdroid_m54_tcg_event(unsigned kind);
void boxdroid_m54_lookup_pc(uint64_t pc);
#endif

#endif
