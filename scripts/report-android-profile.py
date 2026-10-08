#!/usr/bin/env python3
"""Resolve native samples against the exact unstripped library for a capture.

APK libraries are stripped and this baseline has no GNU build ID. Supply the
archived library matching the measured APK, never a later incremental build.
Children percentages overlap; they must not be summed as independent costs.
"""

import argparse
import os
from pathlib import Path
import re
import subprocess


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("capture", type=Path)
    parser.add_argument("--library", required=True, type=Path)
    parser.add_argument("--ndk", type=Path, default=Path(os.environ.get(
        "ANDROID_NDK_HOME", str(Path.home() / "Library/Android/sdk/ndk/30.0.16248370"))))
    args = parser.parse_args()
    if not args.library.is_file():
        parser.error("--library must name the saved unstripped library for this capture")
    simpleperf = args.ndk / "simpleperf/bin/darwin/x86_64/simpleperf"
    addr2line = args.ndk / "toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-addr2line"
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
