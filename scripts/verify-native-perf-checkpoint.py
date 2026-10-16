#!/usr/bin/env python3
"""Verify the saved performance checkpoint using files only; never build or run it."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tarfile
import tempfile

ROOT = Path(__file__).resolve().parent.parent
RECORD = ROOT / 'docs/performance/native-perf-20261013'
PIN = '478b4f496102379c7eaa7f3ec10e714a703c4300'
OVERLAYS = {
    'system/boxdroid-xbox-runtime.c': 'boxdroid-xbox-runtime.c',
    'system/boxdroid-xbox-settings.c': 'boxdroid-xbox-settings.c',
    'system/boxdroid.map': 'boxdroid.map',
    'system/boxdroid-vulkan-presenter.cpp': 'boxdroid-vulkan-presenter.cpp',
    'system/boxdroid-frame-queue.h': 'boxdroid-frame-queue.h',
    'hw/xbox/nv2a/boxdroid-diagnostics.h': 'boxdroid-diagnostics.h',
    'system/boxdroid-diagnostics.h': 'boxdroid-diagnostics.h',
    'system/boxdroid-audio.c': 'boxdroid-audio.c',
    'system/boxdroid-audio.h': 'boxdroid-audio.h',
    'hw/xbox/mcpx/apu/boxdroid-audio.h': 'boxdroid-audio.h',
    'system/boxdroid-input.c': 'boxdroid-input.c',
    'system/boxdroid-input.h': 'boxdroid-input.h',
}


def sha256(path):
    digest = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            digest.update(chunk)
    return digest.hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, default=ROOT / 'build/native/source/xemu')
    parser.add_argument('--save-report', action='store_true')
    args = parser.parse_args()
    source = args.source.resolve()

    def source_git(*command, environment=None, input_data=None):
        return subprocess.check_output(
            ['git', '-C', str(source), *command], env=environment, input=input_data)

    assert source_git('rev-parse', 'HEAD').decode().strip() == PIN
    names = [name for name in (ROOT / 'patches/xemu/series').read_text().splitlines()
             if name and not name.startswith('#')]
    baseline = json.loads((RECORD / 'baseline-provenance.json').read_text())
    original = (RECORD / 'baseline-series.txt').read_text().splitlines()
    assert names[:len(original)] == original
    for name in original:
        path = ROOT / 'patches/xemu' / name
        assert sha256(path) == baseline['patches'][str(path.relative_to(ROOT))], name

    # Verify archive integrity without executing or restoring historical scripts.
    evidence = json.loads((RECORD / 'evidence-index.json').read_text())
    assert sha256(RECORD / evidence['archive']) == evidence['archive_sha256']
    archived_count = 0
    with tarfile.open(RECORD / evidence['archive'], 'r:gz') as archive:
        for member in archive:
            if not member.isfile():
                continue
            expected = evidence['files'][member.name]
            stream = archive.extractfile(member)
            digest = hashlib.sha256()
            for chunk in iter(lambda: stream.read(1024 * 1024), b''):
                digest.update(chunk)
            assert member.size == expected['bytes'], member.name
            assert digest.hexdigest() == expected['sha256'], member.name
            archived_count += 1
    assert archived_count == len(evidence['files'])

    generated_files = {}
    with tempfile.TemporaryDirectory(prefix='boxdroid-checkpoint-') as directory:
        directory = Path(directory)
        environment = dict(os.environ, GIT_INDEX_FILE=str(directory / 'index'))
        source_git('read-tree', PIN, environment=environment)
        for name in names:
            source_git('apply', '--cached', '--unidiff-zero',
                       str(ROOT / 'patches/xemu' / name), environment=environment)
        # Covers the whole tracked tree, including files not touched by this run.
        source_git('diff', '--exit-code', '--ignore-submodules=all', environment=environment)
        final_paths = set(filter(None, source_git(
            'diff', '--cached', '--name-only', '-z', PIN,
            environment=environment).decode().split('\0')))
        indexed_paths = set(filter(None, source_git(
            'ls-files', '-z', environment=environment).decode().split('\0')))
        untracked = set(filter(None, source_git(
            'ls-files', '--others', '--exclude-standard', '-z').decode().split('\0')))
        assert not (untracked - indexed_paths - set(OVERLAYS)), sorted(
            untracked - indexed_paths - set(OVERLAYS))

        # Also reproduce the real preparation path: apply each patch to pristine
        # files in a separate worktree, then copy the Android overlays. The real
        # checkout and real Git indexes are never modified.
        worktree = directory / 'source'
        worktree.mkdir()
        work_environment = dict(environment, GIT_WORK_TREE=str(worktree))
        source_git('read-tree', PIN, environment=work_environment)
        touched = set(final_paths)
        for name in names:
            patch = (ROOT / 'patches/xemu' / name).read_text()
            for before, after in re.findall(r'^diff --git a/(\S+) b/(\S+)$', patch, re.M):
                touched.update((before, after))
            # Some original patches have unified headers without diff --git.
            touched.update(re.findall(r'^(?:--- a/|\+\+\+ b/)(\S+)', patch, re.M))
        pristine = set(filter(None, source_git(
            'ls-files', '-z', environment=work_environment).decode().split('\0')))
        checkout_paths = sorted(touched & pristine)
        source_git('checkout-index', '--force', '--prefix=' + str(worktree) + '/',
                   '--stdin', '-z', environment=work_environment,
                   input_data=('\0'.join(checkout_paths) + '\0').encode())
        git_dir = source_git('rev-parse', '--absolute-git-dir').decode().strip()
        for name in names:
            command = ['git', '-C', str(worktree), '--git-dir=' + git_dir,
                       '--work-tree=' + str(worktree), 'apply', '--unidiff-zero']
            path = str(ROOT / 'patches/xemu' / name)
            subprocess.run(command + ['--check', path], env=work_environment, check=True)
            subprocess.run(command + [path], env=work_environment, check=True)
        for destination, name in OVERLAYS.items():
            target = worktree / destination
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes((ROOT / 'native/android/core' / name).read_bytes())
        for name in sorted(touched | final_paths | set(OVERLAYS)):
            actual, reconstructed = source / name, worktree / name
            assert actual.exists() == reconstructed.exists(), name
            if actual.is_file():
                assert actual.read_bytes() == reconstructed.read_bytes(), name
                generated_files[name] = sha256(actual)

    dependencies = json.loads((RECORD / 'dependencies.json').read_text())
    for dependency in dependencies:
        path = source / dependency['path']
        def git(*command):
            return subprocess.check_output(['git', '-C', str(path), *command], text=True).strip()
        assert git('rev-parse', 'HEAD') == dependency['head'], dependency['path']
        assert not git('status', '--porcelain', '--untracked-files=no'), dependency['path']

    checkpoint_path = RECORD / 'checkpoint.json'
    if checkpoint_path.exists():
        checkpoint = json.loads(checkpoint_path.read_text())
        assert generated_files == checkpoint['generated_source_files']
        for name, digest in checkpoint['downstream_inputs'].items():
            assert sha256(ROOT / name) == digest, name
    report = {
        'verification_kind': 'Filesystem reconstruction and archive integrity only; no runtime tests',
        'source_pin': PIN,
        'ordered_patches': len(names),
        'baseline_patches_unchanged': len(original),
        'reconstructed_source_files': len(generated_files),
        'android_overlay_destinations': len(OVERLAYS),
        'archived_evidence_files_verified': archived_count,
        'whole_tracked_tree_matches_reconstructed_index': True,
        'worktree_patch_application_and_overlay_copy_match_byte_for_byte': True,
        'unexported_nonignored_source_files': [],
        'nested_dependency_tracked_changes': [],
        'generated_source_files': generated_files,
    }
    if args.save_report:
        (RECORD / 'reconstruction-verification.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({key: value for key, value in report.items()
                      if key != 'generated_source_files'}, indent=2))


if __name__ == '__main__':
    main()
