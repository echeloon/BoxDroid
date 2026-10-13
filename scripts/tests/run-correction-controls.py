#!/usr/bin/env python3
"""Restart and measure independent correction controls in verified gameplay.

Install the candidate APK first. Each run resets the scene through the game's
menus, warms for 45 seconds, records 40 seconds, and checks gameplay again.
Results and APK/control provenance are saved under build/production-correction.
"""
import argparse
import json
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'build/production-correction'
CASES = {
    'ram-inline': (0, 1, 3),
    'ram-helper': (0, 1, 4),
    'ordering-reference': (0, 1, 0),
    'ordering-stores': (0, 1, 1),
    'fpu-reference': (0, 0, 4),
    'base': (1, 0, 0),
    'ownership-only': (0, 0, 0),
    'fpu-only': (1, 1, 0),
    'ordering-only': (1, 0, 4),
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('prefix')
    parser.add_argument('cases', nargs='+', choices=CASES)
    args = parser.parse_args()
    for name in args.cases:
        coarse, fpu, order = CASES[name]
        label = args.prefix + '-' + name
        for control, value in {'voice_coarse': coarse, 'fast_fpu': fpu,
                               'tcg_ordered': order, 'profile': 1,
                               'diagnostics': 0, 'order_audit': 0,
                               'sample_pc': 0, 'fpu_audit': 0, 'voice_audit': 1}.items():
            subprocess.run(['adb', 'shell', 'setprop',
                            'debug.boxdroid.' + control, str(value)], check=True)
        print('START', label, 'coarse/fpu/order=', coarse, fpu, order, flush=True)
        with (OUT / (label + '.log')).open('w') as log, \
                (OUT / (label + '.boot.log')).open('w') as boot:
            logger = subprocess.Popen(['adb', 'logcat', '-T', '1', '-v', 'epoch',
                                       '-s', 'BoxDroidVoice:I', 'BoxDroid:I',
                                       'BoxDroid3:I', 'BoxDroidAudio:I', '*:S'], stdout=boot)
            try:
                subprocess.run(['python3', str(ROOT / 'scripts/tests/correction-device.py'),
                                'pandora', label, '--duration', '40'],
                               stdout=log, stderr=subprocess.STDOUT, check=True)
            finally:
                logger.terminate()
                logger.wait()
        result = json.loads((OUT / 'captures' / label / 'summary.json').read_text())
        print('RESULT', label, json.dumps({key: result[key] for key in
              ['timing', 'guest_voice_ownership_wait', 'audio',
               'battery_temperature_start_tenths_c',
               'battery_temperature_end_tenths_c']}), flush=True)


if __name__ == '__main__':
    main()
