#!/usr/bin/env python3
"""Checkpoint the current generated-source delta after the earlier patch series."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
PIN = '478b4f496102379c7eaa7f3ec10e714a703c4300'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('name')
    parser.add_argument('--note', default='Experimental preservation checkpoint; acceptance pending.')
    args = parser.parse_args()
    if Path(args.name).name != args.name or not args.name.endswith('.patch'):
        parser.error('name must be a patch filename')
    source = ROOT / 'build/native/source/xemu'
    series = ROOT / 'patches/xemu/series'
    names = series.read_text().splitlines()
    if args.name in names:
        assert names[-1] == args.name, 'Only the last experimental patch may be refreshed'
    baseline = json.loads((ROOT / 'docs/performance/native-perf-20261013/baseline-provenance.json').read_text())
    for name, digest in baseline['patches'].items():
        assert hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == digest, name
    with tempfile.TemporaryDirectory(prefix='boxdroid-experiment-index-') as directory:
        env = dict(os.environ, GIT_INDEX_FILE=str(Path(directory) / 'index'))
        def git(*command):
            return subprocess.check_output(['git', '-C', str(source), *command], env=env)
        assert git('rev-parse', 'HEAD').decode().strip() == PIN
        git('read-tree', PIN)
        for name in names:
            if name and name != args.name:
                git('apply', '--cached', '--unidiff-zero', str(ROOT / 'patches/xemu' / name))
        diff = git('diff', '--binary')
        assert diff, 'No source delta to export'
        patch = ROOT / 'patches/xemu' / args.name
        patch.write_bytes(('# ' + args.note.replace('\n', '\n# ') + '\n\n').encode() + diff)
        if args.name not in names:
            names.append(args.name)
            series.write_text('\n'.join(names) + '\n')
        print(git('diff', '--stat').decode())
        print('Checkpoint SHA256:', hashlib.sha256(patch.read_bytes()).hexdigest())


if __name__ == '__main__':
    main()
