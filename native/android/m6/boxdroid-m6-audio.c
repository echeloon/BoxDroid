#define _POSIX_C_SOURCE 200809L

#include "boxdroid-m6-audio.h"

#include <aaudio/AAudio.h>
#include <android/log.h>
#include <jni.h>
#include <math.h>
#include <stdatomic.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#define M6_TAG "BoxDroidM6Audio"
#define M6_RATE 48000
#define M6_CHANNELS 2
#define M6_RING_FRAMES 2048

JNIEXPORT jint JNICALL
Java_org_boxdroid_M6Activity_nativeM6AudioInitialize(JNIEnv *env, jobject self);
JNIEXPORT void JNICALL
Java_org_boxdroid_M6Activity_nativeM6AudioSetFocus(JNIEnv *env, jobject self,
                                                       jboolean focused);
JNIEXPORT void JNICALL
Java_org_boxdroid_M6Activity_nativeM6AudioSetForeground(JNIEnv *env, jobject self,
                                                            jboolean foreground);
JNIEXPORT jstring JNICALL
Java_org_boxdroid_M6Activity_nativeM6AudioOverlayMetrics(JNIEnv *env, jobject self);
JNIEXPORT void JNICALL
Java_org_boxdroid_M6Activity_nativeM6AudioShutdown(JNIEnv *env, jobject self);

typedef struct M6StereoFrame {
    int16_t channel[M6_CHANNELS];
} M6StereoFrame;

static M6StereoFrame ring[M6_RING_FRAMES];
static _Atomic uint64_t ring_write;
static _Atomic uint64_t ring_read;
static _Atomic bool flush_requested;
static _Atomic bool focus_granted;
static _Atomic bool foreground;
static _Atomic bool apu_attached;
static _Atomic bool stream_initialized;
static _Atomic bool stream_started;
static _Atomic int stream_error;
static _Atomic uint64_t stat_callbacks;
static _Atomic uint64_t stat_callback_frames;
static _Atomic uint64_t stat_underrun_callbacks;
static _Atomic uint64_t stat_underrun_frames;
static _Atomic uint64_t stat_overrun_blocks;
static _Atomic uint64_t stat_dropped_frames;
static _Atomic uint64_t stat_offered_frames;
static _Atomic uint64_t stat_nonzero_frames;
static _Atomic uint64_t stat_source_nonzero_frames;
static _Atomic uint64_t stat_consumed_frames;
static _Atomic uint64_t stat_consumed_nonzero_frames;
static _Atomic int32_t stat_source_peak;
static _Atomic int32_t stat_ring_peak;
static _Atomic int32_t stat_consumed_peak;
static _Atomic uint64_t stat_muted_frames;
static _Atomic uint64_t last_source_callback;
static _Atomic int stat_last_callback_frames;
static _Atomic int stat_min_callback_frames;
static _Atomic int stat_max_callback_frames;
static _Atomic int64_t last_stats_log_ns;

static AAudioStream *audio_stream;
static _Atomic int32_t actual_rate;
static _Atomic int32_t actual_channels;
static _Atomic int32_t frames_per_burst;
static _Atomic int32_t stream_buffer_frames;
static _Atomic int32_t stream_capacity_frames;

static int64_t monotonic_ns(void)
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (int64_t)ts.tv_sec * 1000000000LL + ts.tv_nsec;
}

static void reset_stats(void)
{
    atomic_store_explicit(&ring_write, 0, memory_order_relaxed);
    atomic_store_explicit(&ring_read, 0, memory_order_relaxed);
    atomic_store_explicit(&flush_requested, false, memory_order_relaxed);
    atomic_store_explicit(&stream_error, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_callbacks, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_callback_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_underrun_callbacks, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_underrun_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_overrun_blocks, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_dropped_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_offered_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_nonzero_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_source_nonzero_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_consumed_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_consumed_nonzero_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_source_peak, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_ring_peak, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_consumed_peak, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_muted_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&last_source_callback, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_last_callback_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&stat_min_callback_frames, INT32_MAX, memory_order_relaxed);
    atomic_store_explicit(&stat_max_callback_frames, 0, memory_order_relaxed);
    atomic_store_explicit(&last_stats_log_ns, 0, memory_order_relaxed);
}

static inline int32_t stereo_peak(int32_t left, int32_t right)
{
    int32_t l = left < 0 ? -left : left;
    int32_t r = right < 0 ? -right : right;
    return l > r ? l : r;
}

static aaudio_data_callback_result_t audio_data_callback(
    AAudioStream *stream, void *user_data, void *audio_data, int32_t num_frames)
{
    M6StereoFrame *out = audio_data;
    uint64_t read_at, write_at, available;
    int32_t count;
    bool enabled;
    (void)stream;
    (void)user_data;

    if (num_frames <= 0) {
        return AAUDIO_CALLBACK_RESULT_CONTINUE;
    }

    memset(audio_data, 0, (size_t)num_frames * sizeof(*out));
    atomic_fetch_add_explicit(&stat_callbacks, 1, memory_order_relaxed);
    atomic_fetch_add_explicit(&stat_callback_frames, (uint64_t)num_frames,
                              memory_order_relaxed);
    atomic_store_explicit(&stat_last_callback_frames, num_frames, memory_order_relaxed);
    int old_min = atomic_load_explicit(&stat_min_callback_frames, memory_order_relaxed);
    while (num_frames < old_min &&
           !atomic_compare_exchange_weak_explicit(&stat_min_callback_frames,
               &old_min, num_frames, memory_order_relaxed, memory_order_relaxed)) {
    }
    int old_max = atomic_load_explicit(&stat_max_callback_frames, memory_order_relaxed);
    while (num_frames > old_max &&
           !atomic_compare_exchange_weak_explicit(&stat_max_callback_frames,
               &old_max, num_frames, memory_order_relaxed, memory_order_relaxed)) {
    }

    enabled = atomic_load_explicit(&focus_granted, memory_order_acquire) &&
              atomic_load_explicit(&foreground, memory_order_acquire) &&
              atomic_load_explicit(&stream_error, memory_order_relaxed) == 0;
    if (!enabled) {
        write_at = atomic_load_explicit(&ring_write, memory_order_acquire);
        atomic_store_explicit(&ring_read, write_at, memory_order_release);
        atomic_fetch_add_explicit(&stat_muted_frames, (uint64_t)num_frames,
                                  memory_order_relaxed);
        return AAUDIO_CALLBACK_RESULT_CONTINUE;
    }

    if (atomic_exchange_explicit(&flush_requested, false, memory_order_acq_rel)) {
        write_at = atomic_load_explicit(&ring_write, memory_order_acquire);
        atomic_store_explicit(&ring_read, write_at, memory_order_release);
    }

    read_at = atomic_load_explicit(&ring_read, memory_order_relaxed);
    write_at = atomic_load_explicit(&ring_write, memory_order_acquire);
    available = write_at - read_at;
    count = (int32_t)(available < (uint64_t)num_frames ? available : (uint64_t)num_frames);
    uint64_t nonzero = 0;
    int32_t peak = atomic_load_explicit(&stat_consumed_peak, memory_order_relaxed);
    for (int32_t i = 0; i < count; i++) {
        out[i] = ring[(read_at + (uint64_t)i) & (M6_RING_FRAMES - 1)];
        int32_t magnitude = stereo_peak(out[i].channel[0], out[i].channel[1]);
        nonzero += magnitude != 0;
        if (magnitude > peak) peak = magnitude;
    }
    atomic_fetch_add_explicit(&stat_consumed_frames, (uint64_t)count, memory_order_relaxed);
    atomic_fetch_add_explicit(&stat_consumed_nonzero_frames, nonzero, memory_order_relaxed);
    atomic_store_explicit(&stat_consumed_peak, peak, memory_order_relaxed);
    atomic_store_explicit(&ring_read, read_at + (uint64_t)count, memory_order_release);

    uint64_t callbacks = atomic_load_explicit(&stat_callbacks, memory_order_relaxed);
    uint64_t last_source = atomic_load_explicit(&last_source_callback, memory_order_acquire);
    if (count < num_frames &&
        atomic_load_explicit(&apu_attached, memory_order_acquire) &&
        last_source != 0 && callbacks - last_source <= 32) {
        atomic_fetch_add_explicit(&stat_underrun_callbacks, 1, memory_order_relaxed);
        atomic_fetch_add_explicit(&stat_underrun_frames,
                                  (uint64_t)(num_frames - count), memory_order_relaxed);
    }
    return AAUDIO_CALLBACK_RESULT_CONTINUE;
}

static void audio_error_callback(AAudioStream *stream, void *user_data,
                                 aaudio_result_t error)
{
    int expected = 0;
    (void)stream;
    (void)user_data;
    if (atomic_compare_exchange_strong_explicit(&stream_error, &expected, error,
            memory_order_release, memory_order_relaxed)) {
        __android_log_print(ANDROID_LOG_ERROR, M6_TAG,
                            "AAUDIO_STREAM_ERROR result=%d", error);
    }
}

int boxdroid_m6_audio_initialize(void)
{
    AAudioStreamBuilder *builder = NULL;
    aaudio_result_t result;

    if (audio_stream && stream_started && !atomic_load(&stream_error)) {
        return 0;
    }
    if (audio_stream) {
        boxdroid_m6_audio_shutdown();
    }
    reset_stats();

    result = AAudio_createStreamBuilder(&builder);
    if (result != AAUDIO_OK) {
        atomic_store(&stream_error, result);
        __android_log_print(ANDROID_LOG_ERROR, M6_TAG,
                            "AAUDIO_BUILDER_FAIL result=%d", result);
        return result;
    }
    AAudioStreamBuilder_setDirection(builder, AAUDIO_DIRECTION_OUTPUT);
    AAudioStreamBuilder_setSharingMode(builder, AAUDIO_SHARING_MODE_SHARED);
    AAudioStreamBuilder_setPerformanceMode(builder, AAUDIO_PERFORMANCE_MODE_LOW_LATENCY);
    AAudioStreamBuilder_setUsage(builder, AAUDIO_USAGE_GAME);
    AAudioStreamBuilder_setContentType(builder, AAUDIO_CONTENT_TYPE_MUSIC);
    AAudioStreamBuilder_setSampleRate(builder, M6_RATE);
    AAudioStreamBuilder_setChannelCount(builder, M6_CHANNELS);
    AAudioStreamBuilder_setFormat(builder, AAUDIO_FORMAT_PCM_I16);
    AAudioStreamBuilder_setDataCallback(builder, audio_data_callback, NULL);
    AAudioStreamBuilder_setErrorCallback(builder, audio_error_callback, NULL);

    result = AAudioStreamBuilder_openStream(builder, &audio_stream);
    AAudioStreamBuilder_delete(builder);
    if (result != AAUDIO_OK || !audio_stream) {
        audio_stream = NULL;
        atomic_store(&stream_error, result != AAUDIO_OK ? result : AAUDIO_ERROR_INTERNAL);
        __android_log_print(ANDROID_LOG_ERROR, M6_TAG,
                            "AAUDIO_OPEN_FAIL result=%d", result);
        return result != AAUDIO_OK ? result : AAUDIO_ERROR_INTERNAL;
    }

    actual_rate = AAudioStream_getSampleRate(audio_stream);
    actual_channels = AAudioStream_getChannelCount(audio_stream);
    frames_per_burst = AAudioStream_getFramesPerBurst(audio_stream);
    stream_capacity_frames = AAudioStream_getBufferCapacityInFrames(audio_stream);
    if (AAudioStream_getFormat(audio_stream) != AAUDIO_FORMAT_PCM_I16 ||
        actual_channels != M6_CHANNELS || actual_rate != M6_RATE ||
        frames_per_burst <= 0 || stream_capacity_frames <= 0) {
        atomic_store(&stream_error, AAUDIO_ERROR_UNIMPLEMENTED);
        __android_log_print(ANDROID_LOG_ERROR, M6_TAG,
                            "AAUDIO_UNSUPPORTED_FORMAT rate=%d channels=%d format=%d burst=%d capacity=%d",
                            actual_rate, actual_channels, AAudioStream_getFormat(audio_stream),
                            frames_per_burst, stream_capacity_frames);
        AAudioStream_close(audio_stream);
        audio_stream = NULL;
        return AAUDIO_ERROR_UNIMPLEMENTED;
    }

    int32_t requested_buffer = frames_per_burst * 2;
    if (requested_buffer > stream_capacity_frames) {
        requested_buffer = stream_capacity_frames;
    }
    result = AAudioStream_setBufferSizeInFrames(audio_stream, requested_buffer);
    stream_buffer_frames = result >= 0 ? result : AAudioStream_getBufferSizeInFrames(audio_stream);
    result = AAudioStream_requestStart(audio_stream);
    if (result != AAUDIO_OK) {
        atomic_store(&stream_error, result);
        __android_log_print(ANDROID_LOG_ERROR, M6_TAG,
                            "AAUDIO_START_FAIL result=%d", result);
        AAudioStream_close(audio_stream);
        audio_stream = NULL;
        stream_buffer_frames = 0;
        return result;
    }
    atomic_store_explicit(&stream_initialized, true, memory_order_release);
    atomic_store_explicit(&stream_started, true, memory_order_release);
    __android_log_print(ANDROID_LOG_INFO, M6_TAG,
        "AAUDIO_READY backend=AAudio rate=%d channels=%d format=S16LE burst_frames=%d buffer_frames=%d capacity_frames=%d ring_frames=%d ring_max_ms=%.1f",
        actual_rate, actual_channels, frames_per_burst, stream_buffer_frames,
        stream_capacity_frames, M6_RING_FRAMES,
        1000.0 * M6_RING_FRAMES / actual_rate);
    return 0;
}

void boxdroid_m6_audio_shutdown(void)
{
    AAudioStream *closing = audio_stream;
    audio_stream = NULL;
    if (closing) {
        aaudio_result_t stop_result = AAudioStream_requestStop(closing);
        if (stop_result != AAUDIO_OK && stop_result != AAUDIO_ERROR_INVALID_STATE) {
            __android_log_print(ANDROID_LOG_WARN, M6_TAG,
                                "AAUDIO_STOP result=%d", stop_result);
        }
        AAudioStream_close(closing);
    }
    atomic_store_explicit(&stream_started, false, memory_order_release);
    atomic_store_explicit(&stream_initialized, false, memory_order_release);
    atomic_store(&stream_buffer_frames, 0);
    atomic_store(&actual_rate, 0);
    atomic_store(&actual_channels, 0);
    atomic_store(&frames_per_burst, 0);
    atomic_store(&stream_capacity_frames, 0);
    atomic_store_explicit(&ring_read,
        atomic_load_explicit(&ring_write, memory_order_acquire), memory_order_release);
    __android_log_print(ANDROID_LOG_INFO, M6_TAG, "AAUDIO_CLOSED callbacks=%llu underruns=%llu underrun_frames=%llu overruns=%llu dropped_frames=%llu offered_frames=%llu nonzero_frames=%llu",
        (unsigned long long)atomic_load(&stat_callbacks),
        (unsigned long long)atomic_load(&stat_underrun_callbacks),
        (unsigned long long)atomic_load(&stat_underrun_frames),
        (unsigned long long)atomic_load(&stat_overrun_blocks),
        (unsigned long long)atomic_load(&stat_dropped_frames),
        (unsigned long long)atomic_load(&stat_offered_frames),
        (unsigned long long)atomic_load(&stat_nonzero_frames));
    __android_log_print(ANDROID_LOG_INFO, M6_TAG,
        "AAUDIO_PCM source_nonzero_frames=%llu source_peak=%d ring_nonzero_frames=%llu ring_peak=%d consumed_frames=%llu consumed_nonzero_frames=%llu consumed_peak=%d",
        (unsigned long long)atomic_load(&stat_source_nonzero_frames),
        atomic_load(&stat_source_peak),
        (unsigned long long)atomic_load(&stat_nonzero_frames),
        atomic_load(&stat_ring_peak),
        (unsigned long long)atomic_load(&stat_consumed_frames),
        (unsigned long long)atomic_load(&stat_consumed_nonzero_frames),
        atomic_load(&stat_consumed_peak));
}

void boxdroid_m6_audio_set_focus(bool focused)
{
    bool previous = atomic_exchange_explicit(&focus_granted, focused, memory_order_acq_rel);
    if (previous != focused) {
        atomic_store_explicit(&flush_requested, true, memory_order_release);
        __android_log_print(ANDROID_LOG_INFO, M6_TAG, "AUDIO_FOCUS_STATE focused=%d", focused);
    }
}

void boxdroid_m6_audio_set_foreground(bool is_foreground)
{
    bool previous = atomic_exchange_explicit(&foreground, is_foreground, memory_order_acq_rel);
    if (previous != is_foreground) {
        atomic_store_explicit(&flush_requested, true, memory_order_release);
        __android_log_print(ANDROID_LOG_INFO, M6_TAG, "AUDIO_FOREGROUND_STATE foreground=%d", is_foreground);
    }
}

void boxdroid_m6_audio_apu_attach(void)
{
    atomic_store_explicit(&apu_attached, true, memory_order_release);
    __android_log_write(ANDROID_LOG_INFO, M6_TAG, "APU_MONITOR_ATTACHED format=S16LE rate=48000 channels=2 chunk_frames=256");
}

void boxdroid_m6_audio_apu_detach(void)
{
    atomic_store_explicit(&apu_attached, false, memory_order_release);
    __android_log_write(ANDROID_LOG_INFO, M6_TAG, "APU_MONITOR_DETACHED");
}

void boxdroid_m6_audio_push(const int16_t *samples, uint32_t frames, float gain)
{
    uint64_t write_at, read_at, queued, free_frames;
    uint32_t accepted, nonzero = 0;

    uint64_t previous = atomic_fetch_add_explicit(&stat_offered_frames, frames,
                                                  memory_order_relaxed);
    if (previous == 0) {
        __android_log_print(ANDROID_LOG_INFO, M6_TAG,
                            "APU_PCM_SOURCE stage=GP_OR_EP_monitor gain=%g", (double)gain);
    }
    uint64_t source_nonzero = 0;
    int32_t source_peak = atomic_load_explicit(&stat_source_peak, memory_order_relaxed);
    for (uint32_t i = 0; i < frames; i++) {
        int32_t magnitude = stereo_peak(samples[i * 2], samples[i * 2 + 1]);
        source_nonzero += magnitude != 0;
        if (magnitude > source_peak) source_peak = magnitude;
    }
    atomic_fetch_add_explicit(&stat_source_nonzero_frames, source_nonzero, memory_order_relaxed);
    atomic_store_explicit(&stat_source_peak, source_peak, memory_order_relaxed);
    atomic_store_explicit(&last_source_callback,
        atomic_load_explicit(&stat_callbacks, memory_order_relaxed),
        memory_order_release);
    if (!atomic_load_explicit(&focus_granted, memory_order_acquire) ||
        !atomic_load_explicit(&foreground, memory_order_acquire) ||
        !atomic_load_explicit(&stream_started, memory_order_acquire) ||
        atomic_load_explicit(&stream_error, memory_order_relaxed) != 0) {
        atomic_fetch_add_explicit(&stat_dropped_frames, frames, memory_order_relaxed);
        return;
    }

    write_at = atomic_load_explicit(&ring_write, memory_order_relaxed);
    read_at = atomic_load_explicit(&ring_read, memory_order_acquire);
    queued = write_at - read_at;
    free_frames = queued >= M6_RING_FRAMES ? 0 : M6_RING_FRAMES - queued;
    accepted = (uint32_t)(free_frames < frames ? free_frames : frames);
    if (accepted < frames) {
        atomic_fetch_add_explicit(&stat_overrun_blocks, 1, memory_order_relaxed);
        atomic_fetch_add_explicit(&stat_dropped_frames, frames - accepted,
                                  memory_order_relaxed);
    }

    int32_t ring_peak = atomic_load_explicit(&stat_ring_peak, memory_order_relaxed);
    for (uint32_t i = 0; i < accepted; i++) {
        int32_t left = samples[i * 2];
        int32_t right = samples[i * 2 + 1];
        if (gain != 1.0f) {
            left = (int32_t)lrintf(left * gain);
            right = (int32_t)lrintf(right * gain);
            left = left < INT16_MIN ? INT16_MIN : left > INT16_MAX ? INT16_MAX : left;
            right = right < INT16_MIN ? INT16_MIN : right > INT16_MAX ? INT16_MAX : right;
        }
        ring[(write_at + i) & (M6_RING_FRAMES - 1)].channel[0] = (int16_t)left;
        ring[(write_at + i) & (M6_RING_FRAMES - 1)].channel[1] = (int16_t)right;
        nonzero += (left != 0 || right != 0);
        int32_t magnitude = stereo_peak(left, right);
        if (magnitude > ring_peak) ring_peak = magnitude;
    }
    atomic_store_explicit(&stat_ring_peak, ring_peak, memory_order_relaxed);
    atomic_fetch_add_explicit(&stat_nonzero_frames, nonzero, memory_order_relaxed);
    atomic_store_explicit(&ring_write, write_at + accepted, memory_order_release);
}

void boxdroid_m6_audio_snapshot(BoxDroidM6AudioStats *stats)
{
    uint64_t write_at = atomic_load_explicit(&ring_write, memory_order_acquire);
    uint64_t read_at = atomic_load_explicit(&ring_read, memory_order_acquire);
    memset(stats, 0, sizeof(*stats));
    stats->sample_rate = actual_rate;
    stats->channels = actual_channels;
    stats->frames_per_burst = frames_per_burst;
    stats->stream_buffer_frames = stream_buffer_frames;
    stats->stream_capacity_frames = stream_capacity_frames;
    stats->last_callback_frames = atomic_load_explicit(&stat_last_callback_frames, memory_order_relaxed);
    stats->min_callback_frames = atomic_load_explicit(&stat_min_callback_frames, memory_order_relaxed);
    if (stats->min_callback_frames == INT32_MAX) stats->min_callback_frames = 0;
    stats->max_callback_frames = atomic_load_explicit(&stat_max_callback_frames, memory_order_relaxed);
    stats->error_code = atomic_load_explicit(&stream_error, memory_order_relaxed);
    stats->callbacks = atomic_load_explicit(&stat_callbacks, memory_order_relaxed);
    stats->callback_frames = atomic_load_explicit(&stat_callback_frames, memory_order_relaxed);
    stats->underrun_callbacks = atomic_load_explicit(&stat_underrun_callbacks, memory_order_relaxed);
    stats->underrun_frames = atomic_load_explicit(&stat_underrun_frames, memory_order_relaxed);
    stats->overrun_blocks = atomic_load_explicit(&stat_overrun_blocks, memory_order_relaxed);
    stats->dropped_frames = atomic_load_explicit(&stat_dropped_frames, memory_order_relaxed);
    stats->offered_frames = atomic_load_explicit(&stat_offered_frames, memory_order_relaxed);
    stats->nonzero_frames = atomic_load_explicit(&stat_nonzero_frames, memory_order_relaxed);
    stats->source_nonzero_frames = atomic_load_explicit(&stat_source_nonzero_frames, memory_order_relaxed);
    stats->consumed_frames = atomic_load_explicit(&stat_consumed_frames, memory_order_relaxed);
    stats->consumed_nonzero_frames = atomic_load_explicit(&stat_consumed_nonzero_frames, memory_order_relaxed);
    stats->source_peak = atomic_load_explicit(&stat_source_peak, memory_order_relaxed);
    stats->ring_peak = atomic_load_explicit(&stat_ring_peak, memory_order_relaxed);
    stats->consumed_peak = atomic_load_explicit(&stat_consumed_peak, memory_order_relaxed);
    stats->muted_frames = atomic_load_explicit(&stat_muted_frames, memory_order_relaxed);
    stats->queued_frames = write_at >= read_at ? write_at - read_at : 0;
    stats->initialized = atomic_load_explicit(&stream_initialized, memory_order_acquire);
    stats->started = atomic_load_explicit(&stream_started, memory_order_acquire);
    stats->focus_granted = atomic_load_explicit(&focus_granted, memory_order_relaxed);
    stats->foreground = atomic_load_explicit(&foreground, memory_order_relaxed);
    stats->apu_attached = atomic_load_explicit(&apu_attached, memory_order_relaxed);
}

void boxdroid_m6_audio_format_metrics(char *buffer, uint32_t buffer_size)
{
    BoxDroidM6AudioStats s;
    const char *state;
    int64_t now = monotonic_ns();
    int64_t previous;
    boxdroid_m6_audio_snapshot(&s);
    if (s.error_code) state = "ERROR";
    else if (!s.foreground) state = "PAUSED";
    else if (!s.focus_granted) state = "FOCUS LOST";
    else if (s.initialized && s.started) state = "RUNNING";
    else state = "STARTING";
    uint64_t queued_ms = s.sample_rate > 0 ?
        (s.queued_frames + (uint64_t)s.stream_buffer_frames) * 1000 / s.sample_rate : 0;
    snprintf(buffer, buffer_size, "AUDIO: %s\nUNDERRUNS: %llu  DROPPED: %llu\nQUEUED: %llums  %dkHz/%dch",
        state,
        (unsigned long long)s.underrun_callbacks,
        (unsigned long long)s.dropped_frames,
        (unsigned long long)queued_ms,
        s.sample_rate / 1000, s.channels);
    previous = atomic_load_explicit(&last_stats_log_ns, memory_order_relaxed);
    if (now - previous >= 10000000000LL &&
        atomic_compare_exchange_strong_explicit(&last_stats_log_ns, &previous, now,
            memory_order_relaxed, memory_order_relaxed)) {
        __android_log_print(ANDROID_LOG_INFO, M6_TAG,
            "AUDIO_STATS backend=AAudio state=%s rate=%d channels=%d format=S16LE burst=%d callback_frames=%d..%d buffer_frames=%d capacity_frames=%d queued_frames=%llu queued_estimate_ms=%llu callbacks=%llu callback_frames_total=%llu underrun_callbacks=%llu underrun_frames=%llu overrun_blocks=%llu dropped_frames=%llu offered_frames=%llu nonzero_frames=%llu muted_frames=%llu focus=%d foreground=%d apu_attached=%d error=%d source_nonzero_frames=%llu source_peak=%d ring_peak=%d consumed_frames=%llu consumed_nonzero_frames=%llu consumed_peak=%d",
            state, s.sample_rate, s.channels, s.frames_per_burst,
            s.min_callback_frames, s.max_callback_frames,
            s.stream_buffer_frames, s.stream_capacity_frames,
            (unsigned long long)s.queued_frames, (unsigned long long)queued_ms,
            (unsigned long long)s.callbacks, (unsigned long long)s.callback_frames,
            (unsigned long long)s.underrun_callbacks, (unsigned long long)s.underrun_frames,
            (unsigned long long)s.overrun_blocks, (unsigned long long)s.dropped_frames,
            (unsigned long long)s.offered_frames, (unsigned long long)s.nonzero_frames,
            (unsigned long long)s.muted_frames, s.focus_granted, s.foreground,
            s.apu_attached, s.error_code,
            (unsigned long long)s.source_nonzero_frames, s.source_peak, s.ring_peak,
            (unsigned long long)s.consumed_frames,
            (unsigned long long)s.consumed_nonzero_frames, s.consumed_peak);
    }
}

JNIEXPORT jint JNICALL
Java_org_boxdroid_M6Activity_nativeM6AudioInitialize(JNIEnv *env, jobject self)
{
    (void)env;
    (void)self;
    return boxdroid_m6_audio_initialize();
}

JNIEXPORT void JNICALL
Java_org_boxdroid_M6Activity_nativeM6AudioSetFocus(JNIEnv *env, jobject self,
                                                       jboolean focused)
{
    (void)env;
    (void)self;
    boxdroid_m6_audio_set_focus(focused == JNI_TRUE);
}

JNIEXPORT void JNICALL
Java_org_boxdroid_M6Activity_nativeM6AudioSetForeground(JNIEnv *env, jobject self,
                                                            jboolean is_foreground)
{
    (void)env;
    (void)self;
    boxdroid_m6_audio_set_foreground(is_foreground == JNI_TRUE);
}

JNIEXPORT jstring JNICALL
Java_org_boxdroid_M6Activity_nativeM6AudioOverlayMetrics(JNIEnv *env, jobject self)
{
    char metrics[192];
    (void)self;
    boxdroid_m6_audio_format_metrics(metrics, sizeof(metrics));
    return (*env)->NewStringUTF(env, metrics);
}

JNIEXPORT void JNICALL
Java_org_boxdroid_M6Activity_nativeM6AudioShutdown(JNIEnv *env, jobject self)
{
    (void)env;
    (void)self;
    boxdroid_m6_audio_shutdown();
}
