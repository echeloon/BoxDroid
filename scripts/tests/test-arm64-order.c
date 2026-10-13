/* ISA tests of the production backend's emitted STLR encoding. Shared
 * locations are accessed through asm, not racy C loads/stores. This tests
 * the lowering contract; the separate TB audit inspects real translation. */
#define _GNU_SOURCE
#include <assert.h>
#include <pthread.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <time.h>
#include "store-encoding.h"

typedef void (*Store)(void *, uint64_t);
typedef uint64_t (*Load)(void *);
static Store stores[4];
static Load loads[2][4];
static unsigned mode, direction, iterations = 200000;
static unsigned width;
static struct {
    _Alignas(128) uint64_t payload;
    _Alignas(128) uint32_t ready;
    _Alignas(128) uint32_t ack;
} shared;
static uint64_t failures;

static uint64_t read_value(void *p, unsigned size, bool cpu)
{
    if (mode >= 2 && mode != 7 && cpu) return loads[mode >= 4][size](p);
    uint64_t value;
    switch (size) {
    case 0: __asm__ volatile("dmb ishld\n\tldrb %w0, [%1]" : "=r"(value) : "r"(p) : "memory"); break;
    case 1: __asm__ volatile("dmb ishld\n\tldrh %w0, [%1]" : "=r"(value) : "r"(p) : "memory"); break;
    case 2: __asm__ volatile("dmb ishld\n\tldr %w0, [%1]" : "=r"(value) : "r"(p) : "memory"); break;
    default: __asm__ volatile("dmb ishld\n\tldr %0, [%1]" : "=r"(value) : "r"(p) : "memory"); break;
    }
    return value;
}
static void reference_store(void *p, uint64_t value, unsigned size)
{
    switch (size) {
    case 0: __asm__ volatile("dmb ish\n\tstrb %w0, [%1]" : : "r"(value), "r"(p) : "memory"); break;
    case 1: __asm__ volatile("dmb ish\n\tstrh %w0, [%1]" : : "r"(value), "r"(p) : "memory"); break;
    case 2: __asm__ volatile("dmb ish\n\tstr %w0, [%1]" : : "r"(value), "r"(p) : "memory"); break;
    default: __asm__ volatile("dmb ish\n\tstr %0, [%1]" : : "r"(value), "r"(p) : "memory"); break;
    }
}
static void write_value(void *p, uint64_t value, unsigned size, bool cpu)
{
    if (mode == 7 && cpu) {
        /* Conservative i128 store: ordinary preceding guest reads require
         * Load->Store as well as Store->Store before the paired write. */
        __asm__ volatile("dmb ish\n\tstp %1, %1, [%0]" : : "r"(p), "r"(value) : "memory");
        return;
    }
    if (mode && cpu) stores[size](p, value);
    else reference_store(p, value, size);
}
static void *producer(void *arg)
{
    for (unsigned n = 1; n <= iterations; n++) {
        while (read_value(&shared.ack, 2, direction == 0) != n - 1) {}
        write_value(&shared.payload, n % 251 + 1, width, direction == 0);
        /* Store forwarding must not let the later release publication pass
         * the earlier release payload, even with RCpc acquire. */
        if (mode >= 4 && direction == 0) {
            assert(read_value(&shared.payload, width, true) == n % 251 + 1);
        }
        if (mode == 6 && direction == 0) {
            /* Generic helper entry bridge: ordinary helper publication must
             * not pass the preceding translated release payload store. */
            reference_store(&shared.ready, n, 2);
            __asm__ volatile("dmb ishld" : : : "memory");
        } else write_value(&shared.ready, n, 2, direction == 0);
    }
    return NULL;
}
static void *consumer(void *arg)
{
    for (unsigned n = 1; n <= iterations; n++) {
        while (read_value(&shared.ready, 2, direction == 1 && mode != 3 && mode != 5) != n) {}
        /* Ordinary helper/vector read -> subsequent acquire load bridge. */
        if ((mode == 3 || mode == 5) && direction == 1) {
            __asm__ volatile("dmb ishld" : : : "memory");
        }
        uint64_t value = read_value(&shared.payload, width, direction == 1);
        if (value != n % 251 + 1) failures++;
        write_value(&shared.ack, n, 2, direction == 1);
    }
    return NULL;
}

static pthread_barrier_t begin, end;
static struct { _Alignas(16) uint64_t value[2]; } x, y;
static uint32_t r0, r1;
static void *load_buffering(void *arg)
{
    bool cpu = (uintptr_t)arg == 0;
    for (unsigned n = 0; n < iterations; n++) {
        pthread_barrier_wait(&begin);
        uint32_t r = read_value(cpu ? x.value : y.value, 2, cpu);
        write_value(cpu ? y.value : x.value, 1, 2, cpu);
        if (cpu) r0 = r; else r1 = r;
        pthread_barrier_wait(&end);
    }
    return NULL;
}

static uint64_t now_ns(void)
{
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return (uint64_t)t.tv_sec * 1000000000 + t.tv_nsec;
}
int main(int argc, char **argv)
{
    if (argc > 1) iterations = strtoul(argv[1], NULL, 0);
    uint32_t *code = mmap(NULL, 4096, PROT_READ | PROT_WRITE,
                         MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    assert(code != MAP_FAILED);
    for (unsigned size = 0; size < 4; size++) {
        code[size * 2] = backend_store_encoding(size, 0, 1);
        code[size * 2 + 1] = 0xd65f03c0; /* ret */
        stores[size] = (Store)&code[size * 2];
        for (unsigned rcpc = 0; rcpc < 2; rcpc++) {
            code[8 + rcpc * 8 + size * 2] = backend_load_encoding(size, 0, 0, rcpc);
            code[9 + rcpc * 8 + size * 2] = 0xd65f03c0;
            loads[rcpc][size] = (Load)&code[8 + rcpc * 8 + size * 2];
        }
        printf("backend store size=%u instruction=%08x\n", 1U << size, code[size*2]);
    }
    __builtin___clear_cache((char *)code, (char *)code + 96);
    assert(!mprotect(code, 4096, PROT_READ | PROT_EXEC));
    for (mode = 0; mode <= 7; mode++) {
        for (direction = 0; mode < 7 && direction <= 1; direction++) {
            for (width = 0; width < 4; width++) {
                memset(&shared, 0, sizeof(shared));
                pthread_t p, c;
                assert(!pthread_create(&p, NULL, producer, NULL));
                assert(!pthread_create(&c, NULL, consumer, NULL));
                assert(!pthread_join(p, NULL) && !pthread_join(c, NULL));
                printf("MP mode=%u direction=%s width=%u iterations=%u forbidden=%llu\n",
                       mode, direction ? "device_to_cpu" : "cpu_to_device",
                       1U << width, iterations, (unsigned long long)failures);
            }
        }
        assert(!pthread_barrier_init(&begin, NULL, 3));
        assert(!pthread_barrier_init(&end, NULL, 3));
        pthread_t a, b;
        assert(!pthread_create(&a, NULL, load_buffering, (void *)0));
        assert(!pthread_create(&b, NULL, load_buffering, (void *)1));
        for (unsigned n = 0; n < iterations; n++) {
            memset(&x, 0, sizeof(x)); memset(&y, 0, sizeof(y)); /* Workers are at the rendezvous. */
            pthread_barrier_wait(&begin);
            pthread_barrier_wait(&end);
            if (r0 == 1 && r1 == 1) failures++;
        }
        assert(!pthread_join(a, NULL) && !pthread_join(b, NULL));
        assert(!pthread_barrier_destroy(&begin) && !pthread_barrier_destroy(&end));
        printf("LB mode=%u iterations=%u forbidden=%llu\n", mode, iterations,
               (unsigned long long)failures);
        uint64_t start = now_ns();
        for (unsigned n = 0; n < 2000000; n++) write_value(&shared.payload, n, 2, true);
        printf("store local cost mode=%u ns/op=%.2f\n", mode,
               (now_ns() - start) / 2000000.0);
    }
    munmap(code, 4096);
    return failures ? 1 : 0;
}
