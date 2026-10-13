/* SPDX-License-Identifier: BSD-2-Clause
 * Differentially test the actual downstream object against the pinned
 * upstream object, whose public symbols are renamed by the runner.
 */
#include "qemu/osdep.h"
#include "fpu/softfloat.h"
#include <inttypes.h>

#define REF_BINARY(name) extern floatx80 ref_floatx80_##name(floatx80, floatx80, float_status *)
REF_BINARY(add); REF_BINARY(sub); REF_BINARY(mul); REF_BINARY(div);
extern floatx80 ref_floatx80_sqrt(floatx80, float_status *);
extern floatx80 ref_floatx80_round_to_int(floatx80, float_status *);
extern FloatRelation ref_floatx80_compare(floatx80, floatx80, float_status *);
extern FloatRelation ref_floatx80_compare_quiet(floatx80, floatx80, float_status *);
extern float32 ref_floatx80_to_float32(floatx80, float_status *);
extern float64 ref_floatx80_to_float64(floatx80, float_status *);
extern int32_t ref_floatx80_to_int32(floatx80, float_status *);
extern int64_t ref_floatx80_to_int64(floatx80, float_status *);
extern int32_t ref_floatx80_to_int32_round_to_zero(floatx80, float_status *);
extern int64_t ref_floatx80_to_int64_round_to_zero(floatx80, float_status *);
extern floatx80 ref_float32_to_floatx80(float32, float_status *);
extern floatx80 ref_float64_to_floatx80(float64, float_status *);
extern floatx80 ref_int64_to_floatx80(int64_t, float_status *);
extern uint64_t boxdroid_fast_fpu_hits;

static uint64_t rng = UINT64_C(0x0033003600322026);
static uint64_t tests, mismatches;
static floatx80 input_a, input_b;
static int pc, rm;
static unsigned host_context;
static uint64_t random64(void)
{
    rng ^= rng << 13; rng ^= rng >> 7; rng ^= rng << 17;
    return rng;
}
static float_status status(unsigned flags)
{
    float_status s = { 0 };
    set_floatx80_rounding_precision(pc, &s);
    set_float_rounding_mode(rm, &s);
    set_float_exception_flags(flags, &s);
    set_float_2nan_prop_rule(float_2nan_prop_x87, &s);
    set_float_default_nan_pattern(0xc0, &s);
    return s;
}
static void check(const char *op, floatx80 actual, floatx80 expected,
                  float_status a, float_status b)
{
    ++tests;
    if (actual.high == expected.high && actual.low == expected.low &&
        a.float_exception_flags == b.float_exception_flags) { return; }
    if (mismatches++ < 20) {
        printf("MISMATCH %s pc=%d rm=%d a=%04x:%016" PRIx64
               " b=%04x:%016" PRIx64 " actual=%04x:%016" PRIx64
               "/%04x expected=%04x:%016" PRIx64 "/%04x\n", op, pc, rm,
               input_a.high, input_a.low, input_b.high, input_b.low,
               actual.high, actual.low, a.float_exception_flags,
               expected.high, expected.low, b.float_exception_flags);
    }
}
#define CHECK_BINARY(op) do { \
    float_status s = status(initial), r = s; \
    floatx80 a = floatx80_##op(input_a, input_b, &s); \
    floatx80 b = ref_floatx80_##op(input_a, input_b, &r); \
    check(#op, a, b, s, r); \
} while (0)
#define CHECK_UNARY(op) do { \
    float_status s = status(initial), r = s; \
    floatx80 a = floatx80_##op(input_a, &s); \
    floatx80 b = ref_floatx80_##op(input_a, &r); \
    check(#op, a, b, s, r); \
} while (0)
#define CHECK_SCALAR(op) do { \
    float_status s = status(initial), r = s; \
    uint64_t a = floatx80_##op(input_a, &s); \
    uint64_t b = ref_floatx80_##op(input_a, &r); \
    check(#op, (floatx80) { .low = a }, (floatx80) { .low = b }, s, r); \
} while (0)
#define CHECK_WIDEN(op, value) do { \
    float_status s = status(initial), r = s; \
    floatx80 a = op(value, &s), b = ref_##op(value, &r); \
    check(#op, a, b, s, r); \
} while (0)
static void test_pair(floatx80 a, floatx80 b, unsigned initial)
{
    input_a = a; input_b = b;
    CHECK_BINARY(add); CHECK_BINARY(sub); CHECK_BINARY(mul); CHECK_BINARY(div);
    CHECK_UNARY(sqrt); CHECK_UNARY(round_to_int);
    CHECK_SCALAR(to_float32); CHECK_SCALAR(to_float64);
    CHECK_SCALAR(to_int32); CHECK_SCALAR(to_int64);
    CHECK_SCALAR(to_int32_round_to_zero); CHECK_SCALAR(to_int64_round_to_zero);
    float_status s = status(initial), r = s;
    FloatRelation x = floatx80_compare(a, b, &s);
    FloatRelation y = ref_floatx80_compare(a, b, &r);
    check("compare", (floatx80) { .low = x }, (floatx80) { .low = y }, s, r);
    s = status(initial); r = s;
    x = floatx80_compare_quiet(a, b, &s);
    y = ref_floatx80_compare_quiet(a, b, &r);
    check("compare_quiet", (floatx80) { .low = x }, (floatx80) { .low = y }, s, r);
    uint64_t v = random64();
    CHECK_WIDEN(float32_to_floatx80, (uint32_t)v);
    CHECK_WIDEN(float64_to_floatx80, v);
    CHECK_WIDEN(int64_to_floatx80, (int64_t)v);
}
static floatx80 random_f80(void)
{
    uint64_t v = random64();
    static const uint16_t exps[] = { 0, 1, 2, 0x3ffe, 0x3fff, 0x4000,
                                    0x7ffe, 0x7fff, 16383-1022, 16383+1023,
                                    16383-126, 16383+127 };
    uint16_t exp = (v & 7) ? ((v & 0x100) ? 1 + (v % 32766) :
                                             16383 + (int)(v % 160) - 80) :
                            exps[(v >> 3) % ARRAY_SIZE(exps)];
    uint64_t low = random64() | (UINT64_C(1) << 63);
    switch ((v >> 11) & 7) {
    case 0: low = 0; break;
    case 1: low &= UINT64_C(0x7fffffffffffffff); break;
    case 2: low = UINT64_C(1) << 63; break;
    case 3: low &= ~UINT64_C(0xffffffffff); break;
    case 4: low &= ~UINT64_C(0x7ff); break;
    default: break; /* True 64-bit significands, not binary64 subsets. */
    }
    return (floatx80) { .high = exp | ((v >> 31) & 0x8000), .low = low };
}
int main(int argc, char **argv)
{
    unsigned iterations = argc > 1 ? strtoul(argv[1], NULL, 0) : 100000;
    host_context = argc > 2 ? strtoul(argv[2], NULL, 0) : 0;
#ifdef __aarch64__
    uint64_t fpcr;
    __asm__ volatile("mrs %0, fpcr" : "=r"(fpcr));
    uint64_t context = host_context == 1 ? UINT64_C(1) << 22 :
                       host_context == 2 ? UINT64_C(1) << 24 :
                       host_context == 3 ? UINT64_C(3) << 24 : 0;
    __asm__ volatile("msr fpcr, %0" : : "r"(context));
#endif
    static const FloatX80RoundPrec precisions[] = {
        floatx80_precision_s, floatx80_precision_d, floatx80_precision_x,
    };
    static const FloatRoundMode modes[] = {
        float_round_nearest_even, float_round_to_zero,
        float_round_up, float_round_down,
    };
    static const floatx80 cases[] = {
        { .high=0, .low=0 }, { .high=0x8000, .low=0 },
        { .high=0x3fff, .low=UINT64_C(0x8000000000000000) },
        { .high=0xbfff, .low=UINT64_C(0x8000000000000000) },
        { .high=0x4000, .low=UINT64_C(0x8000000000000000) },
        { .high=0x3fff-24, .low=UINT64_C(0x8000000000000000) },
        { .high=0x3fff-30, .low=UINT64_C(0x8000000000000000) },
        { .high=0x3fff, .low=UINT64_C(0xffffffffffffffff) },
        { .high=0x3fff, .low=UINT64_C(0xfffffffffffffffe) },
        { .high=0x3fff, .low=UINT64_C(0x8000000000000001) },
        { .high=0x3fff, .low=UINT64_C(0x8000008000000000) },
        { .high=0x3fff, .low=UINT64_C(0x8000018000000000) },
        /* (1 + 3*2^-24 + 2^-52)/(1 + 2^-52) lies just BELOW
         * an odd binary24 midpoint, but binary64 rounds onto it. */
        { .high=0x3fff, .low=UINT64_C(0x8000018000000800) },
        { .high=0x3fff, .low=UINT64_C(0x8000000000000800) },
        { .high=0x3fff, .low=UINT64_C(0x8000000000000400) },
        { .high=0x3fff, .low=UINT64_C(0x8000000000000c00) },
        { .high=1, .low=UINT64_C(0x8000000000000000) },
        { .high=0x7ffe, .low=UINT64_C(0xffffffffffffffff) },
        { .high=0, .low=1 }, { .high=0, .low=UINT64_C(0x7fffffffffffffff) },
        { .high=0, .low=UINT64_C(0x8000000000000000) },
        { .high=0x3fff, .low=1 },
        { .high=0x7fff, .low=UINT64_C(0x8000000000000000) },
        { .high=0xffff, .low=UINT64_C(0x8000000000000000) },
        { .high=0x7fff, .low=UINT64_C(0xc000000000000001) },
        { .high=0x7fff, .low=UINT64_C(0x8000000000000001) },
        { .high=0x7fff, .low=1 },
    };
    for (unsigned p=0; p<ARRAY_SIZE(precisions); ++p) {
        pc=precisions[p];
        for (unsigned m=0; m<ARRAY_SIZE(modes); ++m) {
            rm=modes[m];
            for (unsigned i=0; i<ARRAY_SIZE(cases); ++i) {
                for (unsigned j=0; j<ARRAY_SIZE(cases); ++j) {
                    test_pair(cases[i], cases[j], 0);
                }
            }
            for (unsigned i=0; i<iterations; ++i) {
                floatx80 a=random_f80(), b=random_f80();
                test_pair(a,b,(i & 1) ? 0 : 0x3f);
            }
        }
    }
    printf("RESULT comparisons=%" PRIu64 " fast_hits=%" PRIu64
           " mismatches=%" PRIu64 " host_context=%u seed=0033003600322026\n",
           tests, boxdroid_fast_fpu_hits, mismatches, host_context);
#ifdef __aarch64__
    __asm__ volatile("msr fpcr, %0" : : "r"(fpcr));
#endif
    return mismatches ? 1 : 0;
}
