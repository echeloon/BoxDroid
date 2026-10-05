#include "qemu/osdep.h"

#include <android/log.h>
#include <errno.h>
#include <pthread.h>
#include <signal.h>
#include <stdatomic.h>
#include <time.h>
#include <jni.h>

#include "qemu/main-loop.h"
#include "system/replay.h"
#include "system/runstate.h"
#include "system/system.h"
#include "system/boxdroid-runtime.h"

#define LOG_TAG "BoxDroidM3"
#define PASS_MARKER "BOXDROID_TCG_PASS=42"
#define FAILURE_MARKER "BOXDROID_TCG_FAIL"
#define WATCHDOG_SECONDS 20

JNIEXPORT jint JNICALL
Java_org_boxdroid_MainActivity_nativeRunTcgTest(JNIEnv *env, jobject self,
                                                   jstring guest,
                                                   jstring serial,
                                                   jstring trace);

typedef enum RuntimeState {
    RUNTIME_NEW,
    RUNTIME_INITIALIZED,
    RUNTIME_RUNNING,
    RUNTIME_STOPPED,
} RuntimeState;

static pthread_mutex_t runtime_mutex = PTHREAD_MUTEX_INITIALIZER;
static atomic_bool watcher_stop;
static atomic_bool guest_passed;
static atomic_bool watcher_timed_out;
static RuntimeState runtime_state = RUNTIME_NEW;
static pthread_t watcher_thread;
static bool watcher_created;
static char uart_path[PATH_MAX];

static void boxdroid_log(int priority, const char *message)
{
    __android_log_write(priority, LOG_TAG, message);
}

static bool file_contains_marker(const char *path, const char *marker)
{
    char data[4096];
    ssize_t length;
    int fd = open(path, O_RDONLY | O_CLOEXEC);

    if (fd < 0) {
        return false;
    }
    length = read(fd, data, sizeof(data) - 1);
    close(fd);
    if (length <= 0) {
        return false;
    }
    data[length] = '\0';
    return strstr(data, marker) != NULL;
}

static int validate_runtime_paths(const char *guest_path,
                                  const char *serial_path,
                                  const char *trace_path)
{
    const char *writable_paths[] = {serial_path, trace_path};
    size_t i;
    int fd;

    if (access(guest_path, R_OK) != 0) {
        int error = errno;
        __android_log_print(ANDROID_LOG_ERROR, LOG_TAG,
                            "RUNTIME_INPUT_ERROR guest_path errno=%d (%s)",
                            error, strerror(error));
        return -error;
    }
    for (i = 0; i < G_N_ELEMENTS(writable_paths); i++) {
        fd = open(writable_paths[i], O_WRONLY | O_CREAT | O_TRUNC | O_CLOEXEC, 0600);
        if (fd < 0) {
            int error = errno;
            __android_log_print(ANDROID_LOG_ERROR, LOG_TAG,
                                "RUNTIME_INPUT_ERROR output_path=%s errno=%d (%s)",
                                writable_paths[i], error, strerror(error));
            return -error;
        }
        close(fd);
    }
    return 0;
}

static void log_tcg_jit_mappings(void)
{
    char line[512];
    FILE *maps = fopen("/proc/self/maps", "r");

    if (!maps) {
        __android_log_print(ANDROID_LOG_WARN, LOG_TAG,
                            "TCG_JIT_MAPS_UNAVAILABLE errno=%d", errno);
        return;
    }
    while (fgets(line, sizeof(line), maps)) {
        if (strstr(line, "tcg-jit") || strstr(line, "memfd:tcg")) {
            __android_log_print(ANDROID_LOG_INFO, LOG_TAG,
                                "TCG_JIT_MAP %s", g_strchomp(line));
        }
    }
    fclose(maps);
}

static void *guest_watch_thread(void *opaque)
{
    struct timespec pause = {.tv_sec = 0, .tv_nsec = 100000000};
    time_t deadline = time(NULL) + WATCHDOG_SECONDS;

    (void) opaque;
    __android_log_print(ANDROID_LOG_INFO, LOG_TAG,
                        "WATCHER_START pthread=%lu uart=%s",
                        (unsigned long) pthread_self(), uart_path);
    while (!atomic_load(&watcher_stop)) {
        if (file_contains_marker(uart_path, PASS_MARKER)) {
            atomic_store(&guest_passed, true);
            boxdroid_log(ANDROID_LOG_INFO,
                         "TCG_GUEST_RESULT marker=BOXDROID_TCG_PASS=42 expected=42");
            /* TCG creates its code buffer lazily, after the first guest TB. */
            log_tcg_jit_mappings();
            boxdroid_log(ANDROID_LOG_INFO,
                         "SIGNAL_DELIVERY_REQUEST signal=SIGTERM source=watcher");
            {
                int signal_result = raise(SIGTERM);
                __android_log_print(ANDROID_LOG_INFO, LOG_TAG,
                                    "SIGNAL_DELIVERY_RETURN signal=SIGTERM rc=%d", signal_result);
            }
            return NULL;
        }
        if (file_contains_marker(uart_path, FAILURE_MARKER)) {
            boxdroid_log(ANDROID_LOG_ERROR, "TCG_GUEST_RESULT marker=BOXDROID_TCG_FAIL");
            qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_QMP_QUIT);
            return NULL;
        }
        if (time(NULL) >= deadline) {
            atomic_store(&watcher_timed_out, true);
            boxdroid_log(ANDROID_LOG_ERROR, "WATCHDOG timeout waiting for guest UART result");
            qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_QMP_QUIT);
            return NULL;
        }
        nanosleep(&pause, NULL);
    }
    return NULL;
}

__attribute__((visibility("default")))
int boxdroid_runtime_initialize(const char *guest_path,
                                const char *serial_path,
                                const char *trace_path)
{
    char *argv[] = {
        (char *) "boxdroid",
        (char *) "-machine", (char *) "virt",
        (char *) "-accel", (char *) "tcg,split-wx=on",
        (char *) "-cpu", (char *) "cortex-a57",
        (char *) "-smp", (char *) "1",
        (char *) "-m", (char *) "64M",
        (char *) "-no-user-config",
        (char *) "-nodefaults",
        (char *) "-display", (char *) "none",
        (char *) "-monitor", (char *) "none",
        (char *) "-serial", NULL,
        (char *) "-kernel", (char *) guest_path,
        (char *) "-d", (char *) "in_asm,exec",
        (char *) "-D", (char *) trace_path,
        NULL,
    };
    size_t serial_length;
    char *serial_arg;
    char stderr_path[PATH_MAX];
    int argc = 0;
    int stderr_fd;

    if (!guest_path || !serial_path || !trace_path) {
        return -EINVAL;
    }
    {
        int error = validate_runtime_paths(guest_path, serial_path, trace_path);
        if (error != 0) {
            return error;
        }
    }
    pthread_mutex_lock(&runtime_mutex);
    if (runtime_state != RUNTIME_NEW) {
        pthread_mutex_unlock(&runtime_mutex);
        return -EALREADY;
    }
    serial_length = strlen(serial_path) + sizeof("file:");
    serial_arg = malloc(serial_length);
    if (!serial_arg) {
        pthread_mutex_unlock(&runtime_mutex);
        return -ENOMEM;
    }
    snprintf(serial_arg, serial_length, "file:%s", serial_path);
    argv[18] = serial_arg;
    snprintf(uart_path, sizeof(uart_path), "%s", serial_path);
    snprintf(stderr_path, sizeof(stderr_path), "%s.stderr", trace_path);
    stderr_fd = open(stderr_path, O_WRONLY | O_CREAT | O_TRUNC | O_CLOEXEC, 0600);
    if (stderr_fd >= 0) {
        dup2(stderr_fd, STDERR_FILENO);
        close(stderr_fd);
    }

    while (argv[argc]) {
        argc++;
    }
    __android_log_print(ANDROID_LOG_INFO, LOG_TAG,
                        "RUNTIME_INIT guest=%s serial=%s trace=%s api=explicit accel=tcg split-wx=on",
                        guest_path, serial_path, trace_path);
    atomic_store(&watcher_stop, false);
    atomic_store(&guest_passed, false);
    atomic_store(&watcher_timed_out, false);
    qemu_init(argc, argv);
    free(serial_arg);
    runtime_state = RUNTIME_INITIALIZED;
    boxdroid_log(ANDROID_LOG_INFO,
                 "RUNTIME_INIT_OK qemu_init returned; SIGPIPE ignored; SIGINT/SIGHUP/SIGTERM handlers installed");
    log_tcg_jit_mappings();
    pthread_mutex_unlock(&runtime_mutex);
    return 0;
}

__attribute__((visibility("default")))
int boxdroid_runtime_run(void)
{
    int status;

    pthread_mutex_lock(&runtime_mutex);
    if (runtime_state != RUNTIME_INITIALIZED) {
        pthread_mutex_unlock(&runtime_mutex);
        return -EINVAL;
    }
    runtime_state = RUNTIME_RUNNING;
    pthread_mutex_unlock(&runtime_mutex);

    if (pthread_create(&watcher_thread, NULL, guest_watch_thread, NULL) != 0) {
        boxdroid_log(ANDROID_LOG_ERROR, "WATCHER_CREATE_FAIL");
        qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_QMP_QUIT);
        return -EAGAIN;
    }
    watcher_created = true;
    boxdroid_log(ANDROID_LOG_INFO, "QEMU_MAIN_LOOP_START tcg=aarch64 guest=aarch64");

    /* Match QEMU's normal entry path: qemu_init owns both locks on return. */
    bql_unlock();
    replay_mutex_unlock();
    replay_mutex_lock();
    bql_lock();
    status = qemu_main_loop();
    qemu_cleanup(status);
    bql_unlock();
    replay_mutex_unlock();

    atomic_store(&watcher_stop, true);
    if (watcher_created) {
        pthread_join(watcher_thread, NULL);
        watcher_created = false;
    }

    pthread_mutex_lock(&runtime_mutex);
    runtime_state = RUNTIME_STOPPED;
    pthread_mutex_unlock(&runtime_mutex);
    __android_log_print(atomic_load(&guest_passed) ? ANDROID_LOG_INFO : ANDROID_LOG_ERROR,
                        LOG_TAG,
                        "RUNTIME_STOP status=%d guest_passed=%d watchdog=%d",
                        status, atomic_load(&guest_passed),
                        atomic_load(&watcher_timed_out));
    return atomic_load(&guest_passed) ? 0 : -EIO;
}

__attribute__((visibility("default")))
void boxdroid_runtime_request_shutdown(void)
{
    boxdroid_log(ANDROID_LOG_INFO, "RUNTIME_SHUTDOWN_REQUEST");
    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_QMP_QUIT);
}

JNIEXPORT jint JNICALL
Java_org_boxdroid_MainActivity_nativeRunTcgTest(JNIEnv *env, jobject self,
                                                   jstring guest,
                                                   jstring serial,
                                                   jstring trace)
{
    const char *guest_path = (*env)->GetStringUTFChars(env, guest, NULL);
    const char *serial_path = (*env)->GetStringUTFChars(env, serial, NULL);
    const char *trace_path = (*env)->GetStringUTFChars(env, trace, NULL);
    int result = boxdroid_runtime_initialize(guest_path, serial_path, trace_path);

    (void) self;
    if (result == 0) {
        result = boxdroid_runtime_run();
    }
    (*env)->ReleaseStringUTFChars(env, trace, trace_path);
    (*env)->ReleaseStringUTFChars(env, serial, serial_path);
    (*env)->ReleaseStringUTFChars(env, guest, guest_path);
    return result;
}
