#!/usr/bin/env python3
"""Check the actual runtime policy for the optional diagnostic VRAM watch."""

from pathlib import Path
import re
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[2]
runtime = (ROOT / "native/android/core/boxdroid-xbox-runtime.c").read_text()
match = re.search(
    r"bool boxdroid_diag_vram_watch_enabled\(void\)\n\{.*?\n\}",
    runtime, re.S)
assert match, "Runtime watch policy is missing"
policies = []
for name in ("producers", "timings"):
    policy = re.search(
        r"bool boxdroid_diag_" + name + r"_enabled\(void\)\n\{.*?\n\}",
        runtime, re.S)
    assert policy, name
    policies.append(policy.group())
nv2a = (ROOT / "build/native/source/xemu/hw/xbox/nv2a/nv2a.c").read_text()
assert "if (boxdroid_diag_vram_watch_enabled() && qemu_get_cpu(0) &&" in nv2a
assert "memory_region_set_log(d->vram, true, DIRTY_MEMORY_NV2A);" in nv2a
assert "memory_region_set_log(d->vram, true, DIRTY_MEMORY_NV2A_TEX);" in nv2a

source = r'''
#include <assert.h>
#include <stdbool.h>
#include <string.h>
#define PROP_VALUE_MAX 92
#define ANDROID_LOG_INFO 4
#define TAG "test"
static bool detailed_diagnostics;
static bool diagnostic_producers_forced;
static bool diagnostic_timings_forced;
static const char *control;
static int __system_property_get(const char *name, char *value) {
    assert(!strcmp(name, "debug.boxdroid.vram_watch"));
    strcpy(value, control);
    return strlen(value);
}
static int __android_log_print(int priority, const char *tag,
                               const char *format, ...) { return 0; }
''' + match.group() + "\n" + "\n".join(policies) + r'''
int main(void) {
    const char *values[] = {"", "0", "1", "true", "2", "10"};
    for (unsigned diagnostic = 0; diagnostic < 2; diagnostic++) {
        detailed_diagnostics = diagnostic;
        for (unsigned i = 0; i < sizeof(values)/sizeof(values[0]); i++) {
            control = values[i];
            for (unsigned producers = 0; producers < 2; producers++) {
                for (unsigned timings = 0; timings < 2; timings++) {
                    diagnostic_producers_forced = producers;
                    diagnostic_timings_forced = timings;
                    assert(boxdroid_diag_vram_watch_enabled() ==
                           (diagnostic || !strcmp(control, "1")));
                    assert(boxdroid_diag_producers_enabled() ==
                           (diagnostic || producers));
                    assert(boxdroid_diag_timings_enabled() ==
                           (diagnostic || timings));
                }
            }
        }
    }
}
'''
with tempfile.TemporaryDirectory(prefix="boxdroid-watch-policy-") as directory:
    directory = Path(directory)
    path, executable = directory / "policy.c", directory / "policy"
    path.write_text(source)
    subprocess.run(["clang", "-std=c11", "-Wall", "-Wextra",
                    "-Wno-unused-parameter", "-Werror", str(path),
                    "-o", str(executable)], check=True)
    subprocess.run([str(executable)], check=True)
print("Diagnostic watch/producers/timings: 144 policy checks PASS; NV2A dirty logging retained")
