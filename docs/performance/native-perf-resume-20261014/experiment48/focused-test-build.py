#!/usr/bin/env python3
"""Build focused tests against the configured, actual Android TCG objects.

Build the native core first. This script does not reapply patches or rebuild it.
Device execution is optional and must not overlap performance captures.
"""

import argparse
import hashlib
import json
from pathlib import Path
import re
import shlex
import subprocess


ROOT = Path(__file__).resolve().parents[2]


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--build-root", type=Path,
                        default=ROOT / "build/native/android-arm64")
    parser.add_argument("--output", type=Path,
                        default=ROOT / "build/tcg-state-recovery")
    parser.add_argument("--run-device", action="store_true")
    parser.add_argument("--serial")
    parser.add_argument("--mode", choices=("0", "1", "2"), default="0",
                        help="experimental memory path control during tests")
    parser.add_argument("--read-tlb-cache", choices=("0", "1"))
    parser.add_argument("--sse-native", choices=("0", "1"))
    parser.add_argument("--ram-span", choices=("0", "1"))
    parser.add_argument("--fp-local", choices=("0", "1"))
    parser.add_argument("--fp-preserve", choices=("0", "1"))
    parser.add_argument("--jmp-cache2", choices=("0", "1"))
    parser.add_argument("--inline-lookup", choices=("0", "1"))
    parser.add_argument("--lookup-no-bridges", choices=("0", "1"))
    parser.add_argument("--vector-acquire", choices=("0", "1"))
    parser.add_argument("--inline-fmul", choices=("0", "1"))
    parser.add_argument("--inline-fp-preserve", choices=("0", "1"))
    parser.add_argument("--fmul-shared", choices=("0", "1"))
    parser.add_argument("--absolute-pc", choices=("0", "1"))
    parser.add_argument("--shared-lookup", choices=("0", "1"))
    parser.add_argument("--flat-tlb", choices=("0", "1"))
    parser.add_argument("--f32-round", choices=("0", "1"))
    parser.add_argument("--arith-leaf", choices=("0", "1"))
    parser.add_argument("--phys-lookup", choices=("0", "1"))
    parser.add_argument("--jmp-epoch", choices=("0", "1"))
    parser.add_argument("--pin-gp", choices=("0", "1", "2"))
    parser.add_argument("--fp-ptr-cache", choices=("0", "1"))
    parser.add_argument("--x87-bits", choices=("0", "1"))
    parser.add_argument("--lookup-pipeline", choices=("0", "1"))
    parser.add_argument("--qht-acquire", choices=("0", "1"))
    parser.add_argument("--diag-timings", choices=("0", "1"))
    parser.add_argument("--tlb-ir", choices=("0", "1", "2", "3"))
    parser.add_argument("--fp-values", choices=("0", "1", "2"))
    parser.add_argument("--fp-top", choices=("0", "1"))
    parser.add_argument("--fp-meta-dse", choices=("0", "1"))
    parser.add_argument("--branch-fallthrough", choices=("0", "1"))
    parser.add_argument("--recovery-uses", choices=("0", "1", "2", "3"))
    parser.add_argument("--lookup-tail", choices=("0", "1"))
    parser.add_argument("--tlb-resident", choices=("0", "1"))
    args = parser.parse_args()
    build, output = args.build_root.resolve(), args.output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    entries = json.loads((build / "compile_commands.json").read_text())
    entry = next(e for e in entries
                 if e["file"].endswith("/target/i386/tcg/fpu_helper.c"))
    command = shlex.split(entry["command"])
    flags = []
    index = 0
    while index < len(command):
        item = command[index]
        if item in ("-o", "-MQ", "-MF"):
            index += 2
            continue
        if item not in ("-c", "-MD") and not item.endswith("/fpu_helper.c"):
            flags.append(item)
        index += 1
    source_root = (build / "../source/xemu").resolve()
    header = (source_root / "include/tcg/tcg.h").read_text()
    diag_timings_test = "boxdroid_diag_timings_enabled" in (
        source_root / "system/cpus.c").read_text()
    if diag_timings_test:
        flags.append("-DBOXDROID_DIAG_TIMINGS_TEST=1")
    if "boxdroid_branch_fallthrough_requested" in header:
        flags.append("-DBOXDROID_TCG_BRANCH_REGIONS_TEST=1")
    if "boxdroid_pin_gp_count" in header:
        flags.append("-DBOXDROID_TCG_PIN_GP_TEST=1")
    if "boxdroid_fp_ptr_reuses" in header:
        flags.append("-DBOXDROID_TCG_FP_PTR_CACHE_TEST=1")
    if "boxdroid_x87_bits_requested" in header:
        flags.append("-DBOXDROID_TCG_X87_BITS_TEST=1")
    if "boxdroid_lookup_pipeline_requested" in header:
        flags.append("-DBOXDROID_TCG_LOOKUP_PIPELINE_TEST=1")
    if "boxdroid_tlb_ir;" in header:
        flags.append("-DBOXDROID_TCG_TLB_IR_TEST=1")
    if "boxdroid_fp_promote" in header:
        flags.append("-DBOXDROID_TCG_FP_VALUES_TEST=1")
        helper_header = (source_root / "target/i386/helper.h").read_text()
        value_declaration = next((line for line in helper_header.splitlines()
            if line.startswith("DEF_HELPER_FLAGS_3(boxdroid_value_add,")), "")
        if "BOXDROID_FP_ABI_FLAGS" in value_declaration:
            flags.append("-DBOXDROID_TCG_FP_VALUE_ABI_TEST=1")
    if "boxdroid_meta_active" in header:
        flags.append("-DBOXDROID_TCG_FP_META_TEST=1")
    if "boxdroid_pin_coalesced" in header:
        flags.append("-DBOXDROID_TCG_PIN_COALESCE_TEST=1")
    if "boxdroid_recovery_mode" in header:
        flags.append("-DBOXDROID_TCG_RECOVERY_USES_TEST=1")
    if "boxdroid_mem_preserve_regs" in header:
        flags.append("-DBOXDROID_TCG_STATE_RECOVERY_TEST=1")
    if "boxdroid_read_tlb_cache" in header:
        flags.append("-DBOXDROID_TCG_READ_TLB_TEST=1")
    if "boxdroid_span_active" in header:
        flags.append("-DBOXDROID_TCG_SPAN_TEST=1")
    if "boxdroid_f32_load" in (source_root / "target/i386/helper.h").read_text():
        flags.append("-DBOXDROID_TCG_FP_LOCAL_TEST=1")
    if "boxdroid_vector_acquire_requested" in header:
        flags.append("-DBOXDROID_TCG_VECTOR_ACQUIRE_TEST=1")
    if "boxdroid_fmul_shared_requested" in header:
        flags.append("-DBOXDROID_TCG_INLINE_FMUL_TEST=1")
    if "boxdroid_flat_tlb_mask" in header:
        flags.append("-DBOXDROID_TCG_FLAT_TLB_TEST=1")
    if "boxdroid_lookup_tail_requested" in header:
        flags.append("-DBOXDROID_TCG_TAIL_LOOKUP_TEST=1")
    if "boxdroid_lookup_shared_requested" in header:
        flags.append("-DBOXDROID_TCG_SHARED_LOOKUP_TEST=1")
    if "boxdroid_inline_lookup_requested" in header:
        flags.append("-DBOXDROID_TCG_INLINE_LOOKUP_TEST=1")
    if "secondary[TB_JMP_CACHE_SIZE]" in (source_root / "accel/tcg/tb-jmp-cache.h").read_text():
        flags.append("-DBOXDROID_TCG_JMP_CACHE_TEST=1")
    if "BOXDROID_PHYS_TB_CACHE_SIZE" in (source_root / "accel/tcg/tb-jmp-cache.h").read_text():
        flags.append("-DBOXDROID_TCG_PHYS_LOOKUP_TEST=1")
    if "boxdroid_jmp_cache_pc" in (source_root / "accel/tcg/tb-jmp-cache.h").read_text():
        flags.append("-DBOXDROID_TCG_JMP_EPOCH_TEST=1")
    if "boxdroid_f32_round_requested" in (source_root / "target/i386/tcg/fpu_helper.c").read_text():
        flags.append("-DBOXDROID_TCG_F32_ROUND_TEST=1")
    if "boxdroid_arith_leaf_requested" in (source_root / "target/i386/tcg/fpu_helper.c").read_text():
        flags.append("-DBOXDROID_TCG_ARITH_LEAF_TEST=1")
    test_source = Path(__file__).with_suffix(".c")
    test_object = output / "test.o"
    executable = output / "test-tcg"
    subprocess.run(flags + ["-c", str(test_source), "-o", str(test_object)],
                   cwd=build, check=True)

    ninja = (build / "build.ninja").read_text().replace("$\n", "")
    rule = re.search(r"^build libboxdroid\.so: cpp_LINKER_RSP ([^\n]*)\n"
                     r"((?:[ \t]+[^\n]*\n)*)", ninja, re.MULTILINE)
    if not rule:
        raise RuntimeError("Cannot locate the configured native core link rule")
    objects = shlex.split(rule[1].split(" | ")[0].replace("$ ", " "))
    link_line = re.search(r"^\s+LINK_ARGS = ([^\n]*)", rule[2], re.MULTILINE)
    if not link_line:
        raise RuntimeError("Cannot locate the configured native core link arguments")
    link_args = shlex.split(link_line[1].replace("$ ", " "))
    link_args = [x for x in link_args
                 if x not in ("-shared", "-fPIC", "-Wl,-soname,libboxdroid.so")]
    if "boxdroid_fmul_shared_requested" in header:
        link_args.append("-Wl,--wrap=gen_bb_epilogue")
    if diag_timings_test:
        link_args.append("-Wl,--wrap=boxdroid_diag_timings_enabled")
    compiler = Path(flags[0]).with_name("aarch64-linux-android33-clang++")
    subprocess.run([str(compiler), "-o", str(executable), str(test_object),
                    *objects, *link_args], cwd=build, check=True)
    source_diff = subprocess.check_output(["git", "-C", str(source_root), "diff"])
    (output / "source.diff").write_bytes(source_diff)
    runtime = source_root / "system/boxdroid-xbox-runtime.c"
    identity = {
        "root_head": subprocess.check_output(["git", "rev-parse", "HEAD"],
                                             cwd=ROOT, text=True).strip(),
        "source_head": subprocess.check_output(
            ["git", "-C", str(source_root), "rev-parse", "HEAD"],
            text=True).strip(),
        "source_diff_sha256": hashlib.sha256(source_diff).hexdigest(),
        "test_source_sha256": digest(test_source),
        "executable_sha256": digest(executable),
        "core_sha256": digest(build / "libboxdroid.so"),
        "runtime_source_sha256": digest(runtime),
        "diagnostic_timing_test_hook": diag_timings_test,
        "requested_diag_timings": args.diag_timings,
        "mode": args.mode,
    }
    (output / "identity.json").write_text(json.dumps(identity, indent=2) + "\n")
    if args.run_device:
        adb = ["adb"] + (["-s", args.serial] if args.serial else [])
        prefix = "/data/local/tmp/boxdroid-tcg-state-tests"
        subprocess.run(adb + ["push", str(executable), prefix], check=True)
        subprocess.run(adb + ["push", str(build / "jniLibs/arm64-v8a/libc++_shared.so"),
                              "/data/local/tmp/libc++_shared.so"], check=True)
        requested = {"defer_globals": args.mode}
        if args.read_tlb_cache is not None:
            requested["read_tlb_cache"] = args.read_tlb_cache
        if args.sse_native is not None:
            requested["sse_native"] = args.sse_native
        if args.ram_span is not None:
            requested["ram_span"] = args.ram_span
        if args.fp_local is not None:
            requested["fp_local"] = args.fp_local
        if args.fp_preserve is not None:
            requested["fp_preserve"] = args.fp_preserve
        if args.jmp_cache2 is not None:
            requested["jmp_cache2"] = args.jmp_cache2
        if args.inline_lookup is not None:
            requested["inline_lookup"] = args.inline_lookup
            requested["inline_lookup_count"] = "1"
        if args.lookup_no_bridges is not None:
            requested["lookup_no_bridges"] = args.lookup_no_bridges
        if args.vector_acquire is not None:
            requested["vector_acquire"] = args.vector_acquire
        if args.inline_fmul is not None:
            requested["inline_fmul"] = args.inline_fmul
        if args.inline_fp_preserve is not None:
            requested["inline_fp_preserve"] = args.inline_fp_preserve
        if args.fmul_shared is not None:
            requested["fmul_shared"] = args.fmul_shared
        if args.absolute_pc is not None:
            requested["tcg_absolute_pc"] = args.absolute_pc
        if args.shared_lookup is not None:
            requested["lookup_shared"] = args.shared_lookup
        if args.tlb_resident is not None:
            requested["tlb_resident"] = args.tlb_resident
        if args.lookup_tail is not None:
            requested["lookup_tail"] = args.lookup_tail
        if args.flat_tlb is not None:
            requested["flat_tlb"] = args.flat_tlb
        if args.recovery_uses is not None:
            requested["recovery_uses"] = args.recovery_uses
        if args.f32_round is not None:
            requested["f32_round"] = args.f32_round
        if args.arith_leaf is not None:
            requested["arith_leaf"] = args.arith_leaf
        if args.phys_lookup is not None:
            requested["phys_lookup"] = args.phys_lookup
        if args.jmp_epoch is not None:
            requested["jmp_epoch"] = args.jmp_epoch
        if args.pin_gp is not None:
            requested["pin_gp"] = args.pin_gp
        if args.fp_ptr_cache is not None:
            requested["fp_ptr_cache"] = args.fp_ptr_cache
        if args.x87_bits is not None:
            requested["x87_bits"] = args.x87_bits
        if args.lookup_pipeline is not None:
            requested["lookup_pipeline"] = args.lookup_pipeline
        if args.qht_acquire is not None:
            requested["qht_acquire"] = args.qht_acquire
        if args.diag_timings is not None:
            requested["diag_timings"] = args.diag_timings
        if args.tlb_ir is not None:
            requested["tlb_ir"] = args.tlb_ir
        if args.fp_values is not None:
            requested["fp_values"] = args.fp_values
        if args.fp_top is not None:
            requested["fp_top"] = args.fp_top
        if args.fp_meta_dse is not None:
            requested["fp_meta_dse"] = args.fp_meta_dse
        if args.branch_fallthrough is not None:
            requested["branch_fallthrough"] = args.branch_fallthrough
        previous = {name: subprocess.check_output(
            adb + ["shell", "getprop", "debug.boxdroid." + name],
            text=True).strip() for name in requested}
        try:
            for name, value in requested.items():
                subprocess.run(adb + ["shell", "setprop", "debug.boxdroid." + name,
                                      value], check=True)
            identity["device_controls"] = {name: subprocess.check_output(
                adb + ["shell", "getprop", "debug.boxdroid." + name],
                text=True).strip() for name in (
                    "defer_globals", "read_tlb_cache", "sse_native", "ram_span", "fp_local", "fp_preserve", "jmp_cache2", "tcg_ordered", "fast_fpu",
                    "tcg_dump", "diagnostics", "diag_timings", "fpu_audit", "order_audit", "inline_lookup", "inline_lookup_count", "lookup_no_bridges", "vector_acquire", "inline_fmul", "inline_fp_preserve", "fmul_shared", "tcg_absolute_pc", "lookup_shared", "lookup_pipeline", "qht_acquire", "fp_top", "fp_values", "fp_meta_dse", "lookup_tail", "flat_tlb", "f32_round", "arith_leaf", "phys_lookup", "jmp_epoch", "pin_gp", "fp_ptr_cache", "x87_bits", "branch_fallthrough", "recovery_uses", "tlb_resident", "tlb_ir")}
            (output / "identity.json").write_text(json.dumps(identity, indent=2) + "\n")
            with (output / "result.log").open("w") as log:
                subprocess.run(adb + ["shell", "LD_LIBRARY_PATH=/data/local/tmp " + prefix],
                               stdout=log, stderr=subprocess.STDOUT, check=True)
        finally:
            for name, value in previous.items():
                subprocess.run(adb + ["shell", "setprop debug.boxdroid." + name +
                                      " " + shlex.quote(value)], check=True)
        result = (output / "result.log").read_text()
        if re.search(r"ERROR:|Bail out!|assertion failed|SILENT_CRASH|FATAL", result):
            raise RuntimeError("QEMU reported a failure despite command exit status; inspect result.log")
        if "actual TCG MMX full-state differential: 2048 cases; SMC, #NM, MMIO visibility, precise #PF PASS" not in result:
            raise RuntimeError("Focused suite did not reach final completion marker")
        print(result)
    print("Artifacts:", output)


if __name__ == "__main__":
    main()
