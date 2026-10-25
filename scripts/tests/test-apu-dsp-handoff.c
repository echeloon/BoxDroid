/* Exercise the production DSP lock/handoff functions with a saturated owner. */
#include <assert.h>
#include <stdbool.h>
#include <pthread.h>
#include <sched.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

typedef struct MCPXAPUState {
    pthread_mutex_t lock;
    pthread_cond_t cond;
    unsigned int dsp_write_waiters;
    bool exiting;
    bool in_frame;
    unsigned int writes, frames;
} MCPXAPUState;

#define qatomic_read(p) __atomic_load_n((p), __ATOMIC_RELAXED)
#define qatomic_inc(p) __atomic_fetch_add((p), 1, __ATOMIC_SEQ_CST)
#define qatomic_dec(p) __atomic_fetch_sub((p), 1, __ATOMIC_SEQ_CST)
#define qemu_mutex_lock(p) assert(pthread_mutex_lock(p) == 0)
#define qemu_mutex_unlock(p) assert(pthread_mutex_unlock(p) == 0)
#define qemu_cond_wait(c, m) assert(pthread_cond_wait((c), (m)) == 0)
#define qemu_cond_signal(c) assert(pthread_cond_signal(c) == 0)

/* Generated directly from the configured emulator source by the runner. */
#include "apu-handoff-under-test.inc"

static void *frame_owner(void *opaque)
{
    MCPXAPUState *d = opaque;
    qemu_mutex_lock(&d->lock);
    while (!qatomic_read(&d->exiting)) {
        d->in_frame = true;
        ++d->frames;
        d->in_frame = false;
#ifndef BROKEN_HANDOFF
        frame_handoff(d);
#endif
    }
    qemu_mutex_unlock(&d->lock);
    return NULL;
}

static void *writer(void *opaque)
{
    MCPXAPUState *d = opaque;
    for (int i = 0; i < 2000; ++i) {
        dsp_write_lock(d);
        assert(!d->in_frame);
        ++d->writes;
        dsp_write_unlock(d);
        if (i % 17 == 0) {
            sched_yield();
        }
    }
    return NULL;
}

static void *spurious_waker(void *opaque)
{
    MCPXAPUState *d = opaque;
    while (!qatomic_read(&d->exiting)) {
        /* A wake without a completed writer must not bypass the predicate. */
        assert(pthread_cond_broadcast(&d->cond) == 0);
        usleep(100);
    }
    return NULL;
}

int main(void)
{
    alarm(10);
    for (int count = 1; count <= 8; count *= 2) {
        MCPXAPUState d = {
            .lock = PTHREAD_MUTEX_INITIALIZER,
            .cond = PTHREAD_COND_INITIALIZER,
        };
        pthread_t owner, wake, writers[8];
        assert(pthread_create(&owner, NULL, frame_owner, &d) == 0);
        assert(pthread_create(&wake, NULL, spurious_waker, &d) == 0);
        for (int i = 0; i < count; ++i) {
            assert(pthread_create(&writers[i], NULL, writer, &d) == 0);
        }
        for (int i = 0; i < count; ++i) {
            assert(pthread_join(writers[i], NULL) == 0);
        }
        assert(d.writes == 2000u * count);
        assert(qatomic_read(&d.dsp_write_waiters) == 0);
        __atomic_store_n(&d.exiting, true, __ATOMIC_SEQ_CST);
        assert(pthread_cond_broadcast(&d.cond) == 0);
        assert(pthread_join(owner, NULL) == 0);
        assert(pthread_join(wake, NULL) == 0);
        assert(d.frames > 0);
        assert(pthread_cond_destroy(&d.cond) == 0);
        assert(pthread_mutex_destroy(&d.lock) == 0);
        printf("PASS: %d writers, %u ordered writes, %u frames\n",
               count, d.writes, d.frames);
    }
    return 0;
}
