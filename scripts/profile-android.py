#!/usr/bin/env python3
"""Capture a repeatable Android emulator profile without root access.

Example: scripts/profile-android.py sega-baseline --duration 60 --perf
Raw captures remain under build/performance; summary.json distinguishes guest
flips, changed scanout images, display callbacks, and completed host presents.
"""

import argparse
import json
import re
import subprocess
import time
import statistics
from pathlib import Path


def adb(*args):
    return subprocess.check_output(["adb", *args], text=True).strip()


def process_io(pid):
    # Shell cannot read Android's per-process I/O accounting. The debuggable
    # app UID can read its own counters without root. Sample only at endpoints.
    try:
        raw = subprocess.check_output(["adb", "shell", "run-as", "org.boxdroid",
                                       "cat", f"/proc/{pid}/io"], text=True,
                                      stderr=subprocess.DEVNULL)
    except subprocess.CalledProcessError:
        return None
    counters = {key: int(value) for key, value in
                re.findall(r"^(\w+):\s*(\d+)$", raw, re.MULTILINE)}
    return {"monotonic_seconds": time.monotonic(), "counters": counters} if counters else None


def summarize_process_io(begin, end):
    if begin is None or end is None:
        return None
    duration = end["monotonic_seconds"] - begin["monotonic_seconds"]
    if duration <= 0:
        return None
    counters = {key: end["counters"][key] - begin["counters"][key]
                for key in sorted(begin["counters"].keys() & end["counters"].keys())}
    return {"counter_window_seconds": duration, "counters": counters,
            "counter_reset": any(value < 0 for value in counters.values())}


def parse_snapshot(raw):
    lines = raw.splitlines()
    sample = {"uptime": float(lines[0].split()[0]), "threads": {}, "frequencies": {}, "thermal": {}}
    current = None
    for line in lines[1:]:
        if line.startswith("STAT "):
            match = re.match(r"STAT (\d+) \((.*)\) (.*)", line)
            if not match:
                continue
            tid, name, rest = match.groups()
            fields = rest.split()
            current = {"name": name, "cpu": int(fields[36]), "state": fields[0]}
            sample["threads"][tid] = current
        elif line.startswith("SCHED ") and current is not None:
            values = line.split()[1:]
            if len(values) == 3:
                current.update(runtime_ns=int(values[0]), wait_ns=int(values[1]), slices=int(values[2]))
        elif line.startswith("AFFINITY ") and current is not None:
            current["allowed"] = line.split()[-1]
        elif line.startswith("FREQ "):
            _, policy, frequency = line.split()
            sample["frequencies"][policy.rsplit("/", 1)[-1]] = int(frequency)
        elif line.startswith("THERMAL "):
            _, sensor, temperature = line.split()
            sample["thermal"][sensor] = int(temperature)
        elif line.startswith("BATTERY "):
            sample["battery_temperature_tenths_c"] = int(line.split()[1])
        elif line.startswith("GPU_FREQ "):
            sample["gpu_frequency_hz"] = int(line.split()[1])
        elif line.startswith("MEM "):
            sample["resident_pages"] = int(line.split()[2])
    return sample


def snapshot(pid):
    script = f"""cat /proc/uptime
for task_dir in /proc/{pid}/task/*; do
    read -r task_stat < "$task_dir/stat"
    read -r task_sched < "$task_dir/schedstat"
    printf 'STAT %s\nSCHED %s\n' "$task_stat" "$task_sched"
    while IFS= read -r status_line; do
        case "$status_line" in Cpus_allowed_list:*) printf 'AFFINITY %s\n' "$status_line"; break;; esac
    done < "$task_dir/status"
done
printf 'MEM '; cat /proc/{pid}/statm
for cpu_policy in /sys/devices/system/cpu/cpufreq/policy*; do
    read -r frequency < "$cpu_policy/scaling_cur_freq"
    printf 'FREQ %s %s\n' "$cpu_policy" "$frequency"
done
if read -r battery_temp < /sys/class/power_supply/battery/temp 2>/dev/null; then
    printf 'BATTERY %s\n' "$battery_temp"
fi
if read -r gpu_frequency < /sys/class/kgsl/kgsl-3d0/gpuclk 2>/dev/null; then
    printf 'GPU_FREQ %s\n' "$gpu_frequency"
fi
for thermal_dir in /sys/class/thermal/thermal_zone*; do
    read -r sensor_type < "$thermal_dir/type" 2>/dev/null || continue
    case "$sensor_type" in *cpu*|*gpu*)
        if read -r sensor_value < "$thermal_dir/temp" 2>/dev/null; then
            printf 'THERMAL %s %s\n' "$sensor_type" "$sensor_value"
        fi;;
    esac
done
"""
    return parse_snapshot(adb("shell", script))


def percentile(values, fraction):
    if not values:
        return None
    ordered = sorted(values)
    return ordered[min(len(ordered) - 1, int((len(ordered) - 1) * fraction))]


def metrics(line):
    return {key: int(value, 0) for key, value in re.findall(r"(\w+)=(-?0x[0-9a-f]+|-?\d+)", line)}


def summarize(samples, log, page_size=4096):
    duration = samples[-1]["uptime"] - samples[0]["uptime"]
    spacing = [b["uptime"] - a["uptime"] for a, b in zip(samples, samples[1:])]
    threads = []
    first, last = samples[0]["threads"], samples[-1]["threads"]
    for tid in first.keys() & last.keys():
        if "runtime_ns" not in first[tid] or "runtime_ns" not in last[tid]:
            continue
        runtime = last[tid]["runtime_ns"] - first[tid]["runtime_ns"]
        wait = last[tid]["wait_ns"] - first[tid]["wait_ns"]
        threads.append({"tid": int(tid), "name": last[tid]["name"],
                        "cpu_percent": runtime / duration / 1e7,
                        "scheduler_wait_ms": wait / 1e6,
                        "scheduler_slices_per_second": (last[tid].get("slices", 0) - first[tid].get("slices", 0)) / duration,
                        "allowed": last[tid].get("allowed"),
                        "sampled_cpus": sorted({s["threads"][tid]["cpu"] for s in samples if tid in s["threads"]})})
    perf, presentation, guest_frames, audio, queues, apu, voices = [], [], [], [], [], [], []
    for line in log.splitlines():
        if " PERF mono_us=" in line:
            perf.append(metrics(line))
        elif " PRESENT_FRAME mono_us=" in line:
            presentation.append(metrics(line))
        elif " GUEST_FRAME mono_us=" in line:
            guest_frames.append(metrics(line))
        elif " PRESENT_QUEUE submitted=" in line:
            queues.append(metrics(line))
        elif " AUDIO_STATS backend=" in line:
            row = metrics(line)
            epoch = re.match(r"\s*(\d+\.\d+)\s", line)
            if epoch:
                row["epoch"] = float(epoch[1])
            audio.append(row)
        elif " APU_PROFILE elapsed_us=" in line:
            apu.append(metrics(line))
        elif " VOICE_PROFILE elapsed_us=" in line:
            voices.append(metrics(line))
    timing = {}
    if perf:
        elapsed = sum(row["elapsed_us"] for row in perf)
        for key in ("unique", "frames", "guest_flips", "refresh"):
            timing[key + "_per_second"] = sum(row.get(key, 0) for row in perf) / elapsed * 1e6
        timing["display_refresh_callbacks_per_second"] = timing["refresh_per_second"]
        for key in ("scanout_us", "conversion_us", "presenter_us", "bql_reacquire_us", "callback_us"):
            timing[key + "_per_second"] = sum(row.get(key, 0) for row in perf) / elapsed * 1e6
    successful = [row for row in presentation if row.get("ok")]
    if len(guest_frames) > 1:
        intervals = [b["mono_us"] - a["mono_us"] for a, b in zip(guest_frames, guest_frames[1:])]
        timing["unique_frame_interval_us"] = {"p50": percentile(intervals, .50), "p95": percentile(intervals, .95), "p99": percentile(intervals, .99), "max": max(intervals)}
        timing["unique_frame_gaps_over_1s"] = sum(interval > 1000000 for interval in intervals)
    if len(successful) > 1:
        intervals = [b["mono_us"] - a["mono_us"] for a, b in zip(successful, successful[1:])]
        timing["completed_presents_per_second"] = (len(successful) - 1) * 1e6 / (successful[-1]["mono_us"] - successful[0]["mono_us"])
        for name, values in (("presentation_interval", intervals),
                             ("presentation_service", [row["service_us"] for row in successful]),
                             ("presentation_queue", [row["queue_us"] for row in successful])):
            timing[name + "_us"] = {"p50": percentile(values, .50), "p95": percentile(values, .95), "p99": percentile(values, .99), "max": max(values)}
        timing["failed_presents"] = len(presentation) - len(successful)
    audio_result = {"observed_errors": sorted({row.get("error", 0) for row in audio})}
    if len(audio) > 1:
        for key in ("underrun_callbacks", "underrun_frames", "dropped_frames", "offered_frames", "consumed_frames", "callback_frames_total"):
            audio_result[key] = audio[-1].get(key, 0) - audio[0].get(key, 0)
        if "epoch" in audio[0] and "epoch" in audio[-1]:
            audio_result["counter_window_seconds"] = audio[-1]["epoch"] - audio[0]["epoch"]
        if audio_result["callback_frames_total"] > 0:
            audio_result["underrun_frame_fraction"] = audio_result["underrun_frames"] / audio_result["callback_frames_total"]
        rate = audio[-1].get("rate", 0)
        if rate:
            audio_result["production_minus_consumption_ms"] = (audio_result["offered_frames"] - audio_result["consumed_frames"]) / rate * 1000
    queue_window = {}
    if len(queues) > 1:
        queue_window = {key: queues[-1].get(key, 0) - queues[0].get(key, 0)
                        for key in ("submitted", "completed", "failed", "canceled", "blocked_us", "idle_us")}

    def work_summary(rows, counters, peaks):
        result = {"windows": len(rows)}
        elapsed = sum(row.get("elapsed_us", 0) for row in rows)
        if elapsed:
            result["elapsed_seconds"] = elapsed / 1e6
            for key in counters:
                result[key + "_per_second"] = sum(row.get(key, 0) for row in rows) / elapsed * 1e6
            for key in peaks:
                result[key] = max(row.get(key, 0) for row in rows)
        return result

    apu_result = work_summary(apu, ("frames", "vp_us", "dsp_us", "monitor_us", "ep_batches", "ep_budget_overruns"), ("ep_work_peak_us", "ep_budget_us"))
    if apu and sum(row.get("ep_batches", 0) for row in apu):
        apu_result["ep_budget_overrun_fraction"] = sum(row.get("ep_budget_overruns", 0) for row in apu) / sum(row["ep_batches"] for row in apu)
    voice_result = work_summary(voices, ("frames", "jobs", "barrier_us", "voice_lock_us", "worker_work_us", "worker_lock_wait_us", "worker_mix_hold_us", "worker_wait_us", "worker_wakes"), ("queue_peak", "worker_queue_peak"))
    voice_result["workers_seen"] = sorted({row["workers"] for row in voices})
    voice_result["background_workers_seen"] = sorted({row.get("background_workers", row["workers"]) for row in voices})
    voice_result["apu_participation_seen"] = sorted({row.get("apu_participates", 0) for row in voices})
    frequencies = {}
    for policy in samples[0]["frequencies"]:
        values = [sample["frequencies"][policy] for sample in samples if policy in sample["frequencies"]]
        frequencies[policy] = {"min_khz": min(values), "median_khz": statistics.median(values), "max_khz": max(values)}
    thermal = {}
    for sample in samples:
        for sensor, value in sample.get("thermal", {}).items():
            thermal[sensor] = max(thermal.get(sensor, value), value)
    return {"duration_seconds": duration,
            "snapshot_spacing_seconds": {"min": min(spacing), "median": statistics.median(spacing), "max": max(spacing)},
            "threads": sorted(threads, key=lambda row: -row["cpu_percent"]),
            "timing": timing, "perf_windows": len(perf), "presentation_queue": queues[-1] if queues else {},
            "presentation_queue_window": queue_window, "apu": apu_result, "voice_workers": voice_result,
            "audio": audio_result, "cpu_frequencies": frequencies, "thermal_peak_raw": thermal,
            "battery_temperature_start_tenths_c": samples[0].get("battery_temperature_tenths_c"),
            "battery_temperature_end_tenths_c": samples[-1].get("battery_temperature_tenths_c"),
            "rss_start_bytes": samples[0]["resident_pages"] * page_size,
            "rss_end_bytes": samples[-1]["resident_pages"] * page_size,
            "emulation_speed_percent": None, "native_title_cadence_fps": None}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("label")
    parser.add_argument("--duration", type=int, default=60)
    parser.add_argument("--process", default="org.boxdroid:emulator")
    parser.add_argument("--perf", action="store_true", help="also record 500 Hz native CPU samples")
    parser.add_argument("--note", default="", help="scene, game/version, settings and build identity")
    parser.add_argument("--output", type=Path, default=Path("build/performance/deep-optimization"))
    args = parser.parse_args()
    if not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9._-]*", args.label):
        parser.error("label must contain only letters, numbers, dots, underscores or hyphens")
    if args.duration < 2:
        parser.error("duration must be at least 2 seconds")
    directory = args.output / args.label
    directory.mkdir(parents=True, exist_ok=False)
    pid = int(adb("shell", "pidof", args.process))
    page_size = int(adb("shell", "getconf", "PAGESIZE"))
    controls = {name: adb("shell", "getprop", "debug.boxdroid." + name)
                for name in ("profile", "diagnostics", "async_present", "voice_workers", "voice_apu", "dsp_jit", "tcg_prime")}
    metadata = {"pid": pid, "process": args.process, "note": args.note,
                "page_size": page_size, "wall_start_epoch": time.time(), "controls": controls}
    apk = adb("shell", "pm", "path", "org.boxdroid").splitlines()[0].removeprefix("package:")
    if re.fullmatch(r"/[A-Za-z0-9/_=~.\-]+", apk):
        metadata["installed_apk_path"] = apk
        metadata["apk_sha256"] = adb("shell", "sha256sum", apk).split()[0]
    directory.joinpath("metadata.json").write_text(json.dumps(metadata, indent=2))
    directory.joinpath("device.txt").write_text(adb("shell", "getprop") + "\n" + adb("shell", "dumpsys", "battery"))
    io_begin = process_io(pid)
    samples = []
    with directory.joinpath("logcat.txt").open("w") as output:
        logger = subprocess.Popen(["adb", "logcat", "-T", "1", "-v", "epoch", f"--pid={pid}"], stdout=output, stderr=subprocess.DEVNULL)
        perf = None
        if args.perf:
            perf = subprocess.Popen(["adb", "shell", "run-as", "org.boxdroid", "simpleperf", "record", "-p", str(pid),
                                     "-e", "cpu-clock", "-f", "500", "-g", "--duration", str(args.duration),
                                     "-o", f"files/{args.label}-profile.data"])
        try:
            begin = time.monotonic()
            while True:
                samples.append(snapshot(pid))
                elapsed = time.monotonic() - begin
                if elapsed >= args.duration:
                    break
                time.sleep(min(1, args.duration - elapsed))
        finally:
            logger.terminate()
            logger.wait()
            if perf:
                if perf.wait() != 0:
                    raise RuntimeError("simpleperf capture failed; this run is not a valid native profile")
                with directory.joinpath("perf.data").open("wb") as perf_output:
                    subprocess.run(["adb", "exec-out", "run-as", "org.boxdroid", "cat", f"files/{args.label}-profile.data"], stdout=perf_output, check=True)
    directory.joinpath("samples.json").write_text(json.dumps(samples, indent=2))
    io_end = process_io(pid)
    directory.joinpath("process-io.json").write_text(json.dumps({"begin": io_begin, "end": io_end}, indent=2))
    directory.joinpath("device-end.txt").write_text(adb("shell", "dumpsys", "battery") + "\n" + adb("shell", "dumpsys", "thermalservice"))
    result = summarize(samples, directory.joinpath("logcat.txt").read_text(), page_size)
    result["process_io"] = summarize_process_io(io_begin, io_end)
    directory.joinpath("summary.json").write_text(json.dumps(result, indent=2))
    print(json.dumps({key: result[key] for key in ("duration_seconds", "timing", "audio", "cpu_frequencies", "battery_temperature_start_tenths_c", "battery_temperature_end_tenths_c")}, indent=2))


if __name__ == "__main__":
    main()
