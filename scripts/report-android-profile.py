#!/usr/bin/env python3
"""Resolve native samples against the exact unstripped library for a capture.

APK libraries are stripped and this baseline has no GNU build ID. Supply the
archived library matching the measured APK, never a later incremental build.
Children percentages overlap; they must not be summed as independent costs.
"""

import argparse
from pathlib import Path
import re
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import ndk


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("capture", type=Path)
    parser.add_argument("--library", required=True, type=Path)
    parser.add_argument("--ndk", type=Path, help="Android NDK (default: resolved by scripts/ndk.py)")
    args = parser.parse_args()
    if not args.library.is_file():
        parser.error("--library must name the saved unstripped library for this capture")
    args.ndk = args.ndk or ndk.get_ndk_path()
    simpleperf = ndk.get_simpleperf(args.ndk)
    addr2line = ndk.get_llvm_bin(args.ndk) / "llvm-addr2line"
    raw = subprocess.check_output([str(simpleperf), "report", "-i",
        str(args.capture / "perf.data"), "--children", "--sort", "tid,comm,symbol"], text=True)
    args.capture.joinpath("native-report.txt").write_text(raw)
    # simpleperf versions differ: both [+13ecfc0] and [+0x13ecfc0] occur.
    pattern = re.compile(r"libboxdroid\.so\[\+((?:0x)?[0-9a-fA-F]+)\]")
    addresses = sorted(set(pattern.findall(raw)))
    names = {}
    for start in range(0, len(addresses), 200):
        batch = addresses[start:start + 200]
        output = subprocess.check_output([str(addr2line), "-f", "-C", "-e",
                                          str(args.library),
                                          *("0x" + address.removeprefix("0x") for address in batch)],
                                         text=True).splitlines()
        if len(output) != len(batch) * 2:
            raise RuntimeError("Unexpected addr2line output; do not use this report")
        for index, address in enumerate(batch):
            name = output[index * 2]
            names[address] = name if name != "??" else "libboxdroid.so[+" + address + "]"
    resolved = pattern.sub(lambda match: names[match[1]], raw)
    target = args.capture / "native-report-resolved.txt"
    target.write_text(resolved)
    print(target)


if __name__ == "__main__":
    main()
