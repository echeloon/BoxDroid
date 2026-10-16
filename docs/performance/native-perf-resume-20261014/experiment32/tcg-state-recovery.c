/* SPDX-License-Identifier: GPL-2.0-or-later */
/* Focused tests of the actual Android full-system TCG translator. */
#include "qemu/osdep.h"
#include "cpu.h"
#include "accel/tcg/cpu-ops.h"
#include "accel/tcg/internal-common.h"
#ifdef BOXDROID_TCG_JMP_CACHE_TEST
#include "accel/tcg/tb-jmp-cache.h"
#include "accel/tcg/tb-hash.h"
#endif
#include "exec/cpu-common.h"
#include "exec/cpu-interrupt.h"
#include "exec/cputlb.h"
#include "exec/helper-proto.h"
#include "exec/helper-gen.h"
#include "exec/translator.h"
#include "exec/mmap-lock.h"
#include "exec/tb-flush.h"
#include "exec/watchpoint.h"
#include "exec/translation-block.h"
#include "fpu/softfloat.h"
#include "hw/qdev-core.h"
#include "qapi/error.h"
#include "qemu/main-loop.h"
#include "qemu/cacheinfo.h"
#include "qemu/units.h"
#include "system/address-spaces.h"
#include "system/cpus.h"
#include "system/memory.h"
#include "system/system.h"
#include "tcg/startup.h"
#include "tcg/tcg.h"
#include "tcg/tcg-op.h"

extern void helper_enter_mmx(CPUX86State *env);
extern void helper_fpush(CPUX86State *env);
extern void helper_fpop(CPUX86State *env);
extern void helper_fmov_ST0_STN(CPUX86State *env, int n);
extern void helper_fmov_STN_ST0(CPUX86State *env, int n);
extern void helper_fmov_FT0_STN(CPUX86State *env, int n);
extern void helper_fldcw(CPUX86State *env, uint32_t cw);
extern void helper_flds_ST0(CPUX86State *env, uint32_t val);
extern void helper_flds_FT0(CPUX86State *env, uint32_t val);
extern uint32_t helper_fsts_ST0(CPUX86State *env);
extern void helper_mulps_xmm(CPUX86State *env, ZMMReg *d, ZMMReg *v, ZMMReg *s);
#define DECLARE_ARITH(name)                                                    \
  extern void helper_##name##_ST0_FT0(CPUX86State *env);                       \
  extern void helper_##name##_STN_ST0(CPUX86State *env, int n);
DECLARE_ARITH(fadd)
DECLARE_ARITH(fmul)
DECLARE_ARITH(fsub)
DECLARE_ARITH(fsubr)
DECLARE_ARITH(fdiv)
DECLARE_ARITH(fdivr)
static MemoryRegion ram;
#ifdef BOXDROID_TCG_FP_LOCAL_TEST
extern void boxdroid_test_helper_abi(uintptr_t fn, CPUX86State *env,
                                     void *operand, uintptr_t bits,
                                     uint64_t *saved);
asm(".text\n"
    ".global boxdroid_test_helper_abi\n"
    ".type boxdroid_test_helper_abi, %function\n"
    "boxdroid_test_helper_abi:\n"
    "stp x19, x30, [sp, #-16]!\n"
    "mov x16, x0\nmov x0, x1\nmov x1, x2\nmov x2, x3\nmov x19, x4\n"
    "mov x9, #0x9009\nmovk x9, #0x1234, lsl #32\n"
    "mov x10, #0x900a\nmovk x10, #0x1234, lsl #32\n"
    "mov x11, #0x900b\nmovk x11, #0x1234, lsl #32\n"
    "mov x12, #0x900c\nmovk x12, #0x1234, lsl #32\n"
    "mov x13, #0x900d\nmovk x13, #0x1234, lsl #32\n"
    "mov x14, #0x900e\nmovk x14, #0x1234, lsl #32\n"
    "mov x15, #0x900f\nmovk x15, #0x1234, lsl #32\n"
    "blr x16\n"
    "stp x9, x10, [x19]\nstp x11, x12, [x19, #16]\n"
    "stp x13, x14, [x19, #32]\nstr x15, [x19, #48]\n"
    "ldp x19, x30, [sp], #16\nret\n"
    ".size boxdroid_test_helper_abi, .-boxdroid_test_helper_abi\n");
#endif
static uint32_t rng = 0x6db07a19;
static uint32_t random_word(void) {
  rng ^= rng << 13;
  rng ^= rng >> 17;
  rng ^= rng << 5;
  return rng;
}
/* BoxDroid's property-refresh counters are internal diagnostics, not x87 state.
 * Exact integer conversions may bypass the numeric library's refresh counter.
 */
static void match_fp_diagnostics(CPUX86State *expected,
                                 const CPUX86State *actual) {
#ifdef BOXDROID_XBOX_RUNTIME
  expected->fp_status.boxdroid_fast_fpu_checks =
      actual->fp_status.boxdroid_fast_fpu_checks;
  expected->fp_status.boxdroid_fast_fpu_state =
      actual->fp_status.boxdroid_fast_fpu_state;
#endif
}
static void step(CPUState *cpu) {
  assert(cpu->stopped && !cpu->running);
  cpu->neg.icount_decr.u32 = 0;
  cpu->exception_index = -1;
  cpu_exec_step_atomic(cpu);
  if (cpu->exception_index >= 0)
    cpu->cc->tcg_ops->cpu_exec_exit(cpu);
  assert(!cpu->running);
  /* Exception cleanup releases the I/O lock; restore the stopped-VM guard. */
  if (!bql_locked())
    bql_lock();
}
static void block(CPUState *cpu, unsigned count) {
  assert(bql_locked() && cpu->stopped && !cpu->running);
  if (sigsetjmp(cpu->jmp_env, 0)) {
    assert(!tcg_ctx->gen_tb);
    if (bql_locked())
      bql_unlock();
    cpu->running = false;
    end_exclusive();
    bql_lock();
    cpu->cc->tcg_ops->cpu_exec_exit(cpu);
    return;
  }
  start_exclusive();
  cpu->running = true;
  cpu->neg.icount_decr.u32 = 0;
  cpu->exception_index = -1;
  TCGTBCPUState state = cpu->cc->tcg_ops->get_tb_cpu_state(cpu);
  state.cflags = (cpu->tcg_cflags & ~(CF_COUNT_MASK | CF_PARALLEL)) |
                 CF_NO_GOTO_TB | CF_NO_GOTO_PTR | count;
  mmap_lock();
  TranslationBlock *tb = tb_gen_code(cpu, state);
  mmap_unlock();
  cpu->cc->tcg_ops->cpu_exec_enter(cpu);
  asm volatile("dmb ish" ::: "memory");
  tcg_qemu_tb_exec(cpu_env(cpu), tb->tc.ptr);
  cpu->cc->tcg_ops->cpu_exec_exit(cpu);
  cpu->running = false;
  end_exclusive();
}
#ifdef BOXDROID_TCG_INLINE_LOOKUP_TEST
extern uint64_t boxdroid_inline_lookup_hits[2];
extern uint64_t boxdroid_inline_lookup_fallbacks;
#ifdef BOXDROID_TCG_VECTOR_ACQUIRE_TEST
extern uint64_t boxdroid_vector_acquire_hits;
#endif
extern bool boxdroid_jmp_cache2;
static int chained_exec(CPUState *cpu) {
  assert(bql_locked() && cpu->stopped && !cpu->running);
  start_exclusive();
  cpu->running = true;
  cpu->halted = false;
  cpu->exception_index = -1;
  cpu->cflags_next_tb = -1;
  cpu->neg.icount_decr.u32 = 0;
  qatomic_set(&cpu->exit_request, 0);
  bql_unlock();
  int result = cpu_exec(cpu);
  if (!bql_locked())
    bql_lock();
  cpu->running = false;
  end_exclusive();
  return result;
}

typedef struct LookupObserver {
  uint32_t *values;
  CPUState *cpu;
  bool stop, ready, inject_interrupt;
  unsigned samples, violations;
} LookupObserver;

static void *lookup_observer(void *opaque) {
  LookupObserver *o = opaque;
  qatomic_store_release(&o->ready, true);
  while (!qatomic_read(&o->stop)) {
    uint32_t flag = qatomic_load_acquire(&o->values[1]);
    uint32_t data = qatomic_read(&o->values[0]);
    if (flag) {
      o->samples++;
      if (data < flag)
        o->violations++;
    }
    if (o->inject_interrupt && flag >= 256) {
      bql_lock();
      cpu_interrupt(o->cpu, CPU_INTERRUPT_DEBUG);
      bql_unlock();
      break;
    }
  }
  return NULL;
}

/* The same physical code page must execute at both virtual PCs, including
 * precise CALL return addresses. Absolute TBs must remain separately keyed. */
static void test_code_aliases(CPUState *cpu, const CPUX86State *initial) {
  CPUX86State *env = cpu_env(cpu);
  uint8_t *mem = memory_region_get_ram_ptr(&ram);
  uint32_t *pd = (void *)(mem + 0x1000), *pt = (void *)(mem + 0x2000);
  memset(pd, 0, 4096);
  memset(pt, 0, 4096);
  pd[0] = 0x2003;
  pt[0x14] = 0x14003;
  pt[0x24] = 0x14003;
  pt[0x4e] = 0x4e003;
  uint8_t code[] = {0xe8, 0, 0, 0, 0, 0x58, 0x83, 0xc3, 1, 0xf4};
  for (unsigned revision = 0; revision < 2; revision++) {
    code[8] = revision + 1;
    assert(address_space_write(&address_space_memory, 0x14000,
        MEMTXATTRS_UNSPECIFIED, code, sizeof(code)) == MEMTX_OK);
    for (unsigned trial = 0; trial < 32; trial++) {
      unsigned pc = trial & 1 ? 0x24000 : 0x14000;
      *env = *initial;
      env->eip = pc;
      env->regs[R_ESP] = 0x4eff0;
      env->regs[R_EBX] = 123;
      cpu_x86_update_cr3(env, 0x1000);
      cpu_x86_update_cr0(env, CR0_PE_MASK | CR0_PG_MASK);
      assert(chained_exec(cpu) == EXCP_HLT);
      assert(env->regs[R_EAX] == pc + 5 && env->eip == pc + sizeof(code));
      assert(env->regs[R_EBX] == 124 + revision && env->regs[R_ESP] == 0x4eff0);
      if (trial == 8)
        tlb_flush_page(cpu, pc);
      if (trial == 16)
        tb_flush__exclusive_or_serial();
    }
  }
  *env = *initial;
  cpu->halted = false;
  cpu->exception_index = -1;
  tlb_flush(cpu);
  puts("virtual code aliases: CALL PC, direct chains, physical SMC/flush PASS");
}

static void test_lookup_visibility(CPUState *cpu, const CPUX86State *initial) {
  CPUX86State *env = cpu_env(cpu);
  uint32_t *values = (void *)(memory_region_get_ram_ptr(&ram) + 0x48000);
  uint8_t first[] = {0x89, 0x07, 0xff, 0xe1};
  uint8_t second[] = {0x89, 0x47, 4, 0x40, 0x3d, 0, 0, 1, 0,
                      0x73, 2, 0xff, 0xe2, 0xf4};
  assert(address_space_write(&address_space_memory, 0x12000,
      MEMTXATTRS_UNSPECIFIED, first, sizeof(first)) == MEMTX_OK);
  assert(address_space_write(&address_space_memory, 0x13000,
      MEMTXATTRS_UNSPECIFIED, second, sizeof(second)) == MEMTX_OK);
  for (unsigned pass = 0; pass < 2; pass++) {
    *env = *initial;
    env->regs[R_EAX] = 1;
    env->regs[R_ECX] = 0x13000;
    env->regs[R_EDX] = 0x12000;
    env->regs[R_EDI] = 0x48000;
    env->eip = 0x12000;
    qatomic_set(&values[0], 0);
    qatomic_set(&values[1], 0);
    LookupObserver observer = {.values = values, .cpu = cpu,
                               .inject_interrupt = pass != 0};
    GThread *thread = g_thread_new("lookup-observer", lookup_observer, &observer);
    while (!qatomic_load_acquire(&observer.ready))
      g_thread_yield();
    int result = chained_exec(cpu);
    qatomic_set(&observer.stop, true);
    g_thread_join(thread);
    fprintf(stderr, "visibility observer: samples=%u violations=%u pass=%u result=%d\n",
            observer.samples, observer.violations, pass, result);
    assert(observer.samples && !observer.violations);
    if (pass) {
      assert(result == EXCP_DEBUG && env->regs[R_EAX] < 65536);
      /* Resume the precise interrupted instruction: no repeated/lost writes. */
      assert(chained_exec(cpu) == EXCP_HLT);
    } else {
      assert(result == EXCP_HLT);
    }
    assert(env->regs[R_EAX] == 65536 && values[0] == 65535 &&
           values[1] == 65535 && env->eip == 0x1300e);
    printf("indirect-chain device-visible store ordering/interrupt resume: "
           "samples=%u violations=%u interrupt=%u PASS\n",
           observer.samples, observer.violations, pass);
  }
  cpu->halted = false;
  cpu->exception_index = -1;
  *env = *initial;
}

typedef struct VectorWriter {
  uint64_t *values;
  bool stop;
} VectorWriter;
static void *vector_writer(void *opaque) {
  VectorWriter *writer = opaque;
  while (!qatomic_read(&writer->stop)) {
    qatomic_set(&writer->values[0], UINT64_C(0x0123456789abcdef));
    qatomic_set(&writer->values[1], UINT64_C(0xfedcba9876543210));
    qatomic_set(&writer->values[0], UINT64_C(0x55aa55aa33cc33cc));
    qatomic_set(&writer->values[1], UINT64_C(0xaa55aa55cc33cc33));
  }
  return NULL;
}
static void test_vector_visibility(CPUState *cpu, const CPUX86State *initial) {
  CPUX86State *env = cpu_env(cpu);
  uint64_t *values = (void *)(memory_region_get_ram_ptr(&ram) + 0x48000);
  uint8_t code[] = {0x0f, 0x10, 0}; /* movups xmm0,[eax] */
  assert(address_space_write(&address_space_memory, 0x10000,
      MEMTXATTRS_UNSPECIFIED, code, sizeof(code)) == MEMTX_OK);
  qatomic_set(&values[0], UINT64_C(0x0123456789abcdef));
  qatomic_set(&values[1], UINT64_C(0xfedcba9876543210));
  VectorWriter writer = {.values = values};
  GThread *thread = g_thread_new("vector-writer", vector_writer, &writer);
  for (unsigned i = 0; i < 512; i++) {
    *env = *initial;
    env->hflags &= ~HF_TS_MASK;
    env->hflags |= HF_OSFXSR_MASK;
    env->cr[4] |= CR4_OSFXSR_MASK;
    env->eip = 0x10000;
    env->regs[R_EAX] = 0x48000;
    step(cpu);
    assert(cpu->exception_index == -1 && env->eip == 0x10003);
    uint64_t lo = env->xmm_regs[0].ZMM_Q(0), hi = env->xmm_regs[0].ZMM_Q(1);
    assert((lo == UINT64_C(0x0123456789abcdef) ||
            lo == UINT64_C(0x55aa55aa33cc33cc)) &&
           (hi == UINT64_C(0xfedcba9876543210) ||
            hi == UINT64_C(0xaa55aa55cc33cc33)));
  }
  qatomic_set(&writer.stop, true);
  g_thread_join(thread);
  /* Keep the TLB warm to cover the generated aligned and unaligned paths,
   * rather than routing every bit-copy case through the cold C helper. */
  uint8_t payload[16];
  for (unsigned i = 0; i < sizeof(payload); i++)
    payload[i] = i * 13 + 7;
  for (unsigned offset = 0; offset < 32; offset++) {
    memcpy((uint8_t *)values + offset, payload, sizeof(payload));
    *env = *initial;
    env->hflags &= ~HF_TS_MASK;
    env->hflags |= HF_OSFXSR_MASK;
    env->cr[4] |= CR4_OSFXSR_MASK;
    env->eip = 0x10000;
    env->regs[R_EAX] = 0x48000 + offset;
    step(cpu);
    assert(cpu->exception_index == -1 &&
           !memcmp(&env->xmm_regs[0], payload, sizeof(payload)));
  }
  *env = *initial;
  puts("actual SSE pair reads: concurrent half atomicity/warm alignment PASS");
}

static void test_inline_lookup(CPUState *cpu, const CPUX86State *initial) {
  CPUX86State *env = cpu_env(cpu);
  uint32_t source = 0x12000, targets[2] = {0x13000, 0};
  unsigned hash = tb_jmp_cache_hash_func(targets[0]);
  for (uint32_t pc = targets[0] + 8; pc < targets[0] + 4096; pc++)
    if (tb_jmp_cache_hash_func(pc) == hash) {
      targets[1] = pc;
      break;
    }
  assert(targets[1]);
  uint8_t indirect[] = {0xff, 0xe1}; /* jmp ecx */
  uint8_t target_code[] = {0x83, 0xc0, 7, 0xf4}; /* add eax,7; hlt */
  assert(address_space_write(&address_space_memory, source,
      MEMTXATTRS_UNSPECIFIED, indirect, sizeof(indirect)) == MEMTX_OK);
  for (unsigned i = 0; i < 2; i++)
    assert(address_space_write(&address_space_memory, targets[i],
        MEMTXATTRS_UNSPECIFIED, target_code, sizeof(target_code)) == MEMTX_OK);
  uint64_t before[2] = {boxdroid_inline_lookup_hits[0],
                        boxdroid_inline_lookup_hits[1]};
  for (unsigned i = 0; i < 256; i++) {
    *env = *initial;
    env->eip = targets[i & 1];
    env->regs[R_EAX] = random_word();
    env->regs[R_ECX] = targets[i & 1];
    env->regs[R_EDX] = random_word();
    env->eflags = 2 | (i & 2 ? AC_MASK : 0);
    CPUX86State start = *env;
    step(cpu);
    step(cpu);
    assert(cpu->exception_index == EXCP_HLT);
    CPUX86State expected = *env;
    /* Step TBs have special cflags; restore the normal target into the cache
     * before indirect execution so both primary and colliding secondary hits
     * are exercised, rather than just alternating nonmatching step entries. */
    *env = start;
    int result = chained_exec(cpu);
    assert(result == EXCP_HLT);
    *env = start;
    env->eip = source;
    result = chained_exec(cpu);
    assert(result == EXCP_HLT);
    assert(env->eip == expected.eip && env->eflags == expected.eflags);
    expected.cc_op = env->cc_op;
    expected.cc_src = env->cc_src;
    expected.cc_src2 = env->cc_src2;
    expected.cc_dst = env->cc_dst;
    assert(!memcmp(env, &expected, sizeof(*env)));
  }
  /* Populate two colliding normal-mode destinations, then exercise both slots
   * without replacing them with single-step TBs in between. */
  for (unsigned i = 0; i < 32; i++) {
    *env = *initial;
    env->eip = i < 2 ? targets[i] : source;
    env->regs[R_ECX] = targets[i & 1];
    env->regs[R_EAX] = 123;
    assert(chained_exec(cpu) == EXCP_HLT);
    assert(env->regs[R_EAX] == 130);
  }
  uint64_t primary = boxdroid_inline_lookup_hits[0] - before[0];
  uint64_t secondary = boxdroid_inline_lookup_hits[1] - before[1];
  printf("actual indirect chained lookup: primary=%" PRIu64
         " secondary=%" PRIu64 " fallbacks=%" PRIu64 "\n",
         primary, secondary, boxdroid_inline_lookup_fallbacks);
  if (tcg_ctx->boxdroid_inline_lookup_requested)
    assert(primary > 0 && (!boxdroid_jmp_cache2 || secondary > 0));

  /* A breakpoint at the indirect destination must be recognized before ADD. */
  CPUBreakpoint *bp;
  assert(cpu_breakpoint_insert(cpu, targets[0], BP_GDB, &bp) == 0);
  *env = *initial;
  env->eip = source;
  env->regs[R_EAX] = 123;
  env->regs[R_ECX] = targets[0];
  assert(chained_exec(cpu) == EXCP_DEBUG);
  assert(env->eip == targets[0] && env->regs[R_EAX] == 123);
  cpu_breakpoint_remove_by_ref(cpu, bp);

  /* Live cache invalidation after changing guest code must never execute ADD. */
  target_code[1] = 0xe8; /* sub eax,7 */
  assert(address_space_write(&address_space_memory, targets[0],
      MEMTXATTRS_UNSPECIFIED, target_code, sizeof(target_code)) == MEMTX_OK);
  for (unsigned i = 0; i < 8; i++) {
    *env = *initial;
    env->eip = source;
    env->regs[R_EAX] = 123;
    env->regs[R_ECX] = targets[0];
    assert(chained_exec(cpu) == EXCP_HLT);
    assert(env->regs[R_EAX] == 116 && env->eip == targets[0] + 4);
    if (i == 2)
      tlb_flush_page(cpu, targets[0]);
    if (i == 5)
      tb_flush__exclusive_or_serial();
  }

  /* Nonzero CS and single-instruction mode use the original helper semantics. */
  *env = *initial;
  cpu_x86_load_seg_cache(env, R_CS, 8, 0x10000, UINT32_MAX,
      DESC_P_MASK | DESC_S_MASK | DESC_CS_MASK | DESC_R_MASK | DESC_B_MASK);
  env->eip = source - 0x10000;
  env->regs[R_EAX] = 123;
  env->regs[R_ECX] = targets[0] - 0x10000;
  uint64_t previous_fallbacks = boxdroid_inline_lookup_fallbacks;
  assert(chained_exec(cpu) == EXCP_HLT);
  assert(env->regs[R_EAX] == 116 && env->eip == targets[0] + 4 - 0x10000);
  assert(boxdroid_inline_lookup_fallbacks > previous_fallbacks);
  *env = *initial;
  one_insn_per_tb = true;
  env->eip = source;
  env->regs[R_EAX] = 123;
  env->regs[R_ECX] = targets[0];
  previous_fallbacks = boxdroid_inline_lookup_fallbacks;
  assert(chained_exec(cpu) == EXCP_HLT);
  assert(env->regs[R_EAX] == 116);
  assert(boxdroid_inline_lookup_fallbacks > previous_fallbacks);
  one_insn_per_tb = false;
  cpu->halted = false;
  cpu->exception_index = -1;
  *env = *initial;
#ifdef BOXDROID_TCG_SHARED_LOOKUP_TEST
  unsigned shared = 0;
  for (unsigned i = 0; i < ARRAY_SIZE(tcg_ctx->boxdroid_lookup_shared); i++)
    shared += tcg_ctx->boxdroid_lookup_shared[i] != NULL;
  if (tcg_ctx->boxdroid_lookup_shared_requested &&
      tcg_ctx->boxdroid_inline_lookup_requested && tcg_ctx->boxdroid_lookup_no_bridges)
    assert(shared > 0);
  printf("shared lookup generated entries=%u, cflags=%x PASS\n", shared,
         cpu->tcg_cflags);
#ifdef BOXDROID_TCG_TAIL_LOOKUP_TEST
  if (tcg_ctx->boxdroid_lookup_tail_requested && shared) {
    unsigned tail_shared = 0;
    for (unsigned i = 4; i < ARRAY_SIZE(tcg_ctx->boxdroid_lookup_shared); i++)
      tail_shared += tcg_ctx->boxdroid_lookup_shared[i] != NULL;
    assert(tail_shared > 0);
    printf("terminal shared lookup tail entries=%u PASS\n", tail_shared);
  }
#endif
  if (shared && tcg_ctx->boxdroid_lookup_shared_requested) {
    /* Force first-entry creation in a redundant translation. QEMU discards
     * that allocation; the new shared address must never be published. */
    const uint8_t jump[] = {0xff, 0xe1};
    assert(address_space_write(&address_space_memory, 0x17000,
        MEMTXATTRS_UNSPECIFIED, jump, sizeof(jump)) == MEMTX_OK);
    *env = *initial;
    env->eip = 0x17000;
    TCGTBCPUState state = cpu->cc->tcg_ops->get_tb_cpu_state(cpu);
    state.cflags = cpu->tcg_cflags;
    mmap_lock();
    TranslationBlock *original = tb_gen_code(cpu, state);
    const tcg_insn_unit *saved[ARRAY_SIZE(tcg_ctx->boxdroid_lookup_shared)];
    memcpy(saved, tcg_ctx->boxdroid_lookup_shared, sizeof(saved));
    memset(tcg_ctx->boxdroid_lookup_shared, 0, sizeof(saved));
    void *before_ptr = tcg_ctx->code_gen_ptr;
    TranslationBlock *duplicate = tb_gen_code(cpu, state);
    mmap_unlock();
    assert(duplicate == original && (uintptr_t)tcg_ctx->code_gen_ptr ==
           ROUND_UP((uintptr_t)before_ptr, qemu_icache_linesize));
    unsigned pending = 0;
    for (unsigned i = 0; i < ARRAY_SIZE(tcg_ctx->boxdroid_lookup_shared); i++) {
      assert(!tcg_ctx->boxdroid_lookup_shared[i]);
      pending += tcg_ctx->boxdroid_lookup_pending[i] != NULL;
    }
    assert(pending > 0);
    memcpy(tcg_ctx->boxdroid_lookup_shared, saved, sizeof(saved));
    memset(tcg_ctx->boxdroid_lookup_pending, 0, sizeof(saved));
    *env = *initial;
    puts("discarded duplicate TB: shared-code publication rollback PASS");
  }
#endif
  puts("actual indirect full-state/flags/breakpoint/SMC/flush/CS/mode checks PASS");
}
#endif

#ifdef BOXDROID_TCG_INLINE_FMUL_TEST
/* The x86 epilogue hook assumes an active private decoder context. The test
 * binary wraps it only for the synthetic IR builder, which has no x87 cache.
 * Every ordinary x86 translation still invokes the real production hook. */
extern void __real_gen_bb_epilogue(void);
void __wrap_gen_bb_epilogue(void);
void __wrap_gen_bb_epilogue(void) {
  if (tcg_ctx->disas_ctx)
    __real_gen_bb_epilogue();
}
/* Test-only IR construction forces more live I64 temporaries than the callee
 * register set can hold. Production translation remains the x86 translator. */
static void pressure_init(DisasContextBase *db, CPUState *cpu) {
  (void)cpu;
  db->max_insns = 1;
}
static void pressure_start(DisasContextBase *db, CPUState *cpu) {
  (void)db; (void)cpu;
}
static void pressure_insn(DisasContextBase *db, CPUState *cpu) {
  (void)cpu;
  tcg_gen_insn_start(db->pc_next, CC_OP_EFLAGS);
}
static void pressure_body(DisasContextBase *db, CPUState *cpu) {
  (void)cpu;
  TCGv_i64 values[16];
  TCGv_ptr dst = tcg_temp_new_ptr(), src = tcg_temp_new_ptr();
  for (unsigned i = 0; i < 16; i++) {
    values[i] = tcg_temp_new_i64();
    tcg_gen_ld_i64(values[i], tcg_env, offsetof(CPUX86State, xmm_regs) + i * 8);
    tcg_gen_xori_i64(values[i], values[i], UINT64_C(0x9abcdef012345678) ^ i);
  }
  tcg_gen_addi_ptr(dst, tcg_env, offsetof(CPUX86State, fpregs[0]));
  tcg_gen_addi_ptr(src, tcg_env, offsetof(CPUX86State, fpregs[1]));
  if (tcg_ctx->boxdroid_fmul_shared_requested)
    gen_helper_boxdroid_fmul53(tcg_env, dst, src);
  else
    gen_helper_boxdroid_fmul(tcg_env, dst, src);
  for (unsigned i = 0; i < 16; i++) {
    tcg_gen_st_i64(values[i], tcg_env, offsetof(CPUX86State, xmm_regs) + i * 8);
  }
  db->pc_next++;
  tcg_gen_st_i32(tcg_constant_i32(db->pc_next), tcg_env,
                 offsetof(CPUX86State, eip));
  db->is_jmp = DISAS_TOO_MANY;
}
static void pressure_stop(DisasContextBase *db, CPUState *cpu) {
  (void)db; (void)cpu;
  tcg_gen_exit_tb(NULL, 0);
}
static const TranslatorOps pressure_translator = {
    .init_disas_context = pressure_init, .tb_start = pressure_start,
    .insn_start = pressure_insn, .translate_insn = pressure_body,
    .tb_stop = pressure_stop};
static void pressure_translate(CPUState *cpu, TranslationBlock *tb,
                               int *max_insns, vaddr pc, void *host_pc) {
  DisasContextBase db;
  translator_loop(cpu, tb, max_insns, pc, host_pc, &pressure_translator, &db);
}
static uint64_t test_pressure_wrapper(CPUState *cpu, const CPUX86State *initial) {
  extern uint64_t boxdroid_fmul53_slow_calls;
  CPUX86State *env = cpu_env(cpu);
  const TCGCPUOps *original = cpu->cc->tcg_ops;
  TCGCPUOps pressure_ops = *original;
  pressure_ops.translate_code = pressure_translate;
  uint64_t before = boxdroid_fmul53_slow_calls;
  const uint8_t nop = 0x90;
  assert(address_space_write(&address_space_memory, 0x16000,
      MEMTXATTRS_UNSPECIFIED, &nop, 1) == MEMTX_OK);
  for (unsigned mode = 0; mode < 2; mode++) {
    *env = *initial;
    env->eip = 0x16000;
    helper_fldcw(env, mode ? 0x33f : 0x23f);
    env->fpus = 0x20;
    set_float_exception_flags(float_flag_inexact, &env->fp_status);
    env->fp_status.boxdroid_fast_fpu_state = 1;
    env->fp_status.boxdroid_fast_fpu_checks = 2;
    env->fpregs[0].d = (floatx80){.low = UINT64_C(0x8123456789abc800), .high = 0x3fff};
    env->fpregs[1].d = (floatx80){.low = UINT64_C(0xe123456789abc800), .high = 0xbfff};
    uint64_t *input = (void *)env->xmm_regs;
    for (unsigned i = 0; i < 16; i++)
      input[i] = ((uint64_t)random_word() << 32) | random_word();
    CPUX86State expected = *env;
    helper_boxdroid_fmul(&expected, &expected.fpregs[0], &expected.fpregs[1]);
    uint64_t *output = (void *)expected.xmm_regs;
    for (unsigned i = 0; i < 16; i++)
      output[i] ^= UINT64_C(0x9abcdef012345678) ^ i;
    expected.eip++;
    cpu->cc->tcg_ops = &pressure_ops;
    block(cpu, 1);
    cpu->cc->tcg_ops = original;
    expected.cc_op = env->cc_op;
    expected.cc_src = env->cc_src;
    expected.cc_src2 = env->cc_src2;
    expected.cc_dst = env->cc_dst;
    assert(cpu->exception_index == -1 && !memcmp(env, &expected, sizeof(*env)));
    tb_flush__exclusive_or_serial();
  }
  *env = *initial;
  return boxdroid_fmul53_slow_calls - before;
}
#endif

static CPUX86State *io_env;
static unsigned io_reads;
static bool io_gp_check, io_sse_check, io_watch_install, io_remap, io_resize;
static unsigned io_resize_count;
static CPUState *io_cpu;
static CPUWatchpoint *io_watchpoint;
static uint8_t *io_ram;
static ZMMReg io_xmm_before[CPU_NB_REGS];
static const uint8_t io_payload[16] = {0xef, 0xcd, 0xab, 0x89, 0x67, 0x45,
                                       0x23, 0x01, 0x10, 0x32, 0x54, 0x76,
                                       0x98, 0xba, 0xdc, 0xfe};
static uint64_t io_read(void *opaque, hwaddr addr, unsigned size) {
  if (io_resize) {
    unsigned mmu = io_cpu->cc->tcg_ops->mmu_index(io_cpu, false);
    CPUTLBDescFast *fast = cpu_tlb_fast(io_cpu, mmu);
    uintptr_t old_mask = fast->mask;
    /* Force the existing CPU-owned adaptive resize using its public flush
     * path, after the first RAM access has populated the old descriptor. */
    io_cpu->neg.tlb.d[mmu].window_max_entries =
        (old_mask >> CPU_TLB_ENTRY_BITS) + 1;
    tlb_flush_by_mmuidx(io_cpu, 1U << mmu);
    assert(fast->mask != old_mask);
    io_resize_count++;
  } else if (io_watch_install || io_remap) {
    assert(io_env->regs[R_EAX] == 1 && io_env->regs[R_EDX] == 2 &&
           io_env->regs[R_EBX] == 3 && io_env->regs[R_ECX] == 4);
    if (io_watch_install) {
      assert(cpu_watchpoint_insert(io_cpu, 0x40020, 4,
                                   BP_MEM_READ | BP_GDB | BP_STOP_BEFORE_ACCESS,
                                   &io_watchpoint) == 0);
    } else {
      ((uint32_t *)(io_ram + 0x2000))[64] = 0x50003;
      tlb_flush_page(io_cpu, 0x40000);
    }
  } else if (io_sse_check) {
    assert(!memcmp(io_env->xmm_regs, io_xmm_before, sizeof(io_xmm_before)));
  } else if (io_gp_check) {
    assert(io_env->regs[R_EAX] == 0x12345 &&
           io_env->regs[R_EDX] == 0xcafebabe && io_env->regs[R_EDI] == 7);
  } else {
    assert(io_env->fpstt == 0);
    for (int i = 0; i < 8; i++)
      assert(io_env->fptags[i] == 0);
  }
  io_reads++;
  uint64_t result = 0;
  assert(size <= 8 && addr + size <= sizeof(io_payload));
  for (unsigned i = 0; i < size; i++) {
    result |= (uint64_t)io_payload[addr + i] << (i * 8);
  }
  return result;
}
static const MemoryRegionOps io_ops = {
    .read = io_read,
    .endianness = DEVICE_LITTLE_ENDIAN,
    .valid = {.min_access_size = 1, .max_access_size = 8},
    .impl = {.min_access_size = 1, .max_access_size = 8}};

#ifdef BOXDROID_TCG_FLAT_TLB_TEST
extern uint64_t boxdroid_flat_tlb_fast_hits;
static void test_flat_tlb_lifetime(CPUState *cpu, const CPUX86State *initial) {
  CPUX86State *env = cpu_env(cpu);
  *env = *initial;
  tlb_flush(cpu);
  const vaddr page = 0x5a000;
  uint8_t read_code[] = {0x8b, 0x01}; /* mov eax,[ecx] */
  uint8_t write_code[] = {0x89, 0x01}; /* mov [ecx],eax */
  uint8_t *mem = memory_region_get_ram_ptr(&ram);
  *(uint32_t *)(mem + page) = 0x10203040;
  assert(address_space_write(&address_space_memory, 0x10000,
      MEMTXATTRS_UNSPECIFIED, read_code, sizeof(read_code)) == MEMTX_OK);
  for (unsigned i = 0; i < 4; i++) {
    env->eip = 0x10000; env->regs[R_ECX] = page;
    step(cpu);
    assert(cpu->exception_index == -1 && env->regs[R_EAX] == 0x10203040);
  }
  int idx = cpu->cc->tcg_ops->mmu_index(cpu, false);
  CPUTLBDescFast *fast = cpu_tlb_fast(cpu, idx);
  if (!fast->boxdroid_flat_read) {
    puts("direct-index RAM disabled/allocation fallback: old TLB path PASS");
    return;
  }
  assert(fast->boxdroid_flat_read[page >> 12] == (uintptr_t)mem);
  assert(boxdroid_flat_tlb_fast_hits > 0);
  tlb_flush_page(cpu, page);
  assert(fast->boxdroid_flat_read[page >> 12] == 1);
  env->eip = 0x10000; env->regs[R_ECX] = page;
  step(cpu);
  assert(cpu->exception_index == -1 && env->regs[R_EAX] == 0x10203040);
  assert(fast->boxdroid_flat_read[page >> 12] == (uintptr_t)mem);
  tlb_flush_range_by_mmuidx(cpu, page, 4096, 1u << idx, 32);
  assert(fast->boxdroid_flat_read[page >> 12] == 1);
  env->eip = 0x10000; step(cpu);
  assert(cpu->exception_index == -1 && env->regs[R_EAX] == 0x10203040);

  assert(address_space_write(&address_space_memory, 0x10000,
      MEMTXATTRS_UNSPECIFIED, write_code, sizeof(write_code)) == MEMTX_OK);
  for (unsigned i = 0; i < 4; i++) {
    env->eip = 0x10000; env->regs[R_EAX] = 0x50607080;
    step(cpu);
    assert(cpu->exception_index == -1 && *(uint32_t *)(mem + page) == 0x50607080);
  }
  assert(fast->boxdroid_flat_write[page >> 12] == (uintptr_t)mem);
  tlb_reset_dirty(cpu, (uintptr_t)mem + page, 4096);
  assert(fast->boxdroid_flat_write[page >> 12] == 1);
  env->eip = 0x10000; env->regs[R_EAX] = 0x90a0b0c0;
  step(cpu);
  assert(cpu->exception_index == -1 && *(uint32_t *)(mem + page) == 0x90a0b0c0);

  vaddr stride = ((fast->mask >> CPU_TLB_ENTRY_BITS) + 1) * 4096;
  vaddr aliases[CPU_VTLB_SIZE + 2];
  for (unsigned i = 0; i < ARRAY_SIZE(aliases); i++) {
    aliases[i] = page + (i + 1) * stride;
    assert(aliases[i] <= UINT32_MAX);
    tlb_set_page(cpu, aliases[i], page, PAGE_READ | PAGE_WRITE, idx, 4096);
  }
  assert(fast->boxdroid_flat_read[page >> 12] == 1);
  tlb_flush(cpu);
  for (unsigned i = 0; i < ARRAY_SIZE(aliases); i++) {
    assert(fast->boxdroid_flat_read[aliases[i] >> 12] == 1);
    assert(fast->boxdroid_flat_write[aliases[i] >> 12] == 1);
  }
  *env = *initial;
  printf("direct-index RAM actual hits=%" PRIu64
         ", page/range/full/dirty/victim lifetime PASS\n", boxdroid_flat_tlb_fast_hits);
}
#endif

#if defined(BOXDROID_TCG_BRANCH_REGIONS_TEST) && defined(BOXDROID_TCG_INLINE_LOOKUP_TEST)
extern uint64_t boxdroid_branch_fallthroughs;
static void compare_branch_state(CPUX86State *expected, CPUX86State *actual) {
  /* Lazy-CC bookkeeping is internal. Compare complete architectural EFLAGS
   * before matching its internal representation for the full-state check. */
  assert(cpu_compute_eflags(expected) == cpu_compute_eflags(actual));
  expected->cc_op = actual->cc_op;
  expected->cc_src = actual->cc_src;
  expected->cc_src2 = actual->cc_src2;
  expected->cc_dst = actual->cc_dst;
  /* QEMU records this pre-recovery scratch value for every exception, but
   * consumes it only for software INT. A #PF uses the recovered fault EIP. */
  if (!expected->exception_is_int && !actual->exception_is_int)
    expected->exception_next_eip = actual->exception_next_eip;
  match_fp_diagnostics(expected, actual);
  if (memcmp(expected, actual, sizeof(*actual))) {
    fprintf(stderr, "offsets: error=%zu int=%zu next=%zu old=%zu ret=%zu; eip=%x/%x\n",
            offsetof(CPUX86State, error_code), offsetof(CPUX86State, exception_is_int),
            offsetof(CPUX86State, exception_next_eip), offsetof(CPUX86State, old_exception),
            offsetof(CPUX86State, retaddr), expected->eip, actual->eip);
    for (unsigned i = 0; i < sizeof(*actual); i++) {
      if (((uint8_t *)expected)[i] != ((uint8_t *)actual)[i])
        fprintf(stderr, "branch state byte%u expected=%02x actual=%02x\n",
                i, ((uint8_t *)expected)[i], ((uint8_t *)actual)[i]);
    }
  }
  assert(!memcmp(expected, actual, sizeof(*actual)));
}
static void test_branch_regions(CPUState *cpu, const CPUX86State *initial) {
  CPUX86State *env = cpu_env(cpu);
  uint8_t *mem = memory_region_get_ram_ptr(&ram);
  uint64_t saved_data;
  memcpy(&saved_data, mem + 0x20000, sizeof(saved_data));
  uint64_t before = boxdroid_branch_fallthroughs;
  uint8_t code[] = {
      0x39, 0xc8, 0x70, 0,       /* cmp eax,ecx; Jcc end */
      0x83, 0xc0, 7, 0x89, 0x07,/* add eax,7; mov [edi],eax */
      0xd9, 0xe8, 0xd8, 0xc0,   /* fld1; fadd st0,st0 */
      0x83, 0xfb, 0, 0x74, 0,   /* cmp ebx,0; jz end */
      0x41, 0xd9, 0x5f, 4,      /* inc ecx; fstp [edi+4] */
      0x85, 0xd2, 0x75, 0,      /* test edx,edx; jnz end */
      0x83, 0xc6, 3, 0xf4};     /* add esi,3; hlt */
  code[3] = sizeof(code) - 1 - 4;
  code[17] = sizeof(code) - 1 - 18;
  code[25] = sizeof(code) - 1 - 26;
  unsigned cases = 0;
  for (unsigned revision = 0; revision < 2; revision++) {
    code[6] = 7 + revision;
    for (unsigned condition = 0; condition < 16; condition++) {
      code[2] = 0x70 | condition;
      assert(address_space_write(&address_space_memory, 0x16000,
          MEMTXATTRS_UNSPECIFIED, code, sizeof(code)) == MEMTX_OK);
      for (unsigned n = 0; n < 64; n++) {
        *env = *initial;
        env->eip = 0x16000;
        env->regs[R_EAX] = n < 8 ? (1u << (n * 4)) - 1 : random_word();
        env->regs[R_ECX] = n < 8 ? env->regs[R_EAX] ^ (n & 1) : random_word();
        env->regs[R_EBX] = n & 2;
        env->regs[R_EDX] = n & 4;
        env->regs[R_ESI] = random_word();
        env->regs[R_EDI] = 0x20000;
        env->fpstt = n & 7;
        memset(env->fptags, 1, 8);
        helper_fldcw(env, 0x23f | ((n & 3) << 10));
        CPUX86State start = *env;
        memset(mem + 0x20000, 0x5a, 8);
        for (unsigned steps = 0; steps < 32; steps++) {
          step(cpu);
          if (cpu->exception_index >= 0) break;
        }
        assert(cpu->exception_index == EXCP_HLT);
        CPUX86State expected = *env;
        uint64_t expected_mem;
        memcpy(&expected_mem, mem + 0x20000, 8);
        *env = start;
        memset(mem + 0x20000, 0x5a, 8);
        assert(chained_exec(cpu) == EXCP_HLT);
        compare_branch_state(&expected, env);
        assert(!memcmp(mem + 0x20000, &expected_mem, 8));
        cases++;
      }
    }
    tlb_flush_page(cpu, 0x16000);
    tb_flush__exclusive_or_serial();
  }
  /* A software trap after a fused branch must still supply the exact INT
   * continuation EIP; unlike #PF, exception_next_eip is observable here. */
  uint8_t trap[] = {0x85, 0xc0, 0x74, 4, 0x83, 0xc3, 1, 0xcc, 0xf4};
  assert(address_space_write(&address_space_memory, 0x16000,
      MEMTXATTRS_UNSPECIFIED, trap, sizeof(trap)) == MEMTX_OK);
  *env = *initial; env->eip = 0x16000; env->regs[R_EAX] = 1;
  CPUX86State trap_start = *env;
  for (unsigned i = 0; i < 4; i++) step(cpu);
  assert(cpu->exception_index == EXCP03_INT3 && env->exception_is_int &&
         env->exception_next_eip == 0x16008);
  CPUX86State trap_expected = *env;
  *env = trap_start; block(cpu, 16);
  for (unsigned i = 0; cpu->exception_index < 0 && i < 4; i++) step(cpu);
  assert(cpu->exception_index == EXCP03_INT3 && env->exception_is_int &&
         env->exception_next_eip == 0x16008);
  compare_branch_state(&trap_expected, env);
  /* A guest write to a later instruction in the formed region must force
   * the normal precise SMC exit and execute the rewritten instruction. */
  uint8_t smc[] = {0x85, 0xc9, 0x74, 12, 0xc6, 0x05,
                  0x0c, 0x60, 0x01, 0, 0x42,
                  0xb8, 0x11, 0, 0, 0, 0xf4};
  for (unsigned pass = 0; pass < 2; pass++) {
    assert(address_space_write(&address_space_memory, 0x16000,
        MEMTXATTRS_UNSPECIFIED, smc, sizeof(smc)) == MEMTX_OK);
    *env = *initial; env->eip = 0x16000; env->regs[R_ECX] = 1;
    CPUX86State smc_start = *env;
    for (unsigned i = 0; i < 5; i++) step(cpu);
    assert(cpu->exception_index == EXCP_HLT && env->regs[R_EAX] == 0x42);
    CPUX86State smc_expected = *env;
    assert(address_space_write(&address_space_memory, 0x16000,
        MEMTXATTRS_UNSPECIFIED, smc, sizeof(smc)) == MEMTX_OK);
    *env = smc_start;
    assert(chained_exec(cpu) == EXCP_HLT && env->regs[R_EAX] == 0x42);
    compare_branch_state(&smc_expected, env);
  }
  /* A fault in the extended fallthrough must retain the prior write and
   * attribute #PF to the load, not to the preceding conditional branch. */
  uint8_t fault_code[] = {0x39, 0xc8, 0x74, 4, 0x89, 0x07,
                         0x8b, 0x06, 0xf4};
  assert(address_space_write(&address_space_memory, 0x16000,
      MEMTXATTRS_UNSPECIFIED, fault_code, sizeof(fault_code)) == MEMTX_OK);
  uint32_t *pd = (void *)(mem + 0x1000), *pt = (void *)(mem + 0x2000);
  memset(pd, 0, 4096); memset(pt, 0, 4096);
  pd[0] = 0x2003; pt[0x16] = 0x16003; pt[0x20] = 0x20003;
  *env = *initial;
  env->eip = 0x16000; env->regs[R_EAX] = 0x12345;
  env->regs[R_ECX] = 0; env->regs[R_EDI] = 0x20000;
  env->regs[R_ESI] = 0x70000;
  cpu_x86_update_cr3(env, 0x1000);
  cpu_x86_update_cr0(env, CR0_PE_MASK | CR0_PG_MASK);
  CPUX86State fault_start = *env;
  for (unsigned i = 0; i < 4; i++) step(cpu);
  assert(cpu->exception_index == EXCP0E_PAGE && env->eip == 0x16006);
  CPUX86State fault_expected = *env;
  *env = fault_start; tlb_flush(cpu); memset(mem + 0x20000, 0, 4);
  block(cpu, 16);
  for (unsigned i = 0; cpu->exception_index < 0 && i < 4; i++) step(cpu);
  assert(cpu->exception_index == EXCP0E_PAGE && env->eip == 0x16006);
  compare_branch_state(&fault_expected, env);
  assert(*(uint32_t *)(mem + 0x20000) == 0x12345);
  *env = *initial; tlb_flush(cpu);
  /* Extended-region MMIO must observe committed GPRs and must execute its
   * callback exactly once, including an I/O recompile/restart if required. */
  MemoryRegion region_io;
  memory_region_init_io(&region_io, NULL, &io_ops, NULL, "region-io", 16);
  memory_region_add_subregion_overlap(get_system_memory(), 0x30000, &region_io, 1);
  uint8_t mmio[] = {0x31, 0xc0, 0x75, 17,
                   0xb8, 0x45, 0x23, 1, 0,
                   0xba, 0xbe, 0xba, 0xfe, 0xca,
                   0xbf, 7, 0, 0, 0, 0x8b, 0x0b, 0xf4};
  assert(address_space_write(&address_space_memory, 0x16000,
      MEMTXATTRS_UNSPECIFIED, mmio, sizeof(mmio)) == MEMTX_OK);
  env->eip = 0x16000; env->regs[R_EBX] = 0x30000;
  CPUX86State mmio_start = *env;
  io_env = env; io_gp_check = true; io_reads = 0; tlb_flush(cpu);
  for (unsigned i = 0; i < 7; i++) step(cpu);
  assert(cpu->exception_index == EXCP_HLT && io_reads == 1);
  CPUX86State mmio_expected = *env;
  *env = mmio_start; io_reads = 0; tlb_flush(cpu);
  block(cpu, 16);
  for (unsigned i = 0; cpu->exception_index < 0 && i < 7; i++) step(cpu);
  assert(cpu->exception_index == EXCP_HLT && io_reads == 1);
  compare_branch_state(&mmio_expected, env);
  io_gp_check = false;
  memory_region_del_subregion(get_system_memory(), &region_io);
  memory_region_destroy(&region_io);
  *env = *initial; tlb_flush(cpu);
  /* A continuously executing formed region must recognize a requested
   * interrupt and preserve the ordering of its published RAM writes. */
  uint8_t loop[] = {0x40, 0x85, 0xc0, 0x74, 7, 0x89, 0x07,
                    0x89, 0x47, 4, 0xeb, 0xf4, 0xf4};
  assert(address_space_write(&address_space_memory, 0x16000,
      MEMTXATTRS_UNSPECIFIED, loop, sizeof(loop)) == MEMTX_OK);
  env->eip = 0x16000; env->regs[R_EAX] = 0;
  env->regs[R_EDI] = 0x20000;
  memset(mem + 0x20000, 0, 8);
  LookupObserver observer = {.values = (void *)(mem + 0x20000),
                            .cpu = cpu, .inject_interrupt = true};
  QemuThread thread;
  qemu_thread_create(&thread, "region-observer", lookup_observer, &observer,
                     QEMU_THREAD_JOINABLE);
  while (!qatomic_load_acquire(&observer.ready)) g_usleep(10);
  assert(chained_exec(cpu) == EXCP_DEBUG);
  qatomic_set(&observer.stop, true); qemu_thread_join(&thread);
  assert(observer.samples > 0 && observer.violations == 0);
  if (tcg_ctx->boxdroid_branch_fallthrough_requested)
    assert(boxdroid_branch_fallthroughs > before);
  printf("forward branch regions: %u full-state/flags/x87/memory cases, "
         "precise #PF, SMC/flush and interrupt visibility PASS; formed=%" PRIu64 "\n",
         cases, boxdroid_branch_fallthroughs - before);
  *env = *initial; cpu->halted = false; cpu->exception_index = -1;
  qatomic_set(&cpu->interrupt_request, 0); qatomic_set(&cpu->exit_request, 0);
  io_reads = 0;
  memcpy(mem + 0x20000, &saved_data, sizeof(saved_data));
  tlb_flush(cpu); tb_flush__exclusive_or_serial();
}
#endif

static void test_on_cpu(CPUState *cpu, run_on_cpu_data unused) {
  (void)unused;
  assert(cpu == current_cpu && cpu->stopped && !cpu->running && bql_locked());
  CPUX86State *env = cpu_env(cpu);
  uint8_t *mem = memory_region_get_ram_ptr(&ram);
  /* movq mm0,[eax]; movq mm1,mm0; emms */
  uint8_t code[] = {0x0f, 0x6f, 0x00, 0x0f, 0x6f, 0xc8, 0x0f, 0x77};
  memcpy(mem + 0x10000, code, sizeof(code));
  env->cr[0] = CR0_PE_MASK;
  cpu_x86_load_seg_cache(env, R_CS, 8, 0, UINT32_MAX,
                         DESC_P_MASK | DESC_S_MASK | DESC_CS_MASK |
                             DESC_R_MASK | DESC_B_MASK);
  cpu_x86_load_seg_cache(env, R_DS, 16, 0, UINT32_MAX,
                         DESC_P_MASK | DESC_S_MASK | DESC_W_MASK | DESC_B_MASK);
  cpu_x86_load_seg_cache(env, R_SS, 16, 0, UINT32_MAX,
                         DESC_P_MASK | DESC_S_MASK | DESC_W_MASK | DESC_B_MASK);
  env->hflags |= HF_PE_MASK | HF_CS32_MASK | HF_SS32_MASK;
  env->hflags &= ~(HF_TS_MASK | HF_EM_MASK);
  env->regs[R_EAX] = 0x20000;
  uint64_t value = UINT64_C(0x8123456789abcdef);
  memcpy(mem + 0x20000, &value, 8);
  env->eip = 0x10000;
  env->fpstt = 5;
  memset(env->fptags, 1, 8);
  cpu->neg.icount_decr.u32 = 0;
  cpu->exception_index = -1;
  cpu_exec_step_atomic(cpu);
  fprintf(stderr, "after step eip=%x fpstt=%u exception=%d hflags=%x cr0=%x\n",
          env->eip, env->fpstt, cpu->exception_index, env->hflags, env->cr[0]);
  assert(env->eip == 0x10003 && env->fpstt == 0);
  for (int i = 0; i < 8; i++)
    assert(env->fptags[i] == 0);
  assert(env->fpregs[0].mmx.MMX_Q(0) == value);
  cpu_exec_step_atomic(cpu);
  assert(env->eip == 0x10006 && env->fpregs[1].mmx.MMX_Q(0) == value);
  cpu_exec_step_atomic(cpu);
  assert(env->eip == 0x10008);
  for (int i = 0; i < 8; i++)
    assert(env->fptags[i] == 1);
  puts("actual TCG MMX load/register/EMMS execution PASS");
#ifdef BOXDROID_TCG_STATE_RECOVERY_TEST
  printf("deferred globals active=%d preserved callers=%d\n",
         tcg_ctx->boxdroid_defer_globals, tcg_ctx->boxdroid_mem_preserve_regs);
#endif
  CPUX86State initial = *env;
#if defined(BOXDROID_TCG_BRANCH_REGIONS_TEST) && defined(BOXDROID_TCG_INLINE_LOOKUP_TEST)
  test_branch_regions(cpu, &initial);
#endif
#ifdef BOXDROID_TCG_JMP_CACHE_TEST
  uint32_t cache_a = 0x10000, cache_b = 0;
  unsigned cache_hash = tb_jmp_cache_hash_func(cache_a);
  for (uint32_t candidate = cache_a + 8; candidate < cache_a + 4096;
       candidate++)
    if (tb_jmp_cache_hash_func(candidate) == cache_hash) {
      cache_b = candidate;
      break;
    }
  assert(cache_b);
  uint8_t cache_code_a[] = {0x40};
  uint8_t cache_code_b[] = {0x83, 0xc0, 7};
  assert(address_space_write(&address_space_memory, cache_a,
                             MEMTXATTRS_UNSPECIFIED, cache_code_a,
                             sizeof(cache_code_a)) == MEMTX_OK);
  assert(address_space_write(&address_space_memory, cache_b,
                             MEMTXATTRS_UNSPECIFIED, cache_code_b,
                             sizeof(cache_code_b)) == MEMTX_OK);
  for (unsigned target = 0; target < 2; target++)
    for (unsigned pass = 0; pass < 2; pass++) {
      *env = initial;
      env->eip = target ? cache_b : cache_a;
      env->regs[R_EAX] = 0;
      step(cpu);
      assert(cpu->exception_index == -1 &&
             env->regs[R_EAX] == (target ? 7 : 1));
    }
  CPUJumpCache *jump_cache = cpu->tb_jmp_cache;
  assert(jump_cache->array[cache_hash].pc == cache_b);
  bool secondary_present = jump_cache->secondary[cache_hash].tb != NULL;
  if (secondary_present)
    assert(jump_cache->secondary[cache_hash].pc == cache_a);
  for (unsigned pass = 0; pass < 16; pass++) {
    *env = initial;
    env->eip = (pass & 1) ? cache_b : cache_a;
    env->regs[R_EAX] = 0;
    step(cpu);
    assert(cpu->exception_index == -1 &&
           env->regs[R_EAX] == ((pass & 1) ? 7 : 1));
  }
  cache_code_a[0] = 0x48;
  assert(address_space_write(&address_space_memory, cache_a,
                             MEMTXATTRS_UNSPECIFIED, cache_code_a,
                             1) == MEMTX_OK);
  assert(jump_cache->secondary[cache_hash].tb == NULL);
  *env = initial;
  env->eip = cache_a;
  env->regs[R_EAX] = 0;
  step(cpu);
  assert(cpu->exception_index == -1 && env->regs[R_EAX] == UINT32_MAX);
  *env = initial;
  env->eip = cache_a;
  env->regs[R_EAX] = 0;
  step(cpu);
  assert(cpu->exception_index == -1 && env->regs[R_EAX] == UINT32_MAX);
  tlb_flush_page(cpu, cache_a);
  unsigned cache_page_hash = tb_jmp_cache_hash_page(cache_a);
  for (unsigned i = 0; i < TB_JMP_PAGE_SIZE; i++)
    assert(!jump_cache->array[cache_page_hash + i].tb &&
           !jump_cache->secondary[cache_page_hash + i].tb);
  tb_flush__exclusive_or_serial();
  for (unsigned i = 0; i < TB_JMP_CACHE_SIZE; i++)
    assert(!jump_cache->array[i].tb && !jump_cache->secondary[i].tb);
  printf("actual jump cache collision/SMC/page/full invalidation PASS, "
         "secondary active=%d\n",
         secondary_present);
  *env = initial;
#endif
#ifdef BOXDROID_TCG_INLINE_LOOKUP_TEST
  test_inline_lookup(cpu, &initial);
  test_code_aliases(cpu, &initial);
  test_lookup_visibility(cpu, &initial);
  test_vector_visibility(cpu, &initial);
#endif
  unsigned cases = 0;
  for (unsigned top = 0; top < 8; top++) {
    for (unsigned dest = 0; dest < 8; dest++) {
      for (unsigned n = 0; n < 32; n++) {
        *env = initial;
        env->eip = 0x10000;
        env->fpstt = top;
        env->fpus = random_word();
        env->fpuc = random_word();
        for (int i = 0; i < 8; i++) {
          env->fptags[i] = random_word() & 1;
          env->fpregs[i].d.low =
              ((uint64_t)random_word() << 32) | random_word();
          env->fpregs[i].d.high = random_word();
        }
        CPUX86State expected = *env;
        helper_enter_mmx(&expected);
        expected.eip = 0x10003;
        expected.fpregs[dest].mmx.MMX_Q(0) = value;
        uint8_t insn[] = {0x0f, 0x6f, (uint8_t)(dest << 3)};
        assert(address_space_write(&address_space_memory, 0x10000,
                                   MEMTXATTRS_UNSPECIFIED, insn,
                                   3) == MEMTX_OK);
        step(cpu);
        if (memcmp(env, &expected, sizeof(*env))) {
          fprintf(
              stderr,
              "MMX differential mismatch top=%u dest=%u case=%u exception=%d\n",
              top, dest, n, cpu->exception_index);
          for (size_t k = 0; k < sizeof(*env); k++)
            if (((uint8_t *)env)[k] != ((uint8_t *)&expected)[k])
              fprintf(stderr, "offset %zu actual=%x expected=%x\n", k,
                      ((uint8_t *)env)[k], ((uint8_t *)&expected)[k]);
          abort();
        }
        assert(cpu->exception_index == -1);
        cases++;
      }
    }
  }
  printf("MMX full-state comparisons: %u PASS\n", cases);
  unsigned x87_cases = 0;
  for (unsigned top = 0; top < 8; top++)
    for (unsigned index = 0; index < 8; index++) {
      for (unsigned kind = 0; kind < 3; kind++)
        for (unsigned n = 0; n < 32; n++) {
          *env = initial;
          env->eip = 0x10000;
          env->fpstt = top;
          env->fpus = random_word();
          env->fpuc = random_word();
          for (int i = 0; i < 8; i++) {
            env->fptags[i] = random_word() & 1;
            env->fpregs[i].d.low =
                ((uint64_t)random_word() << 32) | random_word();
            env->fpregs[i].d.high = random_word();
          }
          CPUX86State expected = *env;
          uint8_t insn[2];
          if (kind == 0) {
            insn[0] = 0xd9;
            insn[1] = 0xc0 | index;
            helper_fpush(&expected);
            helper_fmov_ST0_STN(&expected, (index + 1) & 7);
          } else {
            insn[0] = 0xdd;
            insn[1] = (kind == 1 ? 0xd0 : 0xd8) | index;
            helper_fmov_STN_ST0(&expected, index);
            if (kind == 2)
              helper_fpop(&expected);
          }
          expected.eip = 0x10002;
          expected.fpip = 0x10000;
          expected.fpcs = 8;
          assert(address_space_write(&address_space_memory, 0x10000,
                                     MEMTXATTRS_UNSPECIFIED, insn,
                                     2) == MEMTX_OK);
          step(cpu);
          if (memcmp(env, &expected, sizeof(*env))) {
            fprintf(stderr,
                    "x87 mismatch top=%u index=%u kind=%u exception=%d\n", top,
                    index, kind, cpu->exception_index);
            for (size_t k = 0; k < sizeof(*env); k++)
              if (((uint8_t *)env)[k] != ((uint8_t *)&expected)[k])
                fprintf(stderr, "offset %zu actual=%x expected=%x\n", k,
                        ((uint8_t *)env)[k], ((uint8_t *)&expected)[k]);
            abort();
          }
          assert(cpu->exception_index == -1);
          x87_cases++;
        }
    }
  printf("x87 stack/register full-state comparisons: %u PASS\n", x87_cases);
  static void (*const ops0[])(CPUX86State *) = {
      helper_fadd_ST0_FT0,  helper_fmul_ST0_FT0, helper_fsub_ST0_FT0,
      helper_fsubr_ST0_FT0, helper_fdiv_ST0_FT0, helper_fdivr_ST0_FT0};
  static void (*const opsn[])(CPUX86State *, int) = {
      helper_fadd_STN_ST0, helper_fmul_STN_ST0,  helper_fsubr_STN_ST0,
      helper_fsub_STN_ST0, helper_fdivr_STN_ST0, helper_fdiv_STN_ST0};
  static const unsigned groups[] = {0, 1, 4, 5, 6, 7};
  static const floatx80 values[] = {
      {.low = UINT64_C(0x8000000000000000), .high = 0x3fff},
      {.low = UINT64_C(0xc000000000000000), .high = 0x4000},
      {.low = UINT64_C(0x8000000100000000), .high = 0xbfff},
      {.low = UINT64_C(0xffffffffffffffff), .high = 0x3fff},
      {.low = 0, .high = 0},
      {.low = 0, .high = 0x8000},
      {.low = 1, .high = 0},
      {.low = UINT64_C(0x8000000000000000), .high = 1},
      {.low = UINT64_C(0x8000000000000000), .high = 0x7fff},
      {.low = UINT64_C(0xc123456789abcdef), .high = 0x7fff},
      {.low = UINT64_C(0x8123456789abcdef), .high = 0x7fff},
      {.low = 0x12345, .high = 0x3fff},
      {.low = UINT64_C(0xffffffffffffffff), .high = 0x7ffe},
      {.low = UINT64_C(0x8000000000000000), .high = 0x8000},
      {.low = UINT64_C(0xf123456789abcdef), .high = 0x41c1},
      {.low = UINT64_C(0x9123456789abcdef), .high = 0x3e3d}};
  unsigned arithmetic_cases = 0;
  for (unsigned top = 0; top < 8; top++)
    for (unsigned index = 0; index < 8; index++)
      for (unsigned pc = 0; pc < 3; pc++)
        for (unsigned rm = 0; rm < 4; rm++)
          for (unsigned n = 0; n < 16; n++)
            for (unsigned op = 0; op < 6; op++)
              for (unsigned destn = 0; destn < 2; destn++) {
                *env = initial;
                env->eip = 0x10000;
                env->fpstt = top;
                helper_fldcw(env, (pc == 0   ? 0
                                   : pc == 1 ? 0x200
                                             : 0x300) |
                                      (rm << 10) | (n & 1 ? 0x3f : 0));
                env->fpus = (n & 2) ? 0x20 : 0;
                set_float_exception_flags((n & 2) ? float_flag_inexact
                                                  : float_flag_invalid,
                                          &env->fp_status);
                env->fpregs[top].d = values[n];
                env->fpregs[(top + index) & 7].d = values[(n + index + 3) & 15];
                CPUX86State expected = *env;
                uint8_t insn[] = {destn ? 0xdc : 0xd8,
                                  (uint8_t)(0xc0 | (groups[op] << 3) | index)};
                if (destn)
                  opsn[op](&expected, index);
                else {
                  helper_fmov_FT0_STN(&expected, index);
                  ops0[op](&expected);
                }
                expected.eip = 0x10002;
                expected.fpip = 0x10000;
                expected.fpcs = 8;
                assert(address_space_write(&address_space_memory, 0x10000,
                                           MEMTXATTRS_UNSPECIFIED, insn,
                                           2) == MEMTX_OK);
                step(cpu);
                if (memcmp(env, &expected, sizeof(*env))) {
                  fprintf(stderr,
                          "arithmetic mismatch top=%u index=%u pc=%u rm=%u "
                          "n=%u op=%u destn=%u exception=%d\n",
                          top, index, pc, rm, n, op, destn,
                          cpu->exception_index);
                  for (size_t k = 0; k < sizeof(*env); k++)
                    if (((uint8_t *)env)[k] != ((uint8_t *)&expected)[k])
                      fprintf(stderr, "offset %zu actual=%x expected=%x\n", k,
                              ((uint8_t *)env)[k], ((uint8_t *)&expected)[k]);
                  abort();
                }
                assert(cpu->exception_index == -1);
                arithmetic_cases++;
              }
  printf("actual TCG arithmetic full-state differential: %u cases PASS\n",
         arithmetic_cases);
#ifdef BOXDROID_TCG_INLINE_FMUL_TEST
  extern uint64_t boxdroid_inline_fmul_hits;
  uint64_t multiply_before = boxdroid_inline_fmul_hits;
  unsigned direct_multiply_cases = 0;
  for (unsigned top = 0; top < 8; top++)
    for (unsigned index = 0; index < 8; index++)
      for (unsigned destn = 0; destn < 2; destn++)
        for (unsigned n = 0; n < 128; n++) {
          *env = initial;
          env->eip = 0x10000;
          env->fpstt = top;
          helper_fldcw(env, 0x23f);
          env->fpus = 0x20 | ((n & 7) << 8);
          set_float_exception_flags(float_flag_inexact | (n & 1 ?
              float_flag_invalid : 0), &env->fp_status);
          env->fp_status.boxdroid_fast_fpu_state = 1;
          env->fp_status.boxdroid_fast_fpu_checks =
              (uint32_t[]){0, 65536, UINT32_MAX, 2, 3, 4, 5, 6}[n & 7];
          for (unsigned slot = 0; slot < 8; slot++) {
            uint64_t low = ((uint64_t)random_word() << 32) | random_word();
            unsigned exponent = 15933 + random_word() % 901;
            if (n < 8)
              exponent = (unsigned[]){15932,15933,15934,16832,16833,16834,0,0x7fff}[n];
            env->fpregs[slot].d = (floatx80){
                .low = (low & ~UINT64_C(0x7ff)) | (UINT64_C(1) << 63),
                .high = exponent | ((random_word() & 1) << 15)};
            if (n == 8)
              env->fpregs[slot].d.low |= 1;
          }
          CPUX86State expected = *env;
          if (destn)
            helper_fmul_STN_ST0(&expected, index);
          else {
            helper_fmov_FT0_STN(&expected, index);
            helper_fmul_ST0_FT0(&expected);
          }
          expected.eip = 0x10002;
          expected.fpip = 0x10000;
          expected.fpcs = 8;
          uint8_t insn[] = {destn ? 0xdc : 0xd8, (uint8_t)(0xc8 | index)};
          assert(address_space_write(&address_space_memory, 0x10000,
              MEMTXATTRS_UNSPECIFIED, insn, sizeof(insn)) == MEMTX_OK);
          step(cpu);
          if (memcmp(env, &expected, sizeof(*env))) {
            fprintf(stderr, "inline FMUL mismatch top=%u index=%u destn=%u n=%u\n",
                top, index, destn, n);
            for (size_t k = 0; k < sizeof(*env); k++)
              if (((uint8_t *)env)[k] != ((uint8_t *)&expected)[k])
                fprintf(stderr, "offset=%zu actual=%x expected=%x\n", k,
                    ((uint8_t *)env)[k], ((uint8_t *)&expected)[k]);
            abort();
          }
          assert(cpu->exception_index == -1);
          direct_multiply_cases++;
        }
  uint64_t multiply_hits = boxdroid_inline_fmul_hits - multiply_before;
  printf("actual FMUL bits/full-state/flags/aliases/refresh: %u cases, "
         "%" PRIu64 " fast hits PASS\n", direct_multiply_cases, multiply_hits);
  if (tcg_ctx->boxdroid_fmul_shared_requested)
    assert(multiply_hits > 0);
  extern uint64_t boxdroid_fmul53_slow_calls;
  uint64_t saved_before = boxdroid_fmul53_slow_calls;
  unsigned resident_cases = 0;
  const unsigned live_registers[] = {0, 1, 2, 3, 5, 6, 7};
  for (unsigned trial = 0; trial < 256; trial++) {
    uint8_t sequence[128];
    unsigned length = 0;
    uint32_t inputs[7];
    for (unsigned i = 0; i < 7; i++) {
      inputs[i] = random_word();
      uint32_t address = 0x42000 + i * 4;
      sequence[length++] = 0x8b;
      sequence[length++] = 5 | (live_registers[i] << 3);
      memcpy(sequence + length, &address, 4);
      length += 4;
    }
    uint8_t middle[] = {0x83,0xc0,7, 0x83,0xc7,11, 0xd8,0xc9, 0x9c,0x5e};
    memcpy(sequence + length, middle, sizeof(middle));
    length += sizeof(middle);
    for (unsigned i = 0; i < 7; i++) {
      uint32_t address = 0x43000 + i * 4;
      sequence[length++] = 0x89;
      sequence[length++] = 5 | (live_registers[i] << 3);
      memcpy(sequence + length, &address, 4);
      length += 4;
    }
    *env = initial;
    env->eip = 0x10000;
    env->regs[R_ESP] = 0x4f000;
    helper_fldcw(env, trial & 1 ? 0x33f : 0x23f);
    env->fpus = 0x20;
    set_float_exception_flags(float_flag_inexact, &env->fp_status);
    env->fp_status.boxdroid_fast_fpu_state = 1;
    env->fp_status.boxdroid_fast_fpu_checks = 2;
    env->fpregs[env->fpstt].d = (floatx80){
        .low = UINT64_C(0x8123456789abc800), .high = 0x3fff};
    env->fpregs[(env->fpstt + 1) & 7].d = (floatx80){
        .low = UINT64_C(0xe123456789abc800), .high = 0xbfff};
    memcpy(mem + 0x42000, inputs, sizeof(inputs));
    memset(mem + 0x43000, 0, sizeof(inputs));
    assert(address_space_write(&address_space_memory, 0x10000,
        MEMTXATTRS_UNSPECIFIED, sequence, length) == MEMTX_OK);
    CPUX86State start = *env;
    for (unsigned i = 0; i < 19; i++)
      step(cpu);
    CPUX86State expected = *env;
    uint32_t outputs[7], pushed_flags;
    memcpy(outputs, mem + 0x43000, sizeof(outputs));
    memcpy(&pushed_flags, mem + 0x4effc, sizeof(pushed_flags));
    *env = start;
    memset(mem + 0x43000, 0, sizeof(outputs));
    memset(mem + 0x4effc, 0, sizeof(pushed_flags));
    block(cpu, 19);
    expected.cc_op = env->cc_op;
    expected.cc_src = env->cc_src;
    expected.cc_src2 = env->cc_src2;
    expected.cc_dst = env->cc_dst;
    assert(cpu->exception_index == -1 &&
           !memcmp(env, &expected, sizeof(*env)) &&
           !memcmp(outputs, mem + 0x43000, sizeof(outputs)) &&
           !memcmp(&pushed_flags, mem + 0x4effc, sizeof(pushed_flags)));
    resident_cases++;
  }
  uint64_t saved_calls = boxdroid_fmul53_slow_calls - saved_before;
  printf("actual inline FP live GPR/flags/stack/RAM common+fallback: %u blocks, "
         "%" PRIu64 " slow helper calls PASS\n", resident_cases, saved_calls);
  uint64_t pressured_calls = test_pressure_wrapper(cpu, &initial);
  printf("forced live-I64 pressure, full64 common/fallback preservation: %" PRIu64
         " slow helper calls PASS\n", pressured_calls);
  if (tcg_ctx->boxdroid_fmul_shared_requested && tcg_ctx->boxdroid_fp_preserve_requested)
    assert(pressured_calls > 0);
#endif
  /* GPR/flags and TOP must survive helpers while resident across a TB. */
  uint8_t mixed[] = {0xb8, 0x39, 0x30, 0,    0,    0x83, 0xc0, 7,    0xd9, 0xc1,
                     0xd8, 0xc2, 0x89, 0x01, 0xdd, 0xda, 0x83, 0xc0, 9};
  unsigned mixed_cases = 0;
  for (unsigned top = 0; top < 8; top++)
    for (unsigned n = 0; n < 64; n++) {
      *env = initial;
      env->eip = 0x10000;
      env->fpstt = top;
      env->regs[R_ECX] = 0x20000;
      for (int i = 0; i < 8; i++)
        env->fpregs[i].d = values[(n + i) & 15];
      assert(address_space_write(&address_space_memory, 0x10000,
                                 MEMTXATTRS_UNSPECIFIED, mixed,
                                 sizeof(mixed)) == MEMTX_OK);
      CPUX86State start = *env;
      for (int i = 0; i < 7; i++)
        step(cpu);
      CPUX86State expected = *env;
      uint32_t expected_mem;
      memcpy(&expected_mem, mem + 0x20000, 4);
      *env = start;
      memset(mem + 0x20000, 0, 4);
      block(cpu, 7);
      /* CC bookkeeping representation may differ; compare architectural flags.
       */
      expected.cc_src = env->cc_src;
      expected.cc_dst = env->cc_dst;
      expected.cc_src2 = env->cc_src2;
      expected.cc_op = env->cc_op;
      assert(!memcmp(env, &expected, sizeof(*env)));
      uint32_t actual_mem;
      memcpy(&actual_mem, mem + 0x20000, 4);
      assert(actual_mem == expected_mem && actual_mem == 12352);
      mixed_cases++;
    }
  printf("actual TCG mixed GPR/EFLAGS/x87 residency: %u multi-instruction "
         "cases PASS\n",
         mixed_cases);
  /* Mixed scalar memory and flags, including partial registers and crossing
   * pages. */
  unsigned memory_cases = 0;
#ifdef BOXDROID_TCG_READ_TLB_TEST
  unsigned cached_blocks = 0;
#endif
  for (unsigned trial = 0; trial < 512; trial++) {
    uint8_t seq[1024], original[8192], expected_ram[8192];
    unsigned len = 0, insns = 0;
    for (unsigned i = 0; i < sizeof(original); i++)
      original[i] = random_word();
    *env = initial;
    env->eip = 0x10000;
    env->regs[R_EBP] = 0x40000;
    env->regs[R_ESP] = 0x43000;
    for (unsigned j = 0; j < 6; j++)
      env->regs[(unsigned[]){0, 1, 2, 3, 6, 7}[j]] = random_word();
    for (unsigned n = 0; n < 64; n++) {
      unsigned reg = (unsigned[]){0, 1, 2, 3, 6, 7}[random_word() % 6];
      unsigned kind = random_word() % 8;
      uint32_t value = random_word();
      if (kind == 0) {
        seq[len++] = 0xb8 + reg;
        memcpy(seq + len, &value, 4);
        len += 4;
      } else if (kind == 1 || kind == 2) {
        seq[len++] = 0x83;
        seq[len++] = (kind == 1 ? 0xc0 : 0xd0) | reg;
        seq[len++] = value;
      } else if (kind == 3) {
        seq[len++] = 0x31;
        seq[len++] = 0xc0 | reg | (((reg + 1) & 3) << 3);
      } else {
        unsigned width = random_word() % 3;
        bool store = kind >= 6;
        if (width == 1)
          seq[len++] = 0x66;
        seq[len++] = width == 0 ? (store ? 0x88 : 0x8a) : (store ? 0x89 : 0x8b);
        seq[len++] = 0x85 | ((width == 0 ? reg & 3 : reg) << 3);
        uint32_t offset =
            (random_word() % 16 == 0) ? 4094 : random_word() % 8188;
        memcpy(seq + len, &offset, 4);
        len += 4;
      }
      insns++;
    }
    assert(address_space_write(&address_space_memory, 0x10000,
                               MEMTXATTRS_UNSPECIFIED, seq, len) == MEMTX_OK);
    memcpy(mem + 0x40000, original, sizeof(original));
    tlb_flush(cpu);
    CPUX86State start = *env;
    for (unsigned j = 0; j < insns; j++)
      step(cpu);
    assert(cpu->exception_index == -1);
    CPUX86State expected = *env;
    memcpy(expected_ram, mem + 0x40000, sizeof(expected_ram));
    *env = start;
    memcpy(mem + 0x40000, original, sizeof(original));
    tlb_flush(cpu);
    block(cpu, insns);
    expected.cc_src = env->cc_src;
    expected.cc_dst = env->cc_dst;
    expected.cc_src2 = env->cc_src2;
    expected.cc_op = env->cc_op;
    if (memcmp(env, &expected, sizeof(*env)) ||
        memcmp(mem + 0x40000, expected_ram, sizeof(expected_ram))) {
      fprintf(stderr,
              "scalar memory differential failed trial %u eip=%x expected=%x\n",
              trial, env->eip, expected.eip);
      for (unsigned j = 0; j < 8; j++)
        fprintf(stderr, "reg %u actual=%x expected=%x\n", j, env->regs[j],
                expected.regs[j]);
      fprintf(stderr, "eflags actual=%x expected=%x\n", env->eflags,
              expected.eflags);
      abort();
    }
#ifdef BOXDROID_TCG_READ_TLB_TEST
    cached_blocks += tcg_ctx->boxdroid_read_tlb_cache;
#endif
    memory_cases++;
  }
  printf("actual TCG scalar RAM/flags differential: %u blocks PASS\n",
         memory_cases);
#ifdef BOXDROID_TCG_READ_TLB_TEST
  printf("read-TLB cache exercised blocks: %u\n", cached_blocks);
#endif
  /* Regression: liveness at a REP back edge must discard obsolete residency. */
  uint8_t rep[] = {0xb8, 0xcc, 0xcc, 0xcc, 0xcc, 0xb9, 0x00, 0x18,
                   0,    0,    0xbf, 0,    0,    4,    0,    0x68,
                   0,    0,    0,    0xfd, 0xf3, 0xab};
  *env = initial;
  env->eip = 0x10000;
  env->regs[R_ESP] = 0x50000;
  env->regs[R_EDI] = 0xffdc;
  env->regs[R_ECX] = 0x244;
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, rep,
                             sizeof(rep)) == MEMTX_OK);
  memset(mem + 0x40000, 0, 0x6000);
  tlb_flush(cpu);
  block(cpu, 5);
  fprintf(stderr, "REP result edi=%x ecx=%x esp=%x eip=%x\n", env->regs[R_EDI],
          env->regs[R_ECX], env->regs[R_ESP], env->eip);
  assert(env->regs[R_EDI] == 0x46000 && env->regs[R_ECX] == 0 &&
         env->regs[R_ESP] == 0x4fffc && env->eip == 0x10016);
  for (unsigned n = 0; n < 0x6000; n++)
    assert(mem[0x40000 + n] == 0xcc);
  puts("actual TCG REP STOSD loop-state regression PASS");
  unsigned repeat_cases = 0;
  for (unsigned backwards = 0; backwards < 2; backwards++)
    for (unsigned opidx = 0; opidx < 6; opidx++)
      for (unsigned count = 0; count < 9; count++) {
        static const uint8_t ops[] = {0xa4, 0xa5, 0xaa, 0xab, 0xa6, 0xa7};
        uint8_t seq[] = {0xb8, 0xcc, 0xcc, 0xcc, 0xcc, 0xb9,
                         0,    0,    0,    0,    0xf3, 0};
        seq[6] = count;
        seq[11] = ops[opidx];
        uint8_t before[0x3000], after[0x3000];
        for (unsigned n = 0; n < sizeof(before); n++)
          before[n] = random_word();
        memcpy(before + 0x2000, before, 0x1000);
        *env = initial;
        env->eip = 0x10000;
        env->regs[R_ESI] = 0x42000 + (backwards ? 16 : 0);
        env->regs[R_EDI] = 0x40000 + (backwards ? 16 : 0);
        if (backwards)
          env->eflags |= DF_MASK;
        assert(address_space_write(&address_space_memory, 0x10000,
                                   MEMTXATTRS_UNSPECIFIED, seq,
                                   sizeof(seq)) == MEMTX_OK);
        memcpy(mem + 0x40000, before, sizeof(before));
        tlb_flush(cpu);
        CPUX86State start = *env;
        unsigned steps = 0;
        while (env->eip != 0x1000c && ++steps < 100)
          step(cpu);
        assert(env->eip == 0x1000c && cpu->exception_index == -1);
        CPUX86State expected = *env;
        memcpy(after, mem + 0x40000, sizeof(after));
        *env = start;
        memcpy(mem + 0x40000, before, sizeof(before));
        tlb_flush(cpu);
        block(cpu, 3);
        expected.cc_src = env->cc_src;
        expected.cc_dst = env->cc_dst;
        expected.cc_src2 = env->cc_src2;
        expected.cc_op = env->cc_op;
        assert(!memcmp(env, &expected, sizeof(*env)) &&
               !memcmp(mem + 0x40000, after, sizeof(after)));
        repeat_cases++;
      }
  printf("actual TCG REP MOVS/STOS/CMPS forward/backward differential: %u "
         "cases PASS\n",
         repeat_cases);
  unsigned sse_cases = 0;
  unsigned span_cases = 0, span_blocks = 0;
  for (unsigned trial = 0; trial < 256; trial++) {
    uint32_t base = 0x40100 + ((trial * 17) & 4095);
    uint8_t sequence[256];
    unsigned length = 0;
    static const unsigned regs[] = {R_EAX, R_ECX, R_EDX, R_EBX, R_EBP, R_EDI};
    for (unsigned n = 0; n < 32; n++) {
      unsigned width = (trial + n) % 3;
      unsigned reg = regs[n % ARRAY_SIZE(regs)];
      if (width == 1)
        sequence[length++] = 0x66;
      if (width == 0) {
        sequence[length++] = 0x0f;
        sequence[length++] = 0xb6;
      } else {
        sequence[length++] = 0x8b;
      }
      sequence[length++] = 0x46 | (reg << 3);
      sequence[length++] = (uint8_t)(n * 8 - 128);
    }
    *env = initial;
    env->eip = 0x10000;
    env->regs[R_ESI] = base;
    for (unsigned n = 0; n < 0x3000; n++)
      mem[0x40000 + n] = random_word();
    assert(address_space_write(&address_space_memory, 0x10000,
                               MEMTXATTRS_UNSPECIFIED, sequence,
                               length) == MEMTX_OK);
    tlb_flush(cpu);
    CPUX86State start = *env;
    for (unsigned n = 0; n < 32; n++)
      step(cpu);
    assert(cpu->exception_index == -1 && env->eip == 0x10000 + length);
    CPUX86State expected = *env;
    *env = start;
    /* Keep the ordinary-RAM TLB entries warm to exercise the guarded reuse. */
    block(cpu, 32);
#ifdef BOXDROID_TCG_SPAN_TEST
    span_blocks += tcg_ctx->boxdroid_span_active;
#endif
    assert(cpu->exception_index == -1 && !memcmp(env, &expected, sizeof(*env)));
    span_cases++;
  }
  printf("affine RAM reads, widths/page boundaries/full-state: %u cases PASS, "
         "%u selected blocks\n",
         span_cases, span_blocks);
  unsigned mulps_cases = 0;
  static const uint32_t sse_values[] = {
      0,          0x80000000, 1,          0x80000001, 0x007fffff, 0x807fffff,
      0x00800000, 0x80800000, 0x00800001, 0x80800001, 0x3f000000, 0xbf000000,
      0x3f800000, 0xbf800000, 0x3f800001, 0x3f7fffff, 0x3fc00000, 0x40000000,
      0x7f7fffff, 0xff7fffff, 0x7f800000, 0xff800000, 0x7fc00000, 0xffc00001,
      0x7f800001, 0xff800001, 0x00800002, 0x3f800002, 0x7f7ffffe, 0xff7ffffe,
      0x01000000, 0x3eaaaaab};
  for (unsigned trial = 0; trial < 65536; trial++) {
    *env = initial;
    cpu_set_mxcsr(env,
                  0x1f80 | ((trial & 3) << 13) | ((trial & 4) ? 0x0040 : 0) |
                      ((trial & 8) ? 0x8000 : 0) | ((trial & 16) ? 0x20 : 0));
    if (trial & 32)
      env->mxcsr &= ~(0x80 << ((trial >> 6) % 6));
    for (unsigned j = 0; j < 3; j++)
      for (unsigned k = 0; k < 16; k++) {
        unsigned pattern = (trial >> 9) % 3;
        uint32_t value = pattern == 0 ? sse_values[(trial + k + j * 7) % 32]
                         : pattern == 1
                             ? random_word()
                             : (random_word() & 0x807fffff) |
                                   ((120 + (random_word() % 16)) << 23);
        env->xmm_regs[j]._l_ZMMReg[k] = value;
      }
    unsigned d = 0, v = (trial >> 6) % 2, s = (trial >> 7) % 3;
    CPUX86State expected = *env;
    for (unsigned k = 0; k < 4; k++)
      expected.xmm_regs[d].ZMM_S(k) =
          float32_mul(expected.xmm_regs[v].ZMM_S(k),
                      expected.xmm_regs[s].ZMM_S(k), &expected.sse_status);
    helper_mulps_xmm(env, &env->xmm_regs[d], &env->xmm_regs[v],
                     &env->xmm_regs[s]);
    if (memcmp(env, &expected, sizeof(*env))) {
      fprintf(
          stderr,
          "MULPS scalar oracle mismatch trial=%u aliases=%u/%u/%u mxcsr=%x\n",
          trial, d, v, s, expected.mxcsr);
      abort();
    }
    mulps_cases++;
  }
  printf("packed MULPS original scalar oracle, bits/status/aliases: %u cases "
         "PASS\n",
         mulps_cases);
#ifdef BOXDROID_TCG_F32_ROUND_TEST
  extern bool boxdroid_f32_round_requested;
  extern uint64_t boxdroid_f32_round_fast_hits;
  static const uint64_t round_tails[] = {0, 1, (UINT64_C(1) << 39) - 1,
      UINT64_C(1) << 39, (UINT64_C(1) << 39) + 1,
      (UINT64_C(1) << 40) - 2, (UINT64_C(1) << 40) - 1};
  static const unsigned round_sigs[] = {0x800000, 0x800001, 0xfffffe, 0xffffff};
  unsigned rounded_cases = 0;
  for (unsigned pc = 0; pc < 3; pc++)
    for (unsigned rm = 0; rm < 4; rm++)
      for (unsigned sign = 0; sign < 2; sign++)
        for (unsigned exp = 1; exp <= 254; exp++)
          for (unsigned sig = 0; sig < ARRAY_SIZE(round_sigs); sig++)
            for (unsigned tail = 0; tail < ARRAY_SIZE(round_tails); tail++) {
              *env = initial;
              helper_fldcw(env, 0x40 | (random_word() & 0x3f) |
                  ((unsigned[]){0, 0x200, 0x300}[pc]) | (rm << 10));
              env->fpstt = 0;
              env->fpus = random_word() & ~(0x80 | 0x8000);
              set_float_exception_flags(random_word() & 0x1f, &env->fp_status);
              env->fpregs[0].d = (floatx80){
                .low = ((uint64_t)round_sigs[sig] << 40) | round_tails[tail],
                .high = (sign << 15) | (16256 + exp)};
              CPUX86State expected = *env;
              uint32_t reference = helper_fsts_ST0(&expected);
              uint32_t actual = helper_boxdroid_f32_store(env, &env->fpregs[0].d);
              match_fp_diagnostics(&expected, env);
              if (actual != reference || memcmp(env, &expected, sizeof(*env))) {
                fprintf(stderr, "normal F32 rounding mismatch pc=%u rm=%u sign=%u exp=%u sig=%u tail=%u actual=%08x expected=%08x\n",
                        pc, rm, sign, exp, sig, tail, actual, reference);
                abort();
              }
              rounded_cases++;
            }
  printf("normal F32 rounding all exponents/signs/PC/RM/ties/carry/status: %u cases PASS; fast=%" PRIu64 "\n",
         rounded_cases, boxdroid_f32_round_fast_hits);
  if (boxdroid_f32_round_requested)
    assert(boxdroid_f32_round_fast_hits > 0);
#endif
  unsigned f32_cases = 0;
#ifdef BOXDROID_TCG_FP_LOCAL_TEST
  for (unsigned n = 0; n < 32; n++) {
    *env = initial;
    uint64_t saved[7];
    boxdroid_test_helper_abi((uintptr_t)helper_boxdroid_f32_load, env,
                             &env->ft0, sse_values[n], saved);
    for (unsigned r = 9; r <= 15; r++)
      assert(saved[r - 9] == (UINT64_C(0x1234) << 32) + 0x9000 + r);
    boxdroid_test_helper_abi((uintptr_t)helper_boxdroid_f32_store, env,
                             &env->ft0, 0, saved);
    for (unsigned r = 9; r <= 15; r++)
      assert(saved[r - 9] == (UINT64_C(0x1234) << 32) + 0x9000 + r);
  }
#ifdef BOXDROID_TCG_INLINE_FMUL_TEST
  for (unsigned mode = 0; mode < 2; mode++) {
    *env = initial;
    helper_fldcw(env, mode ? 0x33f : 0x23f);
    env->fpus = 0x20;
    set_float_exception_flags(float_flag_inexact, &env->fp_status);
    env->fp_status.boxdroid_fast_fpu_state = 1;
    env->fp_status.boxdroid_fast_fpu_checks = 2;
    env->fpregs[0].d = (floatx80){.low=UINT64_C(0x8123456789abc800),.high=0x3fff};
    env->fpregs[1].d = (floatx80){.low=UINT64_C(0xe123456789abc800),.high=0xbfff};
    uint64_t saved[7];
    boxdroid_test_helper_abi((uintptr_t)helper_boxdroid_fmul53, env,
        &env->fpregs[0], (uintptr_t)&env->fpregs[1], saved);
    for (unsigned i = 0; i < 7; i++)
      assert(saved[i] == (UINT64_C(0x1234) << 32) + 0x9009 + i);
  }
  puts("shared FMUL ABI X9-X15 full64, common and conservative paths PASS");
#endif
  puts("actual helper ABI X9-X15 full64 preservation, normal/special paths "
       "PASS");
#endif
  for (unsigned top = 0; top < 8; top++)
    for (unsigned pc = 0; pc < 3; pc++)
      for (unsigned rm = 0; rm < 4; rm++)
        for (unsigned op = 0; op < 3; op++)
          for (unsigned n = 0; n < 32; n++) {
            *env = initial;
            env->eip = 0x10000;
            env->regs[R_ECX] = 0x40000;
            env->fpstt = top;
            helper_fldcw(env, 0x40 | (n & 0x3f) |
                                  ((unsigned[]){0, 0x200, 0x300}[pc]) |
                                  (rm << 10));
            env->fpus = random_word() & ~(0x80 | 0x8000);
            set_float_exception_flags(n & 0x1f, &env->fp_status);
            for (unsigned j = 0; j < 8; j++) {
              env->fpregs[j].d = values[(j + n) & 15];
              env->fptags[j] = random_word() & 1;
            }
            uint32_t word = sse_values[n];
            if (op == 2 && ((n + top + pc + rm) & 1)) {
              float_status seed = env->fp_status;
              env->fpregs[top].d = float32_to_floatx80(word, &seed);
            }
            memcpy(mem + 0x40000, &word, 4);
            CPUX86State expected = *env;
            if (op == 0)
              helper_flds_ST0(&expected, word);
            else if (op == 1) {
              helper_flds_FT0(&expected, word);
              helper_fmul_ST0_FT0(&expected);
            } else {
              word = helper_fsts_ST0(&expected);
            }
            expected.eip = 0x10002;
            expected.fpip = 0x10000;
            expected.fpcs = 8;
            expected.fpdp = 0x40000;
            expected.fpds = initial.segs[R_DS].selector;
            uint8_t opcode[] = {op == 1 ? 0xd8 : 0xd9,
                                (unsigned[]){0x01, 0x09, 0x11}[op]};
            assert(address_space_write(&address_space_memory, 0x10000,
                                       MEMTXATTRS_UNSPECIFIED, opcode,
                                       2) == MEMTX_OK);
            step(cpu);
            match_fp_diagnostics(&expected, env);
            if (memcmp(env, &expected, sizeof(*env))) {
              fprintf(stderr,
                      "x87 F32 operand oracle mismatch top=%u pc=%u rm=%u "
                      "op=%u n=%u exception=%d\n",
                      top, pc, rm, op, n, cpu->exception_index);
              for (size_t k = 0; k < sizeof(*env); k++)
                if (((uint8_t *)env)[k] != ((uint8_t *)&expected)[k])
                  fprintf(stderr, "offset %zu actual=%x expected=%x\n", k,
                          ((uint8_t *)env)[k], ((uint8_t *)&expected)[k]);
              abort();
            }
            assert(cpu->exception_index == -1);
            if (op == 2)
              assert(!memcmp(mem + 0x40000, &word, 4));
            f32_cases++;
          }
  printf("actual x87 F32 operands original-helper oracle, TOP/status/rounding: "
         "%u cases PASS\n",
         f32_cases);
  unsigned f32_blocks = 0, f32_span_blocks = 0;
  for (unsigned trial = 0; trial < 128; trial++) {
    uint8_t sequence[96] = {0xb8, 0x39, 0x30, 0, 0, 0x83, 0xc0, 7};
    unsigned length = 8;
    for (unsigned n = 0; n < 12; n++) {
      sequence[length++] = n < 8 ? 0xd9 : 0xd8;
      sequence[length++] = n < 8 ? 0x41 : 0x49;
      sequence[length++] = (n & 7) * 4;
    }
    sequence[length++] = 0xd9;
    sequence[length++] = 0x59;
    sequence[length++] = 32;
    sequence[length++] = 0x83;
    sequence[length++] = 0xc0;
    sequence[length++] = 9;
    *env = initial;
    env->eip = 0x10000;
    env->regs[R_ECX] = 0x40000;
    env->fpstt = trial & 7;
    helper_fldcw(env, 0x3f | ((trial & 3) << 10) |
                          ((unsigned[]){0, 0x200, 0x300}[trial % 3]));
    uint32_t payload[16];
    for (unsigned n = 0; n < 16; n++)
      payload[n] = sse_values[(trial + n) % 32];
    assert(address_space_write(&address_space_memory, 0x10000,
                               MEMTXATTRS_UNSPECIFIED, sequence,
                               length) == MEMTX_OK);
    memcpy(mem + 0x40000, payload, sizeof(payload));
    tlb_flush(cpu);
    CPUX86State start = *env;
    for (unsigned n = 0; n < 16; n++)
      step(cpu);
    assert(cpu->exception_index == -1 && env->eip == 0x10000 + length);
    CPUX86State expected = *env;
    uint32_t stored;
    memcpy(&stored, mem + 0x40020, 4);
    *env = start;
    memcpy(mem + 0x40000, payload, sizeof(payload));
    block(cpu, 16);
#ifdef BOXDROID_TCG_SPAN_TEST
    f32_span_blocks += tcg_ctx->boxdroid_span_active;
#endif
    expected.cc_src = env->cc_src;
    expected.cc_dst = env->cc_dst;
    expected.cc_src2 = env->cc_src2;
    expected.cc_op = env->cc_op;
    assert(cpu->exception_index == -1 &&
           !memcmp(env, &expected, sizeof(*env)) &&
           !memcmp(mem + 0x40020, &stored, 4));
    f32_blocks++;
  }
  printf("actual mixed GPR/F32 load/arithmetic/store blocks: %u cases PASS, %u "
         "selected spans\n",
         f32_blocks, f32_span_blocks);
  uint8_t sse[] = {0xb9, 0,    0,    4,    0,    0x0f, 0x10, 0x01, 0xb8,
                   0x45, 0x23, 1,    0,    0x83, 0xc0, 7,    0x0f, 0x59,
                   0xc1, 0xf3, 0x0f, 0x10, 0x51, 4,    0x0f, 0x58, 0xc2,
                   0xf3, 0x0f, 0x11, 0x41, 16,   0x0f, 0x11, 0x41, 32};
  for (unsigned trial = 0; trial < 128; trial++) {
    uint8_t before[64], after[64];
    for (unsigned n = 0; n < 64; n++)
      before[n] = random_word();
    *env = initial;
    env->eip = 0x10000;
    cpu_x86_update_cr4(env, env->cr[4] | CR4_OSFXSR_MASK);
    cpu_set_mxcsr(env, 0x1f80 | ((trial & 3) << 13) |
                           ((trial & 4) ? 0x0040 : 0) |
                           ((trial & 8) ? 0x8000 : 0));
    for (unsigned j = 0; j < 8; j++)
      for (unsigned k = 0; k < 4; k++)
        ((uint32_t *)&env->xmm_regs[j])[k] = random_word();
    assert(address_space_write(&address_space_memory, 0x10000,
                               MEMTXATTRS_UNSPECIFIED, sse,
                               sizeof(sse)) == MEMTX_OK);
    memcpy(mem + 0x40000, before, 64);
    tlb_flush(cpu);
    CPUX86State start = *env;
    for (unsigned j = 0; j < 9; j++)
      step(cpu);
    assert(cpu->exception_index == -1 && env->eip == 0x10000 + sizeof(sse));
    CPUX86State expected = *env;
    memcpy(after, mem + 0x40000, 64);
    *env = start;
    memcpy(mem + 0x40000, before, 64);
    tlb_flush(cpu);
    block(cpu, 9);
    expected.cc_src = env->cc_src;
    expected.cc_dst = env->cc_dst;
    expected.cc_src2 = env->cc_src2;
    expected.cc_op = env->cc_op;
    assert(!memcmp(env, &expected, sizeof(*env)) &&
           !memcmp(mem + 0x40000, after, 64));
    sse_cases++;
  }
  printf("actual TCG mixed SSE/scalar memory full-state differential: %u cases "
         "PASS\n",
         sse_cases);
  unsigned sse_move_cases = 0;
  unsigned shuffle_cases = 0;
  for (unsigned dest = 0; dest < 8; dest++)
    for (unsigned source = 0; source < 8; source++)
      for (unsigned imm = 0; imm < 256; imm++) {
        *env = initial;
        env->eip = 0x10000;
        cpu_x86_update_cr4(env, env->cr[4] | CR4_OSFXSR_MASK);
        for (unsigned j = 0; j < 8; j++)
          for (unsigned k = 0; k < 16; k++)
            env->xmm_regs[j]._l_ZMMReg[k] = random_word();
        CPUX86State expected = *env;
        uint32_t lanes[4] = {env->xmm_regs[dest].ZMM_L(imm & 3),
                             env->xmm_regs[dest].ZMM_L((imm >> 2) & 3),
                             env->xmm_regs[source].ZMM_L((imm >> 4) & 3),
                             env->xmm_regs[source].ZMM_L((imm >> 6) & 3)};
        for (unsigned k = 0; k < 4; k++)
          expected.xmm_regs[dest].ZMM_L(k) = lanes[k];
        expected.eip = 0x10004;
        uint8_t opcode[] = {0x0f, 0xc6, 0xc0 | (dest << 3) | source, imm};
        assert(address_space_write(&address_space_memory, 0x10000,
                                   MEMTXATTRS_UNSPECIFIED, opcode,
                                   sizeof(opcode)) == MEMTX_OK);
        step(cpu);
        assert(cpu->exception_index == -1);
        assert(!memcmp(env, &expected, sizeof(*env)));
        shuffle_cases++;
      }
  printf("actual SHUFPS selectors/aliases/full-state: %u cases PASS\n",
         shuffle_cases);
  for (unsigned aligned = 0; aligned < 2; aligned++) {
    for (unsigned dest = 0; dest < 8; dest++) {
      for (unsigned offset = 0; offset < 32; offset++) {
        uint8_t opcode[] = {0x0f, aligned ? 0x28 : 0x10, (dest << 3) | 1};
        uint8_t payload[16];
        for (unsigned n = 0; n < 16; n++)
          payload[n] = random_word();
        *env = initial;
        env->eip = 0x10000;
        env->regs[R_ECX] = 0x40000 + offset;
        cpu_x86_update_cr4(env, env->cr[4] | CR4_OSFXSR_MASK);
        ZMMReg expected_xmm[CPU_NB_REGS];
        memcpy(expected_xmm, env->xmm_regs, sizeof(expected_xmm));
        bool fault = aligned && (offset & 15);
        if (!fault)
          memcpy(&expected_xmm[dest], payload, 16);
        assert(address_space_write(&address_space_memory, 0x10000,
                                   MEMTXATTRS_UNSPECIFIED, opcode,
                                   sizeof(opcode)) == MEMTX_OK);
        memcpy(mem + 0x40000 + offset, payload, 16);
        tlb_flush(cpu);
        step(cpu);
        assert(cpu->exception_index == (fault ? EXCP0D_GPF : -1));
        assert(env->eip == (fault ? 0x10000 : 0x10003));
        assert(!memcmp(env->xmm_regs, expected_xmm, sizeof(expected_xmm)));
        assert(!memcmp(mem + 0x40000 + offset, payload, 16));
        sse_move_cases++;
      }
    }
  }
  printf("actual SSE MOVUPS/MOVAPS bit-copy and alignment: %u cases PASS\n",
         sse_move_cases);
  /* A guest store modifies an instruction already translated in this TB. */
  uint8_t smc[] = {0xb8, 0x0a, 0x00, 0x01, 0x00, 0xc6, 0x00,
                   5,    0xba, 0,    0,    0,    0,    0x90};
  /* mov edx immediate starts at +9; modify its low immediate byte. */
  smc[1] = 9;
  *env = initial;
  env->eip = 0x10000;
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, smc,
                             sizeof(smc)) == MEMTX_OK);
  tlb_flush(cpu);
  block(cpu, 4);
  for (unsigned tries = 0; env->eip < 0x1000e && tries < 20; tries++)
    step(cpu);
  assert(env->eip == 0x1000e && env->regs[R_EDX] == 5);
  puts("actual guest SMC inside translated block PASS");
  /* #NM is recognized before MMX state transitions or memory reads. */
  *env = initial;
  env->eip = 0x10000;
  env->fpstt = 5;
  memset(env->fptags, 1, 8);
  uint8_t nm_load[] = {0x0f, 0x6f, 0x00};
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, nm_load, 3) == MEMTX_OK);
  env->hflags |= HF_TS_MASK;
  env->cr[0] |= CR0_TS_MASK;
  step(cpu);
  assert(cpu->exception_index == EXCP07_PREX && env->eip == 0x10000 &&
         env->fpstt == 5);
  for (int i = 0; i < 8; i++)
    assert(env->fptags[i] == 1);
  /* MMIO callback must observe the original helper's committed state. */
  static MemoryRegion io;
  memory_region_init_io(&io, NULL, &io_ops, NULL, "test-mmio", 4096);
  memory_region_add_subregion_overlap(get_system_memory(), 0x30000, &io, 1);
  *env = initial;
  env->eip = 0x10000;
  env->regs[R_EAX] = 0x30000;
  env->fpstt = 5;
  memset(env->fptags, 1, 8);
  io_env = env;
  uint8_t load[] = {0x0f, 0x6f, 0x00};
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, load, 3) == MEMTX_OK);
  tlb_flush(cpu);
  step(cpu);
  assert(cpu->exception_index == -1 && io_reads == 1 &&
         env->fpregs[0].mmx.MMX_Q(0) == UINT64_C(0x0123456789abcdef));
  uint8_t dirty_load[] = {0xb8, 0x45, 0x23, 1,    0, 0xba, 0xbe, 0xba,
                          0xfe, 0xca, 0x83, 0xc7, 7, 0x8b, 0x01};
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, dirty_load,
                             sizeof(dirty_load)) == MEMTX_OK);
  *env = initial;
  env->eip = 0x10000;
  env->regs[R_ECX] = 0x30000;
  io_gp_check = true;
  block(cpu, 4);
  io_gp_check = false;
  assert(cpu->exception_index == -1 && env->eip == 0x1000f &&
         env->regs[R_EAX] == 0x89abcdef);
  /* A full SSE MMIO read must complete before any destination commit. */
  uint8_t sse_io[] = {0x0f, 0x10, 0x01};
  *env = initial;
  env->eip = 0x10000;
  env->regs[R_ECX] = 0x30000;
  cpu_x86_update_cr4(env, env->cr[4] | CR4_OSFXSR_MASK);
  memcpy(io_xmm_before, env->xmm_regs, sizeof(io_xmm_before));
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, sse_io,
                             sizeof(sse_io)) == MEMTX_OK);
  unsigned before_io_reads = io_reads;
  io_sse_check = true;
  tlb_flush(cpu);
  step(cpu);
  io_sse_check = false;
  assert(cpu->exception_index == -1 && env->eip == 0x10003);
  assert(io_reads == before_io_reads + 2);
  memcpy(&io_xmm_before[0], io_payload, sizeof(io_payload));
  assert(!memcmp(env->xmm_regs, io_xmm_before, sizeof(io_xmm_before)));
  puts("actual SSE 128-bit MMIO sequencing and destination commit PASS");
  /* A miss callback may replace/free the mask/table behind resident host
   * registers. A subsequent RAM access in the same BB must use fresh values. */
  uint8_t resize_reads[] = {0x8b, 0x1f, 0xa5}; /* RAM read; MOVSD MMIO -> RAM */
  *env = initial;
  env->eip = 0x10000;
  env->regs[R_ESI] = 0x30000;
  env->regs[R_EDI] = 0x40000;
  env->df = 1;
  uint32_t resize_values[] = {0x12345678, 0xabcdef01};
  memcpy(mem + 0x40000, resize_values, sizeof(resize_values));
  assert(address_space_write(&address_space_memory, 0x10000,
      MEMTXATTRS_UNSPECIFIED, resize_reads, sizeof(resize_reads)) == MEMTX_OK);
  io_cpu = cpu;
  io_resize = true;
  unsigned before_resize = io_resize_count;
  tlb_flush(cpu);
  block(cpu, 2);
  io_resize = false;
  fprintf(stderr, "resized TLB: exception=%d PC=%x callbacks=%u\n",
          cpu->exception_index, env->eip, io_resize_count - before_resize);
  assert(cpu->exception_index == -1 && env->eip == 0x10003);
  assert(io_resize_count == before_resize + 1);
  assert(env->regs[R_EBX] == resize_values[0] &&
         env->regs[R_EDI] == 0x40004 && env->regs[R_ESI] == 0x30004 &&
         *(uint32_t *)(mem + 0x40000) == 0x89abcdef);
  puts("RAM read/MOVSD MMIO-to-RAM: freed/resized TLB descriptor reload PASS");
  memory_region_del_subregion(get_system_memory(), &io);
  /* Missing data page: MMX entry precedes access, fault PC stays precise. */
  uint32_t *pd = (uint32_t *)(mem + 0x1000), *pt = (uint32_t *)(mem + 0x2000);
  memset(pd, 0, 4096);
  memset(pt, 0, 4096);
  pd[0] = 0x2003;
  pt[16] = 0x10003;
  *env = initial;
  env->eip = 0x10000;
  env->regs[R_EAX] = 0x30000;
  env->fpstt = 5;
  memset(env->fptags, 1, 8);
  cpu_x86_update_cr3(env, 0x1000);
  cpu_x86_update_cr0(env, CR0_PE_MASK | CR0_PG_MASK);
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, load, 3) == MEMTX_OK);
  tlb_flush(cpu);
  step(cpu);
  assert(cpu->exception_index == EXCP0E_PAGE && env->eip == 0x10000 &&
         env->cr[2] == 0x30000 && env->fpstt == 0);
  for (int i = 0; i < 8; i++)
    assert(env->fptags[i] == 0);
  /* Dirty globals and a subsequently overwritten register at a precise fault.
   */
  *env = initial;
  env->eip = 0x10000;
  env->regs[R_ECX] = 0x30000;
  cpu_x86_update_cr3(env, 0x1000);
  cpu_x86_update_cr0(env, CR0_PE_MASK | CR0_PG_MASK);
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, dirty_load,
                             sizeof(dirty_load)) == MEMTX_OK);
  tlb_flush(cpu);
  block(cpu, 4);
  assert(cpu->exception_index == EXCP0E_PAGE && env->eip == 0x1000d &&
         env->cr[2] == 0x30000);
  assert(env->regs[R_EAX] == 0x12345 && env->regs[R_EDX] == 0xcafebabe &&
         env->regs[R_EDI] == initial.regs[R_EDI] + 7);
  assert(!(env->eflags & (CC_C | CC_O | CC_Z | CC_S | CC_P | CC_A)));
  uint8_t fp_fault[] = {0xd9, 0xc1, 0x8b, 0x01};
  *env = initial;
  env->eip = 0x10000;
  env->fpstt = 5;
  env->regs[R_ECX] = 0x30000;
  env->fpregs[6].d = values[3];
  cpu_x86_update_cr3(env, 0x1000);
  cpu_x86_update_cr0(env, CR0_PE_MASK | CR0_PG_MASK);
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, fp_fault,
                             sizeof(fp_fault)) == MEMTX_OK);
  tlb_flush(cpu);
  block(cpu, 2);
  assert(cpu->exception_index == EXCP0E_PAGE && env->eip == 0x10002 &&
         env->fpstt == 4);
  assert(env->fptags[4] == 0 && env->fpregs[4].d.low == values[3].low &&
         env->fpregs[4].d.high == values[3].high);
  /* Cross-page SSE fault leaves the entire destination unchanged. */
  uint8_t sse_fault[] = {0xb8, 0x45, 0x23, 1, 0, 0x0f, 0x10, 0x01};
  *env = initial;
  env->eip = 0x10000;
  env->regs[R_ECX] = 0x40ff8;
  for (unsigned j = 0; j < CPU_NB_REGS; j++)
    for (unsigned k = 0; k < 16; k++)
      env->xmm_regs[j]._l_ZMMReg[k] = random_word();
  memcpy(io_xmm_before, env->xmm_regs, sizeof(io_xmm_before));
  pt[64] = 0x40003;
  pt[65] = 0;
  cpu_x86_update_cr3(env, 0x1000);
  cpu_x86_update_cr4(env, env->cr[4] | CR4_OSFXSR_MASK);
  cpu_x86_update_cr0(env, CR0_PE_MASK | CR0_PG_MASK);
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, sse_fault,
                             sizeof(sse_fault)) == MEMTX_OK);
  tlb_flush(cpu);
  block(cpu, 2);
  assert(cpu->exception_index == EXCP0E_PAGE && env->eip == 0x10005 &&
         env->cr[2] == 0x41000 && env->regs[R_EAX] == 0x12345);
  assert(!memcmp(env->xmm_regs, io_xmm_before, sizeof(io_xmm_before)));
  puts("actual SSE cross-page #PF: precise PC, prior GPR commit, unchanged XMM "
       "PASS");
  /* Dirty TOP/tags from prior cached F32 reads must survive a following #PF. */
  for (unsigned store = 0; store < 2; store++) {
    uint8_t fp_sequence[] = {
        0xd9, 0x46, 0,    0xd9, 0x46, 4,    0xd9,
        0x46, 8,    0xd9, 0x46, 12,   0xd9, store ? 0x9e : 0x86,
        0,    0x10, 0,    0};
    uint32_t payload[] = {0x3f800000, 0x40000000, 0x40400000, 0x40800000};
    *env = initial;
    env->eip = 0x10000;
    env->regs[R_ESI] = 0x40000;
    env->fpstt = 5;
    memcpy(mem + 0x40000, payload, sizeof(payload));
    cpu_x86_update_cr3(env, 0x1000);
    cpu_x86_update_cr0(env, CR0_PE_MASK | CR0_PG_MASK);
    assert(address_space_write(&address_space_memory, 0x10000,
                               MEMTXATTRS_UNSPECIFIED, fp_sequence,
                               sizeof(fp_sequence)) == MEMTX_OK);
    tlb_flush(cpu);
    CPUX86State start = *env;
    for (unsigned n = 0; n < 4; n++)
      step(cpu);
    CPUX86State expected = *env;
    assert(expected.fpstt == 1);
    *env = start;
    block(cpu, 5);
    assert(cpu->exception_index == EXCP0E_PAGE && env->eip == 0x1000c &&
           env->cr[2] == 0x41000 && env->fpstt == 1);
    assert(!memcmp(env->fpregs, expected.fpregs, sizeof(env->fpregs)) &&
           !memcmp(env->fptags, expected.fptags, sizeof(env->fptags)));
    assert(env->fpus == expected.fpus && env->fpip == expected.fpip &&
           env->fpdp == expected.fpdp);
  }
  puts("cached F32 reads then FLD/FSTP #PF: precise PC, committed TOP/tags, no "
       "premature pop PASS");
  /* Warm-cache guards must still reject cross-page and over-aligned reads. */
  uint8_t warm_fault[] = {0x8b, 0x06, 0x8b, 0x56, 4,    0x8b, 0x5e,
                          8,    0x8b, 0x4e, 12,   0x0f, 0x6f, 0x07};
  uint32_t warm_values[] = {1, 2, 3, 4};
  *env = initial;
  env->eip = 0x10000;
  env->fpstt = 5;
  env->regs[R_ESI] = 0x40000;
  env->regs[R_EDI] = 0x40ffc;
  uint64_t old_mmx = env->fpregs[0].mmx.MMX_Q(0);
  memcpy(mem + 0x40000, warm_values, sizeof(warm_values));
  cpu_x86_update_cr3(env, 0x1000);
  cpu_x86_update_cr0(env, CR0_PE_MASK | CR0_PG_MASK);
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, warm_fault,
                             sizeof(warm_fault)) == MEMTX_OK);
  tlb_flush(cpu);
  block(cpu, 5);
  assert(cpu->exception_index == EXCP0E_PAGE && env->eip == 0x1000b &&
         env->cr[2] == 0x41000);
  assert(env->regs[R_EAX] == 1 && env->regs[R_EDX] == 2 &&
         env->regs[R_EBX] == 3 && env->regs[R_ECX] == 4);
  assert(env->fpstt == 0 && env->fpregs[0].mmx.MMX_Q(0) == old_mmx);
  for (unsigned n = 0; n < 8; n++)
    assert(env->fptags[n] == 0);
  warm_fault[12] = 0x28;
  warm_fault[13] = 0x1f;
  *env = initial;
  env->eip = 0x10000;
  env->regs[R_ESI] = 0x40000;
  env->regs[R_EDI] = 0x40004;
  cpu_x86_update_cr4(env, env->cr[4] | CR4_OSFXSR_MASK);
  cpu_x86_update_cr3(env, 0x1000);
  cpu_x86_update_cr0(env, CR0_PE_MASK | CR0_PG_MASK);
  memcpy(io_xmm_before, env->xmm_regs, sizeof(io_xmm_before));
  assert(address_space_write(&address_space_memory, 0x10000,
                             MEMTXATTRS_UNSPECIFIED, warm_fault,
                             sizeof(warm_fault)) == MEMTX_OK);
  tlb_flush(cpu);
  block(cpu, 5);
  assert(cpu->exception_index == EXCP0D_GPF && env->eip == 0x1000b);
  assert(!memcmp(env->xmm_regs, io_xmm_before, sizeof(io_xmm_before)));
  puts("warm-cache cross-page #PF and required-alignment #GP PASS");
  /* MMIO can introduce a read watchpoint or remap a previously cached page. */
  uint8_t after_io[] = {0x8b, 0x06, 0x8b, 0x56, 4,    0x8b, 0x5e, 8,
                        0x8b, 0x4e, 12,   0x8b, 0x3f, 0x8b, 0x6d, 0};
  memory_region_add_subregion_overlap(get_system_memory(), 0x30000, &io, 1);
  io_cpu = cpu;
  io_ram = mem;
  for (unsigned remap = 0; remap < 2; remap++) {
    *env = initial;
    env->eip = 0x10000;
    env->regs[R_ESI] = 0x40000;
    env->regs[R_EDI] = 0x30000;
    env->regs[R_EBP] = 0x40020;
    pt[48] = 0x30003;
    pt[64] = 0x40003;
    memcpy(mem + 0x40000, warm_values, sizeof(warm_values));
    *(uint32_t *)(mem + 0x40020) = 0x11111111;
    *(uint32_t *)(mem + 0x50020) = 0x55555555;
    cpu_x86_update_cr3(env, 0x1000);
    cpu_x86_update_cr0(env, CR0_PE_MASK | CR0_PG_MASK);
    assert(address_space_write(&address_space_memory, 0x10000,
                               MEMTXATTRS_UNSPECIFIED, after_io,
                               sizeof(after_io)) == MEMTX_OK);
    io_watch_install = !remap;
    io_remap = remap;
    tlb_flush(cpu);
    block(cpu, 6);
    /* QEMU splits a non-final MMIO instruction before its side effects. */
    if (cpu->exception_index == -1 && env->eip == 0x1000b) {
      step(cpu);
      assert(cpu->exception_index == -1 && env->eip == 0x1000d);
      step(cpu);
    }
    io_watch_install = false;
    io_remap = false;
    if (remap) {
      assert(cpu->exception_index == -1 && env->eip == 0x10010 &&
             env->regs[R_EBP] == 0x55555555);
    } else {
      fprintf(
          stderr,
          "watch transition exception=%x eip=%x ebp=%x hit=%p expected=%p\n",
          cpu->exception_index, env->eip, env->regs[R_EBP], cpu->watchpoint_hit,
          io_watchpoint);
      assert(cpu->exception_index == EXCP_DEBUG && env->eip == 0x1000d &&
             env->regs[R_EBP] == 0x40020);
      assert(cpu->watchpoint_hit == io_watchpoint);
      cpu_watchpoint_remove_by_ref(cpu, io_watchpoint);
      io_watchpoint = NULL;
      cpu->watchpoint_hit = NULL;
    }
    assert(env->regs[R_EDI] == 0x89abcdef);
  }
  memory_region_del_subregion(get_system_memory(), &io);
  puts(
      "MMIO exit/resume: watchpoint installation and same-page remapping PASS");

#ifdef BOXDROID_TCG_FLAT_TLB_TEST
  test_flat_tlb_lifetime(cpu, &initial);
#endif

#ifdef BOXDROID_TCG_RECOVERY_USES_TEST
  extern uint64_t boxdroid_recovery_fast_hits, boxdroid_recovery_cold_hits;
  printf("actual explicit recovery uses fast=%" PRIu64 " cold=%" PRIu64 "\n",
         boxdroid_recovery_fast_hits, boxdroid_recovery_cold_hits);
  if (tcg_ctx->boxdroid_recovery_mode) {
    assert(boxdroid_recovery_fast_hits > 0);
    assert(boxdroid_recovery_cold_hits > 0);
  }
#endif
  printf("actual TCG MMX full-state differential: %u cases; SMC, #NM, MMIO "
         "visibility, precise #PF PASS\n",
         cases);
#ifdef BOXDROID_TCG_VECTOR_ACQUIRE_TEST
  printf("actual vector pair acquire hits=%" PRIu64 "\n", boxdroid_vector_acquire_hits);
  if (tcg_ctx->boxdroid_vector_acquire_requested)
    assert(boxdroid_vector_acquire_hits > 0);
#endif
  fflush(stdout);
  _exit(0);
}

int main(int argc, char **argv) {
  (void)argc;
  (void)argv;
  char storage[][32] = {
      "tcg-test", "-machine", "none",        "-accel", "tcg,thread=single",
      "-display", "none",     "-nodefaults", "-m",     "64"};
  char *args[11] = {0};
  for (int i = 0; i < 10; i++)
    args[i] = storage[i];
  qemu_init(10, args);
  memory_region_init_ram(&ram, NULL, "test-ram", 64 * MiB, &error_fatal);
  memory_region_add_subregion(get_system_memory(), 0, &ram);
  Object *obj = object_new("pentium3-" TYPE_X86_CPU);
  object_property_set_uint(obj, "apic-id", 0, &error_fatal);
  qdev_realize(DEVICE(obj), NULL, &error_fatal);
  pause_all_vcpus();
  CPUState *cpu = CPU(obj);
  run_on_cpu(cpu, test_on_cpu, RUN_ON_CPU_NULL);
  return 1;
}
