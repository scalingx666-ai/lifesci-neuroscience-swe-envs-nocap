# Issue

**Title:** Fix downsample_median returning the mean for even periods

## Description

`downsample_median` in `src/data_handler/inc/downsample_operators.h` short circuits to `downsample_mean` whenever the period is even. `perform_downsampling` with `AggOperations::MEDIAN` is therefore bit for bit identical to `AggOperations::MEAN` for every even period, which defeats the outlier rejection that is the only reason to choose a median filter. A single large spike inside a window passes straight through, divided by the period, instead of being discarded.

The library already contains the correct answer. `RollingMedian` in `rolling_filter.h`, which backs `perform_rolling_filter`, averages the two middle values for even window lengths. So BrainFlow has two median implementations that disagree with each other on identical input. This makes `downsample_median` follow the same convention: sort first, then average the two middle values when the length is even.

Two things worth stating precisely. `perform_rolling_filter` is not affected, only `perform_downsampling`. And at period 2 the correct even median is by definition the mean of the two values, so behaviour there is unchanged. Odd periods are unchanged.

Verified by building `libDataHandler.dylib` on macOS arm64. Input is a quiet baseline around 10.0 with one 1000.0 spike per window.

`perform_downsampling` with MEDIAN, window 0:

| period | MEDIAN before | MEDIAN after | MEAN | true median |
|---|---|---|---|---|
| 2 | 504.750000 | 504.750000 | 504.750000 | 504.750000 |
| 3 (odd) | 10.500000 | 10.500000 | 340.000000 | 10.500000 |
| 4 | 257.250000 | 9.750000 | 257.250000 | 9.750000 |
| 5 (odd) | 10.000000 | 10.000000 | 207.800000 | 10.000000 |
| 6 | 175.083333 | 10.250000 | 175.083333 | 10.250000 |
| 8 | 133.687500 | 10.000000 | 133.687500 | 10.000000 |

Spike leakage above the 10.0 baseline, which is the number that actually matters for a median filter:

| period | MEDIAN before | MEDIAN after | MEAN |
|---|---|---|---|
| 4 | +247.6250 | +0.5000 | +247.6250 |
| 6 | +165.0833 | +0.2500 | +165.0833 |
| 8 | +123.8125 | +0.2500 | +123.8125 |

Before the fix MEDIAN leaked the spike identically to MEAN. After, it rejects it.

Cross check of the two median paths on identical data, `perform_downsampling` MEDIAN against `perform_rolling_filter` MEDIAN aligned to the same windows: 10 of 10 windows mismatched at period 4 and 5 of 5 at period 8 before the fix, with 257.25 against 9.75, a 26x disagreement. 0 of 10 and 0 of 5 mismatched after.

All 9 signal processing examples that CI runs pass on this branch, and `clang-format` reports no changes on the touched file.

Disclosure: this change was prepared with AI assistance. I have reviewed and tested it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48bc5755d526`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.