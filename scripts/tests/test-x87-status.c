/* Exercise pinned QEMU's actual x87 helper clear/merge and exception masks. */
#include "qemu/osdep.h"
#include "cpu.h"
#include "fpu/softfloat.h"
#include <setjmp.h>
#include <sys/system_properties.h>
extern uint64_t boxdroid_fast_fpu_hits;
extern void helper_fldcw(CPUX86State *, uint32_t);
extern void helper_fdiv_ST0_FT0(CPUX86State *);
extern void helper_fadd_ST0_FT0(CPUX86State *);
extern void helper_frndint(CPUX86State *);
extern void helper_fsqrt(CPUX86State *);
extern int32_t helper_fistl_ST0(CPUX86State *);
extern uint32_t helper_fsts_ST0(CPUX86State *);
extern void helper_fwait(CPUX86State *);
extern void helper_fclex(CPUX86State *);
extern void cpu_init_fp_statuses(CPUX86State *);
static jmp_buf trap;
static unsigned traps;
bool tcg_allowed = true;
G_NORETURN void raise_exception_ra(CPUX86State *, int, uintptr_t);
G_NORETURN void raise_exception_ra(CPUX86State *env, int exception,
                                  uintptr_t retaddr)
{
    assert(exception == EXCP10_COPR);
    traps++;
    longjmp(trap, 1);
}
void fpu_check_raise_ferr_irq(CPUX86State *env) { abort(); }
static CPUX86State env;
static void setup(unsigned control, floatx80 a, floatx80 b)
{
    memset(&env, 0, sizeof(env));
    cpu_init_fp_statuses(&env);
    helper_fldcw(&env, control);
    env.fpregs[0].d = a;
    env.ft0 = b;
    env.cr[0] = CR0_NE_MASK;
    /* A sticky preexisting SoftFloat flag must be retained, but must NOT
     * falsely become a newly raised guest exception in this helper. */
    set_float_exception_flags(float_flag_invalid, &env.fp_status);
}
static void expect(unsigned exception, bool unmasked)
{
    unsigned expected = exception | (unmasked ? 0x8080 : 0);
    if ((env.fpus & 0x80bf) != expected) {
        fprintf(stderr, "FPUS=%04x expected=%04x FPUC=%04x flags=%02x\n",
                env.fpus, expected, env.fpuc,
                get_float_exception_flags(&env.fp_status));
    }
    assert((env.fpus & 0x80bf) == expected);
    assert(get_float_exception_flags(&env.fp_status) & float_flag_invalid);
    unsigned before = traps;
    if (!setjmp(trap)) helper_fwait(&env);
    assert(traps == before + unmasked);
}
static void control_cache(void)
{
    char previous[PROP_VALUE_MAX] = {0};
    __system_property_get("debug.boxdroid.fast_fpu", previous);
    float_status a = {0}, b = {0};
    a.float_exception_flags = b.float_exception_flags =
        float_flag_invalid | float_flag_inexact;
    assert(!__system_property_set("debug.boxdroid.fast_fpu", "1"));
    (void)float32_to_floatx80(0x3f800000, &a);
    (void)float32_to_floatx80(0x3f800000, &a);
    assert(!__system_property_set("debug.boxdroid.fast_fpu", "0"));
    uint64_t before = boxdroid_fast_fpu_hits;
    (void)float32_to_floatx80(0x3f800000, &b);
    assert(boxdroid_fast_fpu_hits == before);
    (void)float32_to_floatx80(0x3f800000, &a);
    assert(boxdroid_fast_fpu_hits == before + 1);
    /* An existing status polls boundedly; a fresh status already sees OFF.
     * Controls must never alter result bits or the software exception latch. */
    for (unsigned i = 0; i < 65537; i++) {
        floatx80 value = float32_to_floatx80(0x3f800000, &a);
        assert(value.high == 0x3fff && value.low == UINT64_C(0x8000000000000000));
        assert(a.float_exception_flags == (float_flag_invalid | float_flag_inexact));
    }
    before = boxdroid_fast_fpu_hits;
    (void)float32_to_floatx80(0x3f800000, &a);
    assert(boxdroid_fast_fpu_hits == before);
    assert(!__system_property_set("debug.boxdroid.fast_fpu", "1"));
    for (unsigned i = 0; i < 65537; i++) {
        floatx80 value = float32_to_floatx80(0x3f800000, &b);
        assert(value.high == 0x3fff && value.low == UINT64_C(0x8000000000000000));
        assert(b.float_exception_flags == (float_flag_invalid | float_flag_inexact));
    }
    before = boxdroid_fast_fpu_hits;
    (void)float32_to_floatx80(0x3f800000, &b);
    assert(boxdroid_fast_fpu_hits == before + 1);
    assert(!__system_property_set("debug.boxdroid.fast_fpu", previous));
    puts("x87 control cache: independent statuses, OFF/ON refresh, unchanged result/status PASS");
}
int main(void)
{
    floatx80 one = { .high=0x3fff, .low=UINT64_C(0x8000000000000000) };
    floatx80 three = { .high=0x4000, .low=UINT64_C(0xc000000000000000) };
    floatx80 half = { .high=0x3ffe, .low=UINT64_C(0x8000000000000000) };
    floatx80 zero = {0};
    unsigned cases = 0;
    for (unsigned precision=0; precision<3; precision++) {
        unsigned pc_bits = precision == 0 ? 0 : precision == 1 ? 0x200 : 0x300;
        for (unsigned mode=0; mode<4; mode++) {
            for (unsigned mask=0; mask<2; mask++) {
                unsigned control = pc_bits | (mode << 10) | (mask ? 0 : 0x3f);
                setup(control, one, three);
                helper_fdiv_ST0_FT0(&env); expect(0x20, mask); cases++;
                setup(control, one, zero);
                helper_fdiv_ST0_FT0(&env); expect(0x04, mask); cases++;
                setup(control, zero, zero);
                helper_fdiv_ST0_FT0(&env); expect(0x01, mask); cases++;
                setup(control, half, zero);
                helper_frndint(&env); expect(0x20, mask); cases++;
                setup(control, half, zero);
                (void)helper_fistl_ST0(&env); expect(0x20, mask); cases++;
                floatx80 narrow = { .high=0x3fff, .low=UINT64_C(0x8000000100000000) };
                setup(control, narrow, zero);
                (void)helper_fsts_ST0(&env); expect(0x20, mask); cases++;
                setup(control, one, one);
                helper_fadd_ST0_FT0(&env); expect(0, false); cases++;
                setup(control, one, zero);
                helper_fsqrt(&env); expect(0, false); cases++;
                /* Sticky SoftFloat PE alone must not manufacture guest PE. */
                setup(control, one, one);
                float_raise(float_flag_inexact, &env.fp_status);
                helper_fadd_ST0_FT0(&env); expect(0, false); cases++;
                /* QEMU recomputes ES/B from sticky FPUS when merging, even
                 * on an exact operation. The masked case can retain PE. */
                setup(control, one, one);
                env.fpus = 0x20;
                float_raise(float_flag_inexact, &env.fp_status);
                helper_fadd_ST0_FT0(&env); expect(0x20, mask); cases++;
                setup(control, one, three);
                env.fpus = 0x20;
                float_raise(float_flag_inexact, &env.fp_status);
                helper_fdiv_ST0_FT0(&env); expect(0x20, mask); cases++;
                /* FCLEX clears the guest latch, even while saved software
                 * status still has PE. The next exact result stays clear. */
                setup(control, one, one);
                env.fpus = 0x20;
                float_raise(float_flag_inexact, &env.fp_status);
                helper_fclex(&env);
                helper_fadd_ST0_FT0(&env); expect(0, false); cases++;
            }
        }
    }
    printf("x87 helper status: %u cases; masked/unmasked FPUS + FWAIT PASS; traps=%u\n",
           cases, traps);
    control_cache();
    return 0;
}
