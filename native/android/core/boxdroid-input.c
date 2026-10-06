#define _POSIX_C_SOURCE 200809L

#include "boxdroid-input.h"

#include <android/log.h>
#include <jni.h>
#include <math.h>
#include <pthread.h>
#include <string.h>

#define INPUT_TAG "BoxDroidM62Input"

typedef struct BoxDroidInputStateSlots {
    BoxDroidInputState slots[BOXDROID_INPUT_SLOTS];
    int primary_slot;
} BoxDroidInputStateSlots;

static BoxDroidInputStateSlots input_state = { .primary_slot = -1 };
static pthread_mutex_t input_state_lock = PTHREAD_MUTEX_INITIALIZER;

static float clamp_unit(float value, bool bipolar)
{
    if (!isfinite(value)) {
        return 0.0f;
    }
    if (bipolar) {
        return value < -1.0f ? -1.0f : value > 1.0f ? 1.0f : value;
    }
    return value < 0.0f ? 0.0f : value > 1.0f ? 1.0f : value;
}

void boxdroid_input_set_state(unsigned int slot,
                                  const BoxDroidInputState *state)
{
    if (slot >= BOXDROID_INPUT_SLOTS || state == NULL) {
        return;
    }
    BoxDroidInputState next = *state;
    next.left_x = clamp_unit(next.left_x, true);
    next.left_y = clamp_unit(next.left_y, true);
    next.right_x = clamp_unit(next.right_x, true);
    next.right_y = clamp_unit(next.right_y, true);
    next.left_trigger = clamp_unit(next.left_trigger, false);
    next.right_trigger = clamp_unit(next.right_trigger, false);
    if (!next.connected) {
        next.device_id = -1;
        next.buttons = 0;
        next.left_x = next.left_y = next.right_x = next.right_y = 0.0f;
        next.left_trigger = next.right_trigger = 0.0f;
    }
    pthread_mutex_lock(&input_state_lock);
    input_state.slots[slot] = next;
    if (next.connected && input_state.primary_slot < 0) {
        input_state.primary_slot = (int)slot;
    } else if (!next.connected && input_state.primary_slot == (int)slot) {
        input_state.primary_slot = -1;
        for (unsigned int i = 0; i < BOXDROID_INPUT_SLOTS; i++) {
            if (input_state.slots[i].connected) {
                input_state.primary_slot = (int)i;
                break;
            }
        }
    }
    pthread_mutex_unlock(&input_state_lock);
}

void boxdroid_input_select_primary(unsigned int slot)
{
    if (slot >= BOXDROID_INPUT_SLOTS) {
        return;
    }
    pthread_mutex_lock(&input_state_lock);
    if (input_state.slots[slot].connected) {
        input_state.primary_slot = (int)slot;
    }
    pthread_mutex_unlock(&input_state_lock);
}

void boxdroid_input_clear_all(void)
{
    const BoxDroidInputState neutral = { .device_id = -1 };
    for (unsigned int slot = 0; slot < BOXDROID_INPUT_SLOTS; slot++) {
        boxdroid_input_set_state(slot, &neutral);
    }
    pthread_mutex_lock(&input_state_lock);
    input_state.primary_slot = -1;
    pthread_mutex_unlock(&input_state_lock);
}

bool boxdroid_input_snapshot_primary(BoxDroidInputState *state)
{
    BoxDroidInputState candidate;
    if (state == NULL) {
        return false;
    }
    /* USB XID polling occurs under the QEMU BQL. Never wait there for Android
     * event delivery; if a writer owns the tiny snapshot lock, keep this poll's
     * previous ControllerState and retry at the next USB input report. */
    if (pthread_mutex_trylock(&input_state_lock) != 0) {
        return false;
    }
    if (input_state.primary_slot >= 0 &&
        input_state.slots[input_state.primary_slot].connected) {
        *state = input_state.slots[input_state.primary_slot];
        pthread_mutex_unlock(&input_state_lock);
        return true;
    }
    for (unsigned int slot = 0; slot < BOXDROID_INPUT_SLOTS; slot++) {
        candidate = input_state.slots[slot];
        if (candidate.connected) {
            input_state.primary_slot = (int)slot;
            *state = candidate;
            pthread_mutex_unlock(&input_state_lock);
            return true;
        }
    }
    pthread_mutex_unlock(&input_state_lock);
    memset(state, 0, sizeof(*state));
    state->device_id = -1;
    return true;
}

JNIEXPORT void JNICALL
Java_org_boxdroid_GamepadInput_nativeSetState(JNIEnv *env, jclass type,
        jint slot, jint device_id, jboolean connected, jint buttons,
        jfloat left_x, jfloat left_y, jfloat right_x, jfloat right_y,
        jfloat left_trigger, jfloat right_trigger)
{
    BoxDroidInputState state = {
        .device_id = device_id,
        .buttons = (uint32_t)buttons,
        .left_x = left_x,
        .left_y = left_y,
        .right_x = right_x,
        .right_y = right_y,
        .left_trigger = left_trigger,
        .right_trigger = right_trigger,
        .connected = connected == JNI_TRUE,
    };
    (void)env;
    (void)type;
    if (slot < 0 || slot >= BOXDROID_INPUT_SLOTS) {
        return;
    }
    boxdroid_input_set_state((unsigned int)slot, &state);
}

JNIEXPORT void JNICALL
Java_org_boxdroid_GamepadInput_nativeClearAll(JNIEnv *env, jclass type)
{
    (void)env;
    (void)type;
    boxdroid_input_clear_all();
    __android_log_print(ANDROID_LOG_INFO, INPUT_TAG, "INPUT_ALL_NEUTRAL reason=lifecycle");
}

JNIEXPORT void JNICALL
Java_org_boxdroid_GamepadInput_nativeSelectPrimary(JNIEnv *env, jclass type,
                                                    jint slot)
{
    (void)env;
    (void)type;
    if (slot >= 0 && slot < BOXDROID_INPUT_SLOTS) {
        boxdroid_input_select_primary((unsigned int)slot);
    }
}
