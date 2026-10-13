#!/usr/bin/env python3
"""Alternate checkpoint and candidate APKs in verified gameplay.

The checkpoint is a performance reference, not a correctness oracle. The
candidate's focused correctness tests must pass before this campaign. No game,
audio, driver, rendering or clock settings are changed. Every capture starts in
the same default gameplay scene, warms for 45 seconds, and runs 120 seconds.
Heavy diagnostics and ownership wait auditing are disabled.
"""
import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'build/production-correction'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('prefix')
    parser.add_argument('--candidate', type=Path, required=True)
    parser.add_argument('--order', type=int, choices=[3, 4], required=True)
    parser.add_argument('--titles', nargs='+', choices=['pandora', 'sega'],
                        default=['pandora', 'sega'])
    parser.add_argument('--initial-reference', help='Reuse a completed first-title reference capture immediately preceding this campaign')
    args = parser.parse_args()
    assert re.fullmatch(r'[\w.-]+', args.prefix)
    candidate = args.candidate.resolve()
    assert candidate.is_file()
    results = []
    for title in args.titles:
        for iteration, apk in enumerate([OUT / 'checkpoint.apk', candidate] * 2):
            kind = 'reference' if iteration % 2 == 0 else 'candidate'
            label = f'{args.prefix}-{title}-{kind}-{iteration // 2 + 1}'
            if title == args.titles[0] and iteration == 0 and args.initial_reference:
                assert re.fullmatch(r'[\w.-]+', args.initial_reference)
                directory = OUT / 'captures' / args.initial_reference
                summary = json.loads((directory / 'summary.json').read_text())
                metadata = json.loads((directory / 'metadata.json').read_text())
                # Reuse only a verified, diagnostic-free checkpoint capture.
                assert metadata['apk_sha256'] == hashlib.sha256(apk.read_bytes()).hexdigest()
                assert metadata['note'].startswith(title + ' verified gameplay;')
                for control in ['diagnostics', 'voice_audit', 'order_audit', 'sample_pc', 'fpu_audit']:
                    assert metadata['controls'][control] == '0'
                assert 'Verified capture complete:' in (OUT / (args.initial_reference + '.log')).read_text()
                results.append({'label': args.initial_reference, 'kind': kind, 'title': title,
                                'summary': summary, 'metadata': metadata})
                (OUT / (args.prefix + '-results.json')).write_text(json.dumps(results, indent=2))
                print('REUSE', args.initial_reference, flush=True)
                continue
            subprocess.run(['adb', 'shell', 'am', 'force-stop', 'org.boxdroid'], check=True)
            subprocess.run(['adb', 'install', '-r', str(apk)], check=True)
            for name, value in {'profile': 1, 'diagnostics': 0, 'voice_audit': 0,
                                'order_audit': 0, 'fpu_audit': 0, 'sample_pc': 0, 'voice_coarse': 0,
                                'fast_fpu': 1, 'tcg_ordered': args.order,
                                'async_present': 1, 'voice_workers': 4,
                                'voice_apu': 0, 'dsp_jit': 0, 'tcg_prime': 0}.items():
                subprocess.run(['adb', 'shell', 'setprop', 'debug.boxdroid.' + name,
                                str(value)], check=True)
            print('START', label, apk.name, flush=True)
            with (OUT / (label + '.log')).open('w') as log, \
                    (OUT / (label + '.boot.log')).open('w') as boot:
                logger = subprocess.Popen(['adb', 'logcat', '-T', '1', '-v', 'epoch',
                                           '-s', 'BoxDroid:I', 'BoxDroid3:I',
                                           'BoxDroidAudio:I', 'BoxDroidVoice:I',
                                           'AndroidRuntime:E', '*:S'], stdout=boot)
                try:
                    subprocess.run(['python3', str(ROOT / 'scripts/tests/correction-device.py'),
                                    title, label, '--duration', '120'],
                                   stdout=log, stderr=subprocess.STDOUT, check=True)
                finally:
                    logger.terminate()
                    logger.wait()
            directory = OUT / 'captures' / label
            result = {'label': label, 'kind': kind, 'title': title,
                      'summary': json.loads((directory / 'summary.json').read_text()),
                      'metadata': json.loads((directory / 'metadata.json').read_text())}
            results.append(result)
            (OUT / (args.prefix + '-results.json')).write_text(json.dumps(results, indent=2))
            print('RESULT', label, json.dumps(result['summary']['timing']), flush=True)


if __name__ == '__main__':
    main()
