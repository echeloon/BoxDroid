# Offline x87 register-region coverage, 16 October 2026

No emulator runtime, device, benchmark or correctness test was changed/run.
The analysis uses experiment 39's preserved host/guest-byte snapshots and its
original CPU-clock raw report, decoded in one LLVM i386 diagnostic object.
Every included TB has exact agreement between LLVM instruction boundaries and
the original TCG instruction-start metadata. This avoids decoding immediates
as instructions or guessing guest boundaries from raw bytes.

## Result

| Candidate region | Runs | Affected sampled TBs | Static x87 instructions in runs | Whole affected TB share of TCG samples | JIT instruction-interval share of TCG samples |
| --- | ---: | ---: | ---: | ---: | ---: |
| At least 3 adjacent FLD/register ADD/SUB/MUL instructions, including pop forms | 60 | 45 | 302 | 2.531% | 0.262% |
| Also SQRT, DIV, sign, ABS and FXCH | 88 | 58 | 442 | 2.981% | 0.356% |
| Extended set with non-memory integer instructions interleaved | 89 | 58 | 451 | 2.981% | 0.418% |

The last row is an opportunity estimate requiring preservation of the
interleaved integer work and its state; it is not an already implemented
eligibility contract.

2,126 sampled TB instances were mapped. 2,122 had matching guest bytes;
2,121 decoded 32-bit TBs contained 23,236 guest instructions. One 16-bit
far-jump/shared-lookup container is excluded because its LLVM default 32-bit
decode differs from the original instruction boundary. Its large sample
weight is unrelated to a candidate x87 region. The remaining four TBs have
unavailable/mismatched guest-byte records and are excluded conservatively.

The example hot block at guest 0x18d0bf contains a six-instruction base region
at 0x18d11c and a seven-instruction extended region including FSQRT. That
entire block accounts for 0.492% of TCG samples; the candidate register-region
instruction intervals account for 0.021%.

## Interpretation

The bounded register-only fusion proposal has limited observed reach. It is
not the preferred next runtime project for a material whole-system gain.
Relaxing the region to admit non-memory integer work barely expands coverage.
An x87 design with broader reach would need to survive intervening guest
memory operations, with corresponding precise state/fault/MMIO recovery.

These are sampled time weights, **not executed guest instruction counts**.
The whole-TB column includes unrelated work and is not removable cost.
The direct JIT column excludes time spent in C helpers, so it is not a bound
on the total potential benefit. Helper attribution cannot be recovered simply
by adding generic x87 function samples to these regions. Numeric/control-state
eligibility is unknown. Sampling skid and JIT address reuse remain limitations.
No speedup, hardware limit or universal impossibility is claimed.

## Reproduction

From the repository root, choose a fresh output directory:

```sh
python3 scripts/analyze-x87-regions.py \
  docs/performance/native-perf-resume-20261014/experiment39/tcg-dump.bin.gz \
  docs/performance/native-perf-resume-20261014/experiment39/tcg-guest-bytes.bin.gz \
  docs/performance/native-perf-resume-20261014/experiment39/report/native-raw.txt \
  build/native-perf-run/x87-region-coverage-reproduced
```

Input identities, full region lists, top sampled regions, excluded-boundary
details and compressed LLVM diagnostic input/output are archived here.
The script uses the pinned local Android NDK LLVM installation by default;
`--llvm` overrides the path. The native decoder object is reproducible and
kept only under build output.
