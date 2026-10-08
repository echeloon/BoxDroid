#include "qemu/osdep.h"
#include "ui/xemu-settings.h"
#include "ui/xemu-snapshots.h"
#include <android/log.h>
#include <sched.h>
#include <sys/system_properties.h>

/* Android has no desktop settings frontend; keep the core configuration
 * local to this embedded runtime and choose the existing Vulkan renderer. */
struct config g_config = {
    .display = {
        .renderer = CONFIG_DISPLAY_RENDERER_VULKAN,
        .quality = { .surface_scale = 1 },
    },
    .perf = { .cache_shaders = true },
    .audio = {
#ifdef BOXDROID_AUDIO
        /* Desktop config_spec.yml defaults to unity. Omitted C fields are zero. */
        .volume_limit = 1.0,
#endif
        .use_dsp = true,
        .use_dsp_jit = false,
        .hrtf = false,
    },
};

/* Discover the cores available to this process rather than assuming Android
 * CPU numbering. Leave CPU placement to the scheduler; limit the audio pool
 * so voice jobs do not flood the run queues used by TCG and PFIFO. Comparisons
 * on the Snapdragon 865 favor four over two/eight for audio continuity. The property
 * is read at startup and, only with profiling enabled, at quiescent APU frame
 * boundaries for comparisons in the same running scene. */
static int default_voice_workers = 2, available_worker_cpus = 1;
static int preferred_tcg_cpu = -1;

void boxdroid_android_configure_tcg_thread(void);
void boxdroid_android_configure_tcg_thread(void)
{
    char value[PROP_VALUE_MAX] = { 0 };
    /* Prime-only placement helped Pandora but increased Sega GT underruns.
     * Keep scheduler placement by default; explicit experiments can select a
     * capacity-derived core without imposing the policy on every title. */
    const bool requested =
        __system_property_get("debug.boxdroid.tcg_prime", value) &&
        strcmp(value, "1") == 0;
    cpu_set_t allowed, preferred;
    if (!requested || preferred_tcg_cpu < 0 ||
        sched_getaffinity(0, sizeof(allowed), &allowed) != 0 ||
        !CPU_ISSET(preferred_tcg_cpu, &allowed)) {
        __android_log_print(ANDROID_LOG_INFO, "BoxDroid",
            "HOST_TCG placement=scheduler requested=%d", requested);
        return;
    }
    CPU_ZERO(&preferred);
    CPU_SET(preferred_tcg_cpu, &preferred);
    if (sched_setaffinity(0, sizeof(preferred), &preferred) != 0) {
        __android_log_print(ANDROID_LOG_INFO, "BoxDroid",
            "HOST_TCG placement=scheduler affinity_error=%d", errno);
        return;
    }
    __android_log_print(ANDROID_LOG_INFO, "BoxDroid",
        "HOST_TCG placement=prime selected_cpu=%d policy=explicit",
        preferred_tcg_cpu);
}

bool boxdroid_android_requested_dsp_jit(void);
bool boxdroid_android_requested_dsp_jit(void)
{
    char value[PROP_VALUE_MAX] = { 0 };
    return __system_property_get("debug.boxdroid.dsp_jit", value) &&
           strcmp(value, "1") == 0;
}

bool boxdroid_android_requested_apu_participation(void);
bool boxdroid_android_requested_apu_participation(void)
{
    char value[PROP_VALUE_MAX] = { 0 };
    return __system_property_get("debug.boxdroid.voice_apu", value) &&
           strcmp(value, "1") == 0;
}

int boxdroid_android_requested_voice_workers(void);
int boxdroid_android_requested_voice_workers(void)
{
    int workers = default_voice_workers;
    char value[PROP_VALUE_MAX] = { 0 };
    if (__system_property_get("debug.boxdroid.voice_workers", value)) {
        char *end;
        long requested = strtol(value, &end, 10);
        if (*end == '\0' && requested >= 1 && requested <= 16) workers = requested;
    }
    return MIN(workers, available_worker_cpus);
}

void boxdroid_android_configure_workers(void);
void boxdroid_android_configure_workers(void)
{
    cpu_set_t allowed;
    int capacities[CPU_SETSIZE] = { 0 };
    int maximum = 0, available = 0, performance = 0;
    if (sched_getaffinity(0, sizeof(allowed), &allowed) == 0) {
        for (int cpu = 0; cpu < CPU_SETSIZE; cpu++) {
            if (!CPU_ISSET(cpu, &allowed)) continue;
            available++;
            char filename[128];
            snprintf(filename, sizeof(filename),
                     "/sys/devices/system/cpu/cpu%d/cpu_capacity", cpu);
            FILE *file = fopen(filename, "r");
            if (file) {
                if (fscanf(file, "%d", &capacities[cpu]) != 1) capacities[cpu] = 0;
                fclose(file);
                maximum = MAX(maximum, capacities[cpu]);
            }
        }
        for (int cpu = 0; cpu < CPU_SETSIZE; cpu++) {
            if (maximum && capacities[cpu] >= maximum * 3 / 4) performance++;
        }
    }
    int peak_count = 0, runner_up = 0;
    preferred_tcg_cpu = -1;
    for (int cpu = 0; maximum && cpu < CPU_SETSIZE; cpu++) {
        if (capacities[cpu] == maximum) {
            peak_count++;
            preferred_tcg_cpu = cpu;
        } else {
            runner_up = MAX(runner_up, capacities[cpu]);
        }
    }
    /* Require a distinct, allowed prime core. Do not bind homogeneous or
     * unknown topologies, or infer core IDs from Android CPU numbering. */
    if (peak_count != 1 || performance < 2 || !runner_up ||
        runner_up > maximum * 9 / 10) preferred_tcg_cpu = -1;
    default_voice_workers = maximum ? MAX(1, MIN(4, performance)) : MIN(2, MAX(1, available));
    available_worker_cpus = MAX(1, available);
    g_config.audio.vp.num_workers = boxdroid_android_requested_voice_workers();
    __android_log_print(ANDROID_LOG_INFO, "BoxDroid",
        "HOST_WORKERS allowed_cores=%d performance_cores=%d voice_workers=%d placement=scheduler",
        available, performance, g_config.audio.vp.num_workers);
}

/* Snapshot metadata is desktop UI integration and is unused by Android. */
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
