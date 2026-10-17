# Diagnostic39 guest source attribution

Matching host and guest dumps, APK cf286dc76340e8fe7d11109f249ccfb48844e6291224ee5cfc1b95a6c75c33e3. Restore with gzip; decode using preserved guest-tcg-profile.py and matching capture/perf.data, NDK30 tools. Exact ELF remains build/native-perf-run/guest-code-profile-20261015/libboxdroid.so. Build/runtime/source hashes in build-provenance.json.

Both source buffers captured on same process, single-page normal-RAM only. End/ready images verify unchanged Dili bridge. Retained-source focused full suite PASS with dump0. Diagnostic is default off and is not a performance optimization/capture. No additional guest MMU/device reads.

Important: TB at reset PC 0xffffffce contains a shared lookup stub appended to its generated code. Its 7.53% sampled TCG weight must NOT be attributed wholesale to its guest far jump. Other hot blocks expose x87 arithmetic, register exchanges and memory copies. Sampling skid/address reuse limit precise attribution; no exact cycle bounds claimed. No dominant guest wait loop established from these hot regions.

Additional preserved terminal-branch analysis: blocks ending in unprefixed forward JMP within64bytes account~0.994% of total TCG sampled cost. This is whole-block sample weight, not removable overhead or a strict bound on chaining gains. It does not justify prioritizing bounded unconditional-jump stitching over the larger current costs. No stitching implementation was made.
