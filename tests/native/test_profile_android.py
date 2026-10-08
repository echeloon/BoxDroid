import importlib.util
from pathlib import Path
import unittest

MODULE_PATH = Path(__file__).resolve().parents[2] / "scripts/profile-android.py"
SPEC = importlib.util.spec_from_file_location("profile_android", MODULE_PATH)
profile = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(profile)


class ProfileTest(unittest.TestCase):
    def test_process_io_endpoints_and_unavailable_counters(self):
        begin = {"monotonic_seconds": 10, "counters": {"rchar": 100, "read_bytes": 50, "syscr": 2}}
        end = {"monotonic_seconds": 12, "counters": {"rchar": 180, "read_bytes": 50, "syscr": 5}}
        result = profile.summarize_process_io(begin, end)
        self.assertEqual(result["counter_window_seconds"], 2)
        self.assertEqual(result["counters"], {"rchar": 80, "read_bytes": 0, "syscr": 3})
        self.assertFalse(result["counter_reset"])
        self.assertIsNone(profile.summarize_process_io(None, end))
        self.assertIsNone(profile.summarize_process_io(end, end))
        self.assertTrue(profile.summarize_process_io(
            begin, {"monotonic_seconds": 12, "counters": {"rchar": 0}})["counter_reset"])

    def test_stat_names_and_scheduler_time(self):
        fields = ["S"] + ["0"] * 49
        fields[36] = "7"
        raw = "\n".join([
            "100.00 20.0", "STAT 42 (voice (worker)) " + " ".join(fields),
            "SCHED 1000000 2000000 3", "AFFINITY Cpus_allowed_list: 4-7",
            "MEM 200 100", "FREQ /sys/devices/system/cpu/cpufreq/policy7 2841600",
            "THERMAL cpu-1-0-usr 62000", "BATTERY 340", "GPU_FREQ 305000000",
        ])
        parsed = profile.parse_snapshot(raw)
        self.assertEqual(parsed["threads"]["42"]["name"], "voice (worker)")
        self.assertEqual(parsed["threads"]["42"]["cpu"], 7)
        self.assertEqual(parsed["threads"]["42"]["allowed"], "4-7")
        self.assertEqual(parsed["resident_pages"], 100)
        self.assertEqual(parsed["thermal"]["cpu-1-0-usr"], 62000)

    def test_summary_separates_frames_and_detects_audio_error(self):
        def sample(uptime, runtime):
            return {"uptime": uptime, "threads": {"1": {"name": "TCG", "runtime_ns": runtime,
                    "wait_ns": 0, "cpu": 7, "allowed": "0-7"}},
                    "frequencies": {"policy7": 2841600}, "resident_pages": 100}

        log = "\n".join([
            " PERF mono_us=1000000 elapsed_us=1000000 unique=25 frames=50 guest_flips=25 refresh=50",
            " PRESENT_FRAME mono_us=1000000 queue_us=4 service_us=500 ok=1 async=1",
            " PRESENT_FRAME mono_us=1020000 queue_us=5 service_us=600 ok=1 async=1",
            " AUDIO_STATS backend=AAudio rate=48000 error=-899 offered_frames=0 consumed_frames=0",
            " AUDIO_STATS backend=AAudio rate=48000 error=-899 offered_frames=48000 consumed_frames=0",
        ])
        result = profile.summarize([sample(10, 0), sample(11, 500000000)], log, page_size=16384)
        self.assertEqual(result["threads"][0]["cpu_percent"], 50)
        self.assertEqual(result["snapshot_spacing_seconds"], {"min": 1, "median": 1, "max": 1})
        self.assertEqual(result["timing"]["unique_per_second"], 25)
        self.assertEqual(result["timing"]["completed_presents_per_second"], 50)
        self.assertEqual(result["audio"]["observed_errors"], [-899])
        self.assertEqual(result["audio"]["production_minus_consumption_ms"], 1000)
        self.assertEqual(result["rss_start_bytes"], 1638400)
        self.assertIsNone(result["emulation_speed_percent"])

    def test_worker_budgets_queue_deltas_and_audio_fraction(self):
        samples = [{"uptime": t, "threads": {}, "frequencies": {}, "resident_pages": 1}
                   for t in (10, 12)]
        log = "\n".join([
            " GUEST_FRAME mono_us=1000000",
            " GUEST_FRAME mono_us=1300000",
            " GUEST_FRAME mono_us=4300000",
            " PRESENT_QUEUE submitted=10 completed=9 failed=0 canceled=0 blocked_us=5 idle_us=100",
            " PRESENT_QUEUE submitted=20 completed=19 failed=0 canceled=0 blocked_us=8 idle_us=900",
            " VOICE_PROFILE elapsed_us=1000000 workers=4 frames=100 jobs=400 queue_peak=8 worker_queue_peak=2 barrier_us=10000 worker_wakes=400",
            " VOICE_PROFILE elapsed_us=1000000 workers=4 background_workers=3 apu_participates=1 frames=100 jobs=400 queue_peak=6 worker_queue_peak=2 barrier_us=20000 worker_wakes=400",
            " APU_PROFILE elapsed_us=1000000 frames=100 ep_batches=12 ep_budget_overruns=3 ep_budget_us=5333 ep_work_peak_us=6000",
            " APU_PROFILE elapsed_us=1000000 frames=100 ep_batches=12 ep_budget_overruns=1 ep_budget_us=5333 ep_work_peak_us=9000",
            " 100.00 1 1 I Audio: AUDIO_STATS backend=AAudio rate=48000 callback_frames_total=0 underrun_frames=0",
            " 110.00 1 1 I Audio: AUDIO_STATS backend=AAudio rate=48000 callback_frames_total=480000 underrun_frames=48000",
        ])
        result = profile.summarize(samples, log)
        self.assertEqual(result["presentation_queue_window"]["completed"], 10)
        self.assertEqual(result["timing"]["unique_frame_interval_us"]["max"], 3000000)
        self.assertEqual(result["timing"]["unique_frame_gaps_over_1s"], 1)
        self.assertEqual(result["presentation_queue_window"]["blocked_us"], 3)
        self.assertEqual(result["voice_workers"]["workers_seen"], [4])
        self.assertEqual(result["voice_workers"]["background_workers_seen"], [3, 4])
        self.assertEqual(result["voice_workers"]["apu_participation_seen"], [0, 1])
        self.assertEqual(result["voice_workers"]["worker_wakes_per_second"], 400)
        self.assertEqual(result["voice_workers"]["barrier_us_per_second"], 15000)
        self.assertEqual(result["voice_workers"]["queue_peak"], 8)
        self.assertAlmostEqual(result["apu"]["ep_budget_overrun_fraction"], 1 / 6)
        self.assertEqual(result["apu"]["ep_work_peak_us"], 9000)
        self.assertEqual(result["audio"]["counter_window_seconds"], 10)
        self.assertEqual(result["audio"]["underrun_frame_fraction"], .1)


if __name__ == "__main__":
    unittest.main()
