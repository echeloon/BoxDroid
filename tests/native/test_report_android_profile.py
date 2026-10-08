import contextlib
import importlib.util
import io
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

MODULE_PATH = Path(__file__).resolve().parents[2] / "scripts/report-android-profile.py"
SPEC = importlib.util.spec_from_file_location("report_android_profile", MODULE_PATH)
report = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(report)


class NativeReportTest(unittest.TestCase):
    def test_resolves_both_simpleperf_offset_formats(self):
        raw = "10% TCG libboxdroid.so[+13ecfc0]\n5% APU libboxdroid.so[+0x1155fe8]\n"
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            library = directory / "exact.so"
            library.touch()
            arguments = ["report-android-profile.py", str(directory), "--library", str(library)]
            symbols = "apu_frame\napu.c:1\nqemu_thread\nthread.c:1\n"
            with patch("sys.argv", arguments), patch.object(
                report.subprocess, "check_output", side_effect=[raw, symbols]
            ) as execute, contextlib.redirect_stdout(io.StringIO()):
                report.main()
            self.assertEqual(execute.call_args_list[1].args[0][-2:],
                             ["0x1155fe8", "0x13ecfc0"])
            resolved = (directory / "native-report-resolved.txt").read_text()
            self.assertEqual(resolved, "10% TCG qemu_thread\n5% APU apu_frame\n")


if __name__ == "__main__":
    unittest.main()
