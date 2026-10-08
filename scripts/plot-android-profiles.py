#!/usr/bin/env python3
"""Plot capture-local cadence and callback costs (requires matplotlib).

Example: --capture Baseline=build/performance/run-a --capture Candidate=... \
         --output docs/performance/title.svg
"""

import argparse
from pathlib import Path
import re

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt


def rows(directory):
    values = []
    for line in (directory / "logcat.txt").read_text().splitlines():
        if " PERF mono_us=" not in line:
            continue
        row = {key: int(value) for key, value in re.findall(r"(\w+)=(-?\d+)", line)}
        if row.get("elapsed_us", 0) > 0:
            values.append(row)
    if not values:
        raise ValueError(f"No PERF windows in {directory}")
    return values


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--capture", action="append", required=True, help="Label=capture_directory")
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--title", default="Stationary scene comparison")
    args = parser.parse_args()
    figure, axes = plt.subplots(2, 1, figsize=(9, 6), sharex=True, layout="constrained")
    for item in args.capture:
        label, directory = item.split("=", 1)
        data = rows(Path(directory))
        start = data[0]["mono_us"]
        elapsed, cadence, callback = [], [], []
        for index, row in enumerate(data):
            window = data[max(0, index - 9):index + 1]
            duration = sum(value["elapsed_us"] for value in window)
            elapsed.append((row["mono_us"] - start) / 1e6)
            cadence.append(sum(value["unique"] for value in window) * 1e6 / duration)
            callback.append(sum(value["callback_us"] for value in window) * 1000 / duration)
        axes[0].plot(elapsed, cadence, label=label, linewidth=1.6)
        axes[1].plot(elapsed, callback, label=label, linewidth=1.6)
    axes[0].set_ylabel("Changed images / second")
    axes[1].set_ylabel("Main callback wall ms / second")
    axes[1].set_xlabel("Seconds from capture start")
    axes[0].set_title(args.title + "\n10-window rolling values; native title cadence unknown")
    axes[0].legend(frameon=False)
    for axis in axes:
        axis.grid(alpha=.2)
        axis.set_ylim(bottom=0)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    figure.savefig(args.output)
    figure.savefig(args.output.with_suffix(".png"), dpi=160)
    print(args.output)


if __name__ == "__main__":
    main()
