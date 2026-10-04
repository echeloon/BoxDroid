#include "qemu/osdep.h"
#include "ui/xemu-settings.h"
#include "ui/xemu-snapshots.h"

/* Android M5 has no desktop settings frontend; keep the core configuration
 * local to this embedded runtime and choose the existing Vulkan renderer. */
struct config g_config = {
    .display = {
        .renderer = CONFIG_DISPLAY_RENDERER_VULKAN,
        .quality = { .surface_scale = 1 },
    },
    .perf = { .cache_shaders = true },
    .audio = {
#ifdef BOXDROID_M6_AUDIO
        /* Desktop config_spec.yml defaults to unity. Omitted C fields are zero. */
        .volume_limit = 1.0,
#endif
        .use_dsp = true,
        .use_dsp_jit = false,
        .hrtf = false,
    },
};

/* Snapshot metadata is desktop UI integration and is unused by M5. */
void xemu_snapshots_save_extra_data(QEMUFile *f)
{
    (void) f;
}

bool xemu_snapshots_offset_extra_data(QEMUFile *f)
{
    (void) f;
    return true;
}

void xemu_snapshots_mark_dirty(void)
{
}
