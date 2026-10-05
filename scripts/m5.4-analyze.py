#!/usr/bin/env python3
"""Extend M5.3 content accounting with M5.4 execution/scheduler observations.

C dispatch and indirect lookup counts are NOT counts of every chained TB.
Only complete execution windows inside the changing-green interval are used.
No rate threshold manufactures a visual PASS.
"""
import json
import pathlib
import re
import runpy
import sys

root = pathlib.Path(sys.argv[1])
runpy.run_path(str(pathlib.Path(__file__).with_name('m5.3-analyze.py')), run_name='__main__')
summary = json.loads((root / 'performance-summary.json').read_text())
log = (root / 'logcat.txt').read_text()

def events(name):
    return [dict(re.findall(r'(\w+)=([^ ]+)', line)) for line in log.splitlines()
            if f': {name} ' in line]

def value(row, key):
    return float(row.get(key, '0'))

rows = events('PERF')
# Current boot-reference analysis, not an emulator surface-selection rule.
# A green-valued transition into direct VGA can otherwise extend the window
# across seconds of static logo. Retain the inherited metric for comparison.
green = [i for i, row in enumerate(rows) if value(row, 'green') > 0 and
         int(row.get('pcrtc', '0'), 0) == 0x32a4000]
animated = rows[green[0]:green[-1] + 1] if green else []
animation_seconds = sum(value(row, 'elapsed_us') for row in animated) / 1e6
animation_frames = sum(value(row, 'frames') for row in animated)
animation_unique = sum(value(row, 'unique') for row in animated)
start = value(animated[0], 'mono_us') - value(animated[0], 'elapsed_us') if animated else 0
end = value(animated[-1], 'mono_us') if animated else 0
def log_seconds(line):
    hours, minutes, seconds = line.split()[1].split(':')
    return 3600 * int(hours) + 60 * int(minutes) + float(seconds)

# Logcat wall timestamps align sparse overlay samples to PERF's monotonic
# window. Runs crossing midnight are not used for this overlay summary.
perf_line = next((line for line in log.splitlines() if ': PERF ' in line), None)
overlay = []
if perf_line and animated:
    wall_offset = log_seconds(perf_line) - value(rows[0], 'mono_us') / 1e6
    overlay = [dict(re.findall(r'(\w+)=([^ ]+)', line)) for line in log.splitlines()
               if ': OVERLAY_SAMPLE ' in line and
               start / 1e6 + wall_offset <= log_seconds(line) <= end / 1e6 + wall_offset]
windows = [row for row in events('EXEC_WINDOW') if
           value(row, 'mono_us') - value(row, 'elapsed_us') >= start and
           value(row, 'mono_us') <= end]
seconds = sum(value(row, 'elapsed_us') for row in windows) / 1e6
sums = {key: sum(value(row, key) for row in windows) for key in (
    'dispatch', 'idle', 'returns', 'chain_returns', 'exit0', 'exit1', 'requested',
    'lookup_hit', 'lookup_miss', 'mmio_reads', 'mmio_writes')}

# These are thread CPU tick deltas, not whole-device utilization per thread.
roles = summary['thread_roles']
thread_cpu = {role: next((row['one_core_cpu_pct'] for row in summary['thread_cpu_rates']
                         if row['tid'] == tid), None) for role, tid in roles.items()}
apu = next((row for row in summary['thread_cpu_rates'] if 'apu_thread' in row['name']), None)
if apu:
    thread_cpu['APU'] = apu['one_core_cpu_pct']
thread_samples = [json.loads(line) for line in (root / 'threads.jsonl').read_text().splitlines()]
placements = {}
for sample in thread_samples:
    for line in sample['data'].splitlines():
        match = re.match(r'(\d+) \((.*)\) (.*)', line)
        if not match:
            continue
        tid, name, fields = match.group(1), match.group(2), match.group(3).split()
        if len(fields) <= 36:
            continue
        row = placements.setdefault(tid, {'name': name, 'cpus': {}, 'states': {}, 'observed_migrations': 0, 'last_cpu': None})
        cpu, state = fields[36], fields[0]
        row['cpus'][cpu] = row['cpus'].get(cpu, 0) + 1
        row['states'][state] = row['states'].get(state, 0) + 1
        row['observed_migrations'] += row['last_cpu'] is not None and row['last_cpu'] != cpu
        row['last_cpu'] = cpu

render = events('NV_RENDER')
fences = [row for row in render if row['kind'] == '2']
fence_calls = sum(value(row, 'calls') for row in fences)
mainloop = events('MAINLOOP')
main_seconds = sum(value(row, 'elapsed_us') for row in mainloop) / 1e6
execution = {
    'measurement_limits': [
        'C dispatch samples overrepresent interrupt-shadow exits in the kernel idle loop.',
        'Indirect lookup samples exclude direct chained jumps; they are not all-TB profiles.',
        'chain_returns records last TB != first TB, not an exact chaining rate.',
        'Device-access counters cover instrumented devices, not every possible MMIO/I/O exit.',
        'One-second scheduler samples miss migrations between samples.',
        'Useful vCPU wall time and per-producer IRQ latency are not established by these counters.',
    ],
    'execution_windows_seconds': seconds,
    'accelerated_animation_seconds': animation_seconds,
    'accelerated_animation_unique_fps': animation_unique / animation_seconds if animation_seconds else None,
    'accelerated_animation_present_fps': animation_frames / animation_seconds if animation_seconds else None,
    'accelerated_animation_flip_fps': sum(value(row, 'guest_flips') for row in animated) / animation_seconds if animation_seconds else None,
    'accelerated_animation_duplicate_fraction': (animation_frames - animation_unique) / animation_frames if animation_frames else None,
    'accelerated_animation_mean_frame_ms': animation_seconds * 1000 / animation_unique if animation_unique else None,
    'accelerated_animation_buckets': animated,
    'animation_stage_ms_per_delivered_frame': {
        key: sum(value(row, key) for row in animated) / animation_frames / 1000
        for key in ('scanout_us', 'bql_reacquire_us', 'conversion_us', 'presenter_us')
    } if animation_frames else {},
    'animation_overlay_samples': overlay,
    'execution_windows': windows,
    'rates': {key + '_per_second': count / seconds if seconds else None for key, count in sums.items()},
    'idle_outer_dispatch_fraction': sums['idle'] / sums['dispatch'] if sums['dispatch'] else None,
    'indirect_lookup_hit_fraction': sums['lookup_hit'] / (sums['lookup_hit'] + sums['lookup_miss']) if sums['lookup_hit'] + sums['lookup_miss'] else None,
    'lookup_sample': events('LOOKUP_SAMPLE'),
    'lookup_top_pcs': events('LOOKUP_PC'),
    'legacy_outer_dispatch_sample': events('TB_SAMPLE'),
    'legacy_outer_dispatch_top': events('TB_TOP'),
    'thread_cpu_one_core_pct': thread_cpu,
    'scheduler_placements': placements,
    'renderer_fence_calls': fence_calls,
    'renderer_mean_fence_ms': sum(value(row, 'total_us') for row in fences) / fence_calls / 1000 if fence_calls else None,
    'renderer_maximum_fence_ms': max((value(row, 'maximum_us') for row in fences), default=0) / 1000,
    'mainloop_bql_wait_ms_per_second': sum(value(row, 'bql_us') for row in mainloop) / main_seconds / 1000 if main_seconds else None,
    'mainloop_maximum_bql_ms': max((value(row, 'max_bql_us') for row in mainloop), default=0) / 1000,
    'renderer_metrics': render,
    'bql_slow_holds': events('BQL_HOLD'),
    'performance_acceptance': 'PARTIAL',
}
(root / 'execution-summary.json').write_text(json.dumps(execution, indent=2) + '\n')
print(json.dumps({key: execution[key] for key in ('execution_windows_seconds', 'idle_outer_dispatch_fraction', 'indirect_lookup_hit_fraction', 'thread_cpu_one_core_pct', 'renderer_mean_fence_ms')}))
