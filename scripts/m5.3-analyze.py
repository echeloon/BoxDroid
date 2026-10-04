#!/usr/bin/env python3
"""Analyze bounded M5.3 captures; successful presents never substitute for unique FPS."""
import argparse
import json
import pathlib
import re

parser = argparse.ArgumentParser()
parser.add_argument('results', type=pathlib.Path)
args = parser.parse_args()
root = args.results
log = (root / 'logcat.txt').read_text()

def fields(line):
    return dict(re.findall(r'(\w+)=([^ ]+)', line))

def events(name):
    return [fields(line) for line in log.splitlines() if f': {name} ' in line]

def number(row, key):
    return float(row.get(key, '0').rstrip('%'))

def thread_sample(sample):
    result = {}
    for line in sample['data'].splitlines():
        match = re.match(r'(\d+) \((.*)\) (.*)', line)
        if not match:
            continue
        tid, name, tail = match.groups()
        fields = tail.split()
        if len(fields) > 36:
            result[int(tid)] = {'name': name, 'ticks': int(fields[11])+int(fields[12]),
                                'state': fields[0], 'cpu': int(fields[36])}
    return result

thread_records = [json.loads(line) for line in (root/'threads.jsonl').read_text().splitlines()]
thread_window = [sample for sample in thread_records if 4 <= sample['seconds'] <= 12]
thread_rates = []
if len(thread_window) >= 2:
    start, end = thread_window[0], thread_window[-1]
    before, after = thread_sample(start), thread_sample(end)
    elapsed = end['seconds']-start['seconds']
    # Android CLK_TCK was checked as 100 on the target; capture it explicitly
    # for new runs rather than assuming a cross-device kernel constant.
    ticks_per_second = int((root/'clock-ticks.txt').read_text()) if (root/'clock-ticks.txt').exists() else 100
    for tid in before.keys() & after.keys():
        thread_rates.append({'tid': tid, 'name': after[tid]['name'],
            'one_core_cpu_pct': 100*(after[tid]['ticks']-before[tid]['ticks'])/ticks_per_second/elapsed,
            'last_state': after[tid]['state'], 'last_cpu': after[tid]['cpu']})
    thread_rates.sort(key=lambda row: row['one_core_cpu_pct'], reverse=True)
roles = {}
for role, marker in [('vCPU', 'AV_MODE_OBSERVER'), ('PFIFO', 'NV_RENDER'), ('mainloop_presenter', 'PERF')]:
    for line in log.splitlines():
        if f': {marker} ' in line:
            parts = line.split()
            roles[role] = int(parts[3])
            break

# Baselines predate some M5.3-specific markers; existing device diagnostics
# identify the writer/PFIFO threads without guessing from generic names.
for role, marker in [('vCPU', 'event=PCRTC_START '), ('PFIFO', 'event=SURFACE_CREATE ')]:
    if role in roles:
        continue
    for line in log.splitlines():
        if marker in line:
            roles[role] = int(line.split()[3])
            break

rows = events('PERF')
green = [i for i, row in enumerate(rows) if number(row, 'green') > 0]
# Include every interval between first and last changing green output,
# including intervening zero-frame intervals. Never pick only fast buckets.
animated = rows[green[0]:green[-1]+1] if green else []
seconds = sum(number(row, 'elapsed_us') for row in animated) / 1e6
unique = sum(number(row, 'unique') for row in animated)
frames = sum(number(row, 'frames') for row in animated)
mode = events('ACTIVE_GUEST_MODE')
target = number(mode[-1], 'target_hz') if mode else None
telemetry = events('OVERLAY_SAMPLE')
wsi = events('WSI')
wsi_frames = sum(number(row, 'frames') for row in wsi)
summary = {
    'process': (root / 'process.txt').read_text().strip().splitlines(),
    'active_guest_mode': mode,
    'thread_window_seconds': [thread_window[0]['seconds'],thread_window[-1]['seconds']] if thread_window else [],
    'thread_roles': roles,
    'thread_cpu_rates': thread_rates,
    'animated_interval_seconds': seconds,
    'unique_guest_fps': unique / seconds if seconds else None,
    'delivered_frames_per_second': frames / seconds if seconds else None,
    'guest_flips_per_second': sum(number(row, 'guest_flips') for row in animated) / seconds if seconds and any('guest_flips' in r for r in animated) else None,
    'refresh_callbacks_per_second': sum(number(row, 'refresh') for row in animated) / seconds if seconds else None,
    'duplicate_delivery_fraction': (frames-unique) / frames if frames else None,
    'mean_unique_frame_interval_ms': 1000 * seconds / unique if unique else None,
    'animated_buckets': animated,
    'stage_ms_per_delivered_frame': {
        key: sum(number(row, key) for row in animated) / frames / 1000
        for key in ('scanout_us', 'bql_reacquire_us', 'conversion_us', 'presenter_us')
    } if frames else {},
    'wsi_ms_per_frame': {
        key: sum(number(row, key) for row in wsi) / wsi_frames / 1000
        for key in ('acquire_us', 'prepare_us', 'submit_us', 'present_us', 'idle_us')
    } if wsi_frames else {},
    'overlay_samples': telemetry,
    'overlay_sample_count': len(telemetry),
    'clean_shutdown': 'M5_SHUTDOWN_COMPLETE' in log and 'VULKAN_SHUTDOWN_CLEAN' in log,
    'fatal_crash_signature': bool(re.search(r'Fatal signal|FATAL EXCEPTION|Abort message|tombstone', (root/'crash-buffer.txt').read_text(), re.I)),
    'crash_buffer_bytes': (root/'crash-buffer.txt').stat().st_size,
    'video_summary': events('M5_VIDEO_SUMMARY'),
    'vulkan_diagnostics': next((json.loads(line.split('VULKAN_DIAGNOSTICS=',1)[1]) for line in log.splitlines() if 'VULKAN_DIAGNOSTICS=' in line), {}),
    'guest_io_summary': events('M5_HDD_GUEST_IO_SUMMARY'),
    'performance_acceptance': 'PARTIAL',
}
# Visual confirmation remains a separate required step. No automatic PASS.
if target and summary['unique_guest_fps'] is not None:
    summary['target_fraction'] = summary['unique_guest_fps'] / target
    summary['meets_rate_threshold'] = summary['unique_guest_fps'] >= target * (58 / 60)
(root / 'performance-summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print(json.dumps({key: summary[key] for key in (
    'unique_guest_fps', 'guest_flips_per_second', 'delivered_frames_per_second',
    'refresh_callbacks_per_second', 'duplicate_delivery_fraction', 'mean_unique_frame_interval_ms',
    'overlay_sample_count', 'clean_shutdown', 'crash_buffer_bytes', 'performance_acceptance')}, indent=2))
