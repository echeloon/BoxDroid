#!/usr/bin/env python3
"""Verify the complete ordered patch series without altering the source tree."""

import os
from pathlib import Path
import subprocess
import sys
import tempfile


def main():
    source = Path(sys.argv[1]).resolve()
    root = Path(__file__).resolve().parent.parent
    pin = sys.argv[2]
    # Later patches can replace earlier hunks; reversing each patch separately
    # against the final tree cannot verify an ordered series. Reconstruct its
    # expected index instead, leaving both real indexes and worktrees intact.
    with tempfile.TemporaryDirectory(prefix="boxdroid-patch-index-") as directory:
        environment = dict(os.environ, GIT_INDEX_FILE=str(Path(directory) / "index"))

        def git(*args):
            return subprocess.run(["git", "-C", str(source), *args], env=environment, check=True)

        git("read-tree", pin)
        for name in (root / "patches/xemu/series").read_text().splitlines():
            if name:
                git("apply", "--cached", "--unidiff-zero", str(root / "patches/xemu" / name))
        git("diff", "--exit-code", "--ignore-submodules=all")
    print("Verified complete ordered downstream patch series")


if __name__ == "__main__":
    main()
