#include "qemu/osdep.h"

#include <android/log.h>
#include <jni.h>
#include <pthread.h>
#include <errno.h>

#include "qemu/main-loop.h"
#include "system/replay.h"
#include "system/runstate.h"
#include "system/system.h"
#include "crypto/init.h"
#include "hw/xbox/eeprom_generation.h"
#include "qapi/error.h"
#include "ui/console.h"
#include "ui/surface.h"
#include "hw/xbox/nv2a/nv2a.h"

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
    (void) x;
    (void) y;
    (void) width;
    (void) height;

    if (!surface || !surface->image) {
        return;
    }
    surface_width_px = surface_width(surface);
    surface_height_px = surface_height(surface);
    stride = surface_width_px * 4;
    if (surface_width_px <= 0 || surface_height_px <= 0) {
        return;
    }
    /* Flush the current NV2A Vulkan scanout surface into shared Xbox VRAM.
     * With HAVE_EXTERNAL_MEMORY=0 this is Xemu's CPU-visible download path. */
    if (nv2a_get_framebuffer_surface() < 0) {
        nv2a_release_framebuffer_surface();
        return;
    }
    rgba = g_malloc((size_t) stride * surface_height_px);
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
    if (boxdroid_android_present_rgba(rgba, surface_width_px,
                                      surface_height_px, stride)) {
        guest_frame_count++;
        if (guest_frame_count == 1 || guest_frame_count % 120 == 0) {
            __android_log_print(ANDROID_LOG_INFO, TAG,
                                "XBOX_NV2A_FRAME_PRESENT count=%" PRIu64
                                " guest_extent=%dx%d pixel_hash=%016" PRIx64,
                                guest_frame_count, surface_width_px,
                                surface_height_px, frame_hash);
        }
    }
    pixman_image_unref(converted);
    g_free(rgba);
}

static const DisplayChangeListenerOps xbox_display_ops = {
    .dpy_name = "BoxDroid Android Vulkan",
    .dpy_gfx_update = xbox_display_update,
};
static DisplayChangeListener xbox_display_listener = {
    .ops = &xbox_display_ops,
};

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
    log_message(ANDROID_LOG_INFO, "XBOX_SHUTDOWN_REQUEST");
    bql_lock();
    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_QMP_QUIT);
    bql_unlock();
    log_message(ANDROID_LOG_INFO, "XBOX_SHUTDOWN_REQUEST_QUEUED");
    pthread_join(qemu_thread, NULL);
    thread_created = false;
    return loop_status;
}
