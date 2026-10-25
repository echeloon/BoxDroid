#!/usr/bin/env python3
"""Stress the exact production lock functions; require a negative control to fail."""
import argparse
from pathlib import Path
import signal
import subprocess

ROOT = Path(__file__).resolve().parents[2]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--android', action='store_true')
parser.add_argument('--source', type=Path, default=ROOT / 'build/native/source/xemu')
args = parser.parse_args()
out = ROOT / 'build/performance/forza-opt/handoff-tests'
out.mkdir(parents=True, exist_ok=True)


def block(text, marker):
    start = text.index(marker)
    opening = text.index('{', start)
    depth = 1
    end = opening + 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end]


apu = args.source / 'hw/xbox/mcpx/apu'
dsp = (apu / 'dsp/gp_ep.c').read_text()
frame = (apu / 'apu.c').read_text()
code = '\n\n'.join(block(dsp, 'static void ' + name)
                    for name in ('dsp_write_lock(', 'dsp_write_unlock('))
code += '\n\nstatic void frame_handoff(MCPXAPUState *d)\n{\n'
code += block(frame, 'while (qatomic_read(&d->dsp_write_waiters)') + '\n}\n'
(out / 'apu-handoff-under-test.inc').write_text(code)
if args.android:
    compiler = str(Path.home() / 'Android/Sdk/ndk/30.0.16248370/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android33-clang')
else:
    compiler = 'cc'
for broken in (False, True):
    binary = out / ('handoff-negative' if broken else 'handoff-positive')
    command = [compiler, '-O2', '-g', '-pthread', '-I' + str(out)]
    if broken:
        command.append('-DBROKEN_HANDOFF')
    subprocess.run(command + [str(ROOT / 'scripts/tests/test-apu-dsp-handoff.c'),
                              '-o', str(binary)], check=True)
    if args.android:
        remote = '/data/local/tmp/boxdroid-' + binary.name
        subprocess.run(['adb', 'push', str(binary), remote], check=True)
        command = ['adb', 'shell', remote]
    else:
        command = [str(binary)]
    result = subprocess.run(command, capture_output=True, text=True, timeout=15)
    (out / (binary.name + ('-android' if args.android else '-host') + '.log')).write_text(result.stdout + result.stderr)
    print(result.stdout, end='')
    if broken:
        assert result.returncode in (-signal.SIGALRM, 128 + signal.SIGALRM), (
            'negative control must fail its progress deadline', result.returncode,
            result.stderr)
        print('PASS: saturated owner without handoff fails to make progress')
    else:
        assert result.returncode == 0, result.stderr
