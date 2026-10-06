#ifndef BOXDROID_INPUT_H
#define BOXDROID_INPUT_H

#include <stdbool.h>
#include <stdint.h>

#define BOXDROID_INPUT_SLOTS 4

/* Button bits follow Android's canonical BoxDroid mapping. */
enum BoxDroidM62Button {
    BOXDROID_M62_A       = 1u << 0,
    BOXDROID_M62_B       = 1u << 1,
    BOXDROID_M62_X       = 1u << 2,
    BOXDROID_M62_Y       = 1u << 3,
    BOXDROID_M62_DPAD_L  = 1u << 4,
    BOXDROID_M62_DPAD_U  = 1u << 5,
    BOXDROID_M62_DPAD_R  = 1u << 6,
    BOXDROID_M62_DPAD_D  = 1u << 7,
    BOXDROID_M62_BACK    = 1u << 8,
    BOXDROID_M62_START   = 1u << 9,
    BOXDROID_M62_WHITE   = 1u << 10,
    BOXDROID_M62_BLACK   = 1u << 11,
    BOXDROID_M62_L3      = 1u << 12,
    BOXDROID_M62_R3      = 1u << 13,
};

typedef struct BoxDroidInputState {
    int32_t device_id;
    uint32_t buttons;
    float left_x;
    float left_y;  /* Positive is up, matching the Xbox guest convention. */
    float right_x;
    float right_y; /* Positive is up, matching the Xbox guest convention. */
    float left_trigger;
    float right_trigger;
    bool connected;
} BoxDroidInputState;

void boxdroid_input_set_state(unsigned int slot,
                                  const BoxDroidInputState *state);
void boxdroid_input_select_primary(unsigned int slot);
void boxdroid_input_clear_all(void);
bool boxdroid_input_snapshot_primary(BoxDroidInputState *state);

#endif
