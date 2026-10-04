#!/usr/bin/env python3
"""Run bounded M6 launches and one Android background/foreground cycle."""

import argparse
import pathlib
import subprocess
import time


def run(adb, *args, check=True, capture=True):
    return subprocess.run(["adb", *adb, *map(str, args)], check=check,
                          text=True, stdout=subprocess.PIPE if capture else None,
                          stderr=subprocess.STDOUT if capture else None).stdout or ""


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--package", required=True)
    parser.add_argument("--activity", required=True)
    parser.add_argument("--results", required=True, type=pathlib.Path)
    parser.add_argument("--seconds", type=int, default=28)
    parser.add_argument("--serial")
    args = parser.parse_args()
    adb = ["-s", args.serial] if args.serial else []
    args.results.mkdir(parents=True, exist_ok=True)
    summary = []

    for number in range(1, 4):
        result_dir = args.results / f"run-{number}"
        result_dir.mkdir(parents=True, exist_ok=True)
        run(adb, "shell", "am", "force-stop", args.package)
        run(adb, "logcat", "-c")
        run(adb, "logcat", "-b", "crash", "-c")
        run(adb, "shell", "am", "start", "-W", "-n", f"{args.package}/{args.activity}")
        pid = run(adb, "shell", "pidof", args.package).strip()
        if not pid.isdigit():
            raise RuntimeError(f"run {number}: app process did not start: {pid!r}")
        started = time.monotonic()
        checkpoints = [4, 8, 12, 20]
        if number == 1:
            checkpoints = [4, 8, 12, 20, 27]
        for second in checkpoints:
            if second >= args.seconds:
                continue
            delay = started + second - time.monotonic()
            if delay > 0:
                time.sleep(delay)
            with (result_dir / f"screen-{second}s.png").open("wb") as image:
                subprocess.run(["adb", *adb, "exec-out", "screencap", "-p"],
                               check=True, stdout=image)
            # Move the app to the background once, after audio and the boot
            # APU path have had time to initialize; relaunch it to restore focus.
            if number == 1 and second == 12:
                run(adb, "shell", "input", "keyevent", "KEYCODE_HOME")
                time.sleep(3)
                run(adb, "shell", "am", "start", "-W", "-n",
                    f"{args.package}/{args.activity}")
        delay = started + args.seconds - time.monotonic()
        if delay > 0:
            time.sleep(delay)
        with (result_dir / "screen-final.png").open("wb") as image:
            subprocess.run(["adb", *adb, "exec-out", "screencap", "-p"],
                           check=True, stdout=image)
        run(adb, "shell", "input", "keyevent", "KEYCODE_BACK", check=False)
        time.sleep(5)
        log = run(adb, "logcat", "-d", "-s", "BoxDroidM6:I",
                  "BoxDroidM6Audio:I", "BoxDroidM5:I", "BoxDroidM4:I",
                  "BoxDroidM53:I", "*:S")
        (result_dir / "logcat.txt").write_text(log)
        crash = run(adb, "logcat", "-b", "crash", "-d")
        (result_dir / "crash-buffer.txt").write_text(crash)
        qemu_log = run(adb, "exec-out", "run-as", args.package, "cat", "files/m5-qemu.log",
                       check=False)
        (result_dir / "qemu.log").write_text(qemu_log)
        run(adb, "shell", "am", "force-stop", args.package)
        entry = f"run={number} pid={pid} log={result_dir / 'logcat.txt'}"
        summary.append(entry)
        print(entry, flush=True)

    (args.results / "runs.txt").write_text("\n".join(summary) + "\n")


if __name__ == "__main__":
    main()
