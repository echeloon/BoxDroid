/* Tests the production patch's handoff primitive using pthread equivalents
 * of QemuMutex/Cond. No copy of the protocol lives in this test. */
#include <assert.h>
#include <pthread.h>
#include <sched.h>
#include <stdatomic.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifdef VOICE_REAL_RESAMPLER
#include <samplerate.h>
static SRC_STATE *resamplers[16];
#endif

typedef pthread_mutex_t QemuMutex;
typedef pthread_cond_t QemuCond;
#define qemu_mutex_init(m) assert(pthread_mutex_init(m, NULL) == 0)
#define qemu_mutex_destroy(m) assert(pthread_mutex_destroy(m) == 0)
#define qemu_mutex_lock(m) assert(pthread_mutex_lock(m) == 0)
#define qemu_mutex_unlock(m) assert(pthread_mutex_unlock(m) == 0)
#define qemu_cond_init(c) assert(pthread_cond_init(c, NULL) == 0)
#define qemu_cond_destroy(c) assert(pthread_cond_destroy(c) == 0)
#define qemu_cond_wait(c,m) assert(pthread_cond_wait(c,m) == 0)
#define qemu_cond_broadcast(c) assert(pthread_cond_broadcast(c) == 0)
#define qemu_cond_signal(c) assert(pthread_cond_signal(c) == 0)
#define qatomic_read(p) __atomic_load_n(p, __ATOMIC_SEQ_CST)
#define qatomic_or(p,v) __atomic_fetch_or(p,v,__ATOMIC_SEQ_CST)
#define qatomic_and(p,v) __atomic_fetch_and(p,v,__ATOMIC_SEQ_CST)
#include "voice-ownership.h"

static VoiceOwnership owner;
static uint64_t guest[4];
static atomic_bool returned;
static atomic_uint handoffs;
static int state[16][3];
static QemuMutex frame;

static void *dispatch_wait(void *unused)
{
    uint64_t mask[4] = { 1U << 5, 0, 0, 0 };
    qemu_mutex_lock(&frame);
    assert(!voice_owner_wait(&owner, mask, &frame));
    qemu_mutex_unlock(&frame);
    return NULL;
}

static void pause_wait(void)
{
    voice_owner_guest(&owner, 5, true);
    qemu_mutex_init(&frame);
    pthread_t dispatcher;
    assert(!pthread_create(&dispatcher, NULL, dispatch_wait, NULL));
    /* Cancellation before or during the wait must work. Holding the frame
     * mutex matches VM pause; an APU waiter must release it. */
    qemu_mutex_lock(&frame);
    voice_owner_cancel(&owner, true);
    qemu_mutex_unlock(&frame);
    assert(!pthread_join(dispatcher, NULL));
    voice_owner_guest(&owner, 5, false);
    voice_owner_cancel(&owner, false);
    qemu_mutex_destroy(&frame);
}

static uint64_t observed_generation;
static enum VoiceOwnerWait control_result;
static void *control_wait(void *unused)
{
    uint64_t mask[4] = { 1U << 5, 0, 0, 0 };
    qemu_mutex_lock(&frame);
    control_result = voice_owner_wait_event(&owner, mask, &frame, true, observed_generation);
    qemu_mutex_unlock(&frame);
    return NULL;
}
static void stopped_control(void)
{
    /* An OFF event must wake/retry without first requiring guest UNLOCK.
     * The dispatcher then admits an empty live set and can deliver IRQs. */
    voice_owner_guest(&owner, 5, true);
    observed_generation = voice_owner_generation(&owner);
    qemu_mutex_init(&frame);
    pthread_t dispatcher;
    assert(!pthread_create(&dispatcher, NULL, control_wait, NULL));
    qemu_mutex_lock(&frame);
    voice_owner_control_changed(&owner);
    qemu_mutex_unlock(&frame);
    assert(!pthread_join(dispatcher, NULL));
    assert(control_result == VOICE_OWNER_RETRY);
    assert(qatomic_read(&guest[0]) & (1U << 5));
    assert(!owner.active[0]);
    uint64_t empty[4] = {0};
    qemu_mutex_lock(&frame);
    assert(voice_owner_wait_event(&owner, empty, &frame, true,
                                 voice_owner_generation(&owner)) == VOICE_OWNER_ADMITTED);
    qemu_mutex_unlock(&frame);
    voice_owner_guest(&owner, 5, false);
    qemu_mutex_destroy(&frame);
}

static void *request(void *unused)
{
    voice_owner_guest(&owner, 3, true);
    atomic_store(&returned, true);
    voice_owner_guest(&owner, 3, false);
    return NULL;
}

static void targeted(void)
{
    uint64_t mask[4] = { (1U << 3) | (1U << 7), 0, 0, 0 };
    qemu_mutex_lock(&owner.lock);
    assert(voice_owner_admit(&owner, mask));
    qemu_mutex_unlock(&owner.lock);
    /* Redundant UNLOCK must neither assert nor release active work. */
    voice_owner_guest(&owner, 3, false);
    assert(owner.active[0] == mask[0]);
    assert(!(qatomic_read(&guest[0]) & (1U << 3)));
    qemu_mutex_lock(&owner.lock);
    assert(!voice_owner_admit(&owner, mask));
    qemu_mutex_unlock(&owner.lock);
    pthread_t thread;
    assert(!pthread_create(&thread, NULL, request, NULL));
    while (!(qatomic_read(&guest[0]) & (1U << 3))) sched_yield();
    assert(!atomic_load(&returned));
    voice_owner_release(&owner, 3);
    assert(!pthread_join(thread, NULL));
    assert(atomic_load(&returned));
    assert(owner.active[0] == (1U << 7)); /* unrelated work still active */
    voice_owner_release(&owner, 7);

    /* Guest holds A and asks for B: a dispatcher blocked on A must not
     * retain a partial claim of B. This is the queued-before-LOCK case. */
    voice_owner_guest(&owner, 3, true);
    qemu_mutex_lock(&owner.lock);
    assert(!voice_owner_admit(&owner, mask));
    assert(!owner.active[0]);
    qemu_mutex_unlock(&owner.lock);
    voice_owner_guest(&owner, 7, true);
    voice_owner_guest(&owner, 7, false);
    voice_owner_guest(&owner, 3, false);
    voice_owner_cancel(&owner, true);
    qemu_mutex_lock(&owner.lock);
    assert(!voice_owner_admit(&owner, mask));
    qemu_mutex_unlock(&owner.lock);
    voice_owner_cancel(&owner, false);
}

static unsigned repeat_order;
static void *repeat_worker(void *arg)
{
    unsigned ordinal = (uintptr_t)arg;
    voice_owner_enter(&owner, 3, ordinal);
    assert(repeat_order == ordinal);
    repeat_order++;
    if (voice_owner_complete_repeat(&owner, 3)) voice_owner_release(&owner, 3);
    return NULL;
}
static void repeated(void)
{
    uint64_t mask[4] = { 1U << 3, 0, 0, 0 };
    qemu_mutex_lock(&owner.lock);
    assert(voice_owner_admit(&owner, mask));
    qemu_mutex_unlock(&owner.lock);
    voice_owner_repeat(&owner, 3, 3);
    atomic_store(&returned, false);
    pthread_t guest_thread, workers[3];
    assert(!pthread_create(&guest_thread, NULL, request, NULL));
    while (!(qatomic_read(&guest[0]) & (1U << 3))) sched_yield();
    assert(!atomic_load(&returned));
    /* Start in reverse order. Only the first occurrence may enter. */
    for (int i = 2; i >= 0; i--)
        assert(!pthread_create(&workers[i], NULL, repeat_worker, (void *)(uintptr_t)i));
    for (int i = 0; i < 3; i++) assert(!pthread_join(workers[i], NULL));
    assert(!pthread_join(guest_thread, NULL));
    assert(repeat_order == 3 && atomic_load(&returned));
    assert(!owner.active[0] && !owner.remaining[3]);
}

static void *worker(void *arg)
{
    unsigned v = (uintptr_t)arg;
    uint64_t mask[4] = { UINT64_C(1) << v, 0, 0, 0 };
    for (unsigned n = 0; n < 100000; n++) {
        bool claimed;
        qemu_mutex_lock(&owner.lock);
        claimed = voice_owner_admit(&owner, mask);
        qemu_mutex_unlock(&owner.lock);
        if (!claimed) { sched_yield(); continue; }
        /* Descriptor, filter and resampler stand-ins share an invariant.
         * A concurrent reset would corrupt it and is a sanitizer race. */
        assert(state[v][0] == state[v][1] && state[v][1] == state[v][2]);
        state[v][0]++;
        if (!(n & 15)) sched_yield();
        state[v][1]++;
        state[v][2]++;
#ifdef VOICE_REAL_RESAMPLER
        float input[16] = { 0.125f }, output[32];
        SRC_DATA data = { .data_in = input, .data_out = output,
                          .input_frames = 16, .output_frames = 32,
                          .src_ratio = 0.75 };
        assert(!src_process(resamplers[v], &data));
#endif
        voice_owner_release(&owner, v);
    }
    return NULL;
}

static void *guest_updates(void *unused)
{
    for (unsigned n = 0; n < 100000; n++) {
        unsigned v = (n * 13) & 15;
        voice_owner_guest(&owner, v, true);
        assert(state[v][0] == state[v][1] && state[v][1] == state[v][2]);
        state[v][0] = state[v][1] = state[v][2] = 0;
#ifdef VOICE_REAL_RESAMPLER
        assert(!src_reset(resamplers[v]));
#endif
        atomic_fetch_add(&handoffs, 1);
        voice_owner_guest(&owner, v, false);
    }
    return NULL;
}

int main(void)
{
    voice_owner_init(&owner, guest);
#ifdef VOICE_REAL_RESAMPLER
    for (unsigned v = 0; v < 16; v++) {
        int error;
        resamplers[v] = src_new(SRC_LINEAR, 1, &error);
        assert(resamplers[v] && !error);
    }
#endif
    targeted();
    repeated();
    for (int i = 0; i < 1000; i++) stopped_control();
    for (unsigned i = 0; i < 1000; i++) pause_wait();
    pthread_t workers[16], updater;
    assert(!pthread_create(&updater, NULL, guest_updates, NULL));
    for (uintptr_t v = 0; v < 16; v++)
        assert(!pthread_create(&workers[v], NULL, worker, (void *)v));
    for (unsigned v = 0; v < 16; v++) assert(!pthread_join(workers[v], NULL));
    assert(!pthread_join(updater, NULL));
    for (unsigned v = 0; v < 4; v++) assert(!guest[v] && !owner.active[v]);
    voice_owner_destroy(&owner);
#ifdef VOICE_REAL_RESAMPLER
    for (unsigned v = 0; v < 16; v++) src_delete(resamplers[v]);
#endif
    printf("voice ownership: targeted interleavings + %u guest handoffs PASS\n",
           atomic_load(&handoffs));
    return 0;
}
