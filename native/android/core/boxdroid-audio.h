#ifndef BOXDROID_M6_AUDIO_H
#define BOXDROID_M6_AUDIO_H

#include <stdbool.h>
#include <stdint.h>

typedef struct BoxDroidM6AudioStats {
    int32_t sample_rate;
    int32_t channels;
    int32_t frames_per_burst;
    int32_t stream_buffer_frames;
    int32_t stream_capacity_frames;
    int32_t last_callback_frames;
    int32_t min_callback_frames;
    int32_t max_callback_frames;
    int32_t error_code;
    uint64_t callbacks;
    uint64_t callback_frames;
    uint64_t underrun_callbacks;
    uint64_t underrun_frames;
    uint64_t overrun_blocks;
    uint64_t dropped_frames;
    uint64_t offered_frames;
    uint64_t nonzero_frames;
    uint64_t source_nonzero_frames;
    uint64_t consumed_frames;
    uint64_t consumed_nonzero_frames;
    int32_t source_peak;
    int32_t ring_peak;
    int32_t consumed_peak;
    uint64_t queued_frames;
    uint64_t muted_frames;
    bool initialized;
    bool started;
    bool focus_granted;
    bool foreground;
    bool apu_attached;
} BoxDroidM6AudioStats;

int boxdroid_m6_audio_initialize(void);
void boxdroid_m6_audio_shutdown(void);
void boxdroid_m6_audio_set_focus(bool focused);
void boxdroid_m6_audio_set_foreground(bool foreground);
void boxdroid_m6_audio_apu_attach(void);
void boxdroid_m6_audio_apu_detach(void);
void boxdroid_m6_audio_push(const int16_t *samples, uint32_t frames, float gain);
void boxdroid_m6_audio_snapshot(BoxDroidM6AudioStats *stats);
void boxdroid_m6_audio_format_metrics(char *buffer, uint32_t buffer_size);

#endif
