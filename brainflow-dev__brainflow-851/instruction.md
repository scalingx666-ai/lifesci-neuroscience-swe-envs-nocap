# Issue

**Title:** Fix get_psd_welch Nyquist bin averaging and infinite loop when overlap equals nfft

## Description

`get_psd_welch` has two independent defects. Both are in the same function, so they are here together.

**The Nyquist bin is never averaged.** The accumulation loop sums `nfft / 2 + 1` bins across every segment, but the averaging loop divides only `nfft / 2` of them. The Nyquist bin at index `nfft / 2` is summed and never divided by the segment count, so it comes back inflated by exactly the number of segments. For a stationary signal that means the value grows without bound as you feed in more data, which is the opposite of what a Welch average is for. `get_band_power` integrates up to `data_len - 1`, so any band whose upper edge reaches the Nyquist frequency inherits the error.

**`overlap == nfft` hangs the process.** Argument validation accepts it, and the segment loop then advances by `pos += (nfft - overlap)`, which is zero. `pos` never moves, the loop condition never goes false, and the call spins forever inside the library with no way for the caller to recover.

The fix averages `nfft / 2 + 1` bins instead of `nfft / 2`, and rejects `overlap >= nfft` instead of `overlap > nfft`. Two characters each. The Python, C# and Java docstrings said the valid range was 0 to nfft inclusive, so they are corrected too.

Verified by building `libDataHandler.dylib` on macOS arm64 and calling the C API directly, comparing against a reference Welch average computed by calling `get_psd` on each segment and averaging every bin including Nyquist.

Nyquist bin, `nfft=64`, `overlap=0`, `sampling_rate=256`, signal containing a tone exactly at the 128 Hz Nyquist frequency:

| data_len | segments | before | after | reference |
|---|---|---|---|---|
| 64  | 1 | 0.25000118 | 0.25000118 | 0.25000118 |
| 128 | 2 | 0.50000000 | 0.25000000 | 0.25000000 |
| 256 | 4 | 1.00000000 | 0.25000000 | 0.25000000 |
| 384 | 6 | 1.50000000 | 0.25000000 | 0.25000000 |
| 512 | 8 | 2.00000000 | 0.25000000 | 0.25000000 |

The before to reference ratio is 1.0000, 2.0000, 3.0000 up to 8.0000, exactly the segment count. Every other bin already matched the reference to 0.000e+00 absolute difference before the fix, which isolates the defect to the single Nyquist bin.

Propagation into `get_band_power`, 6 segments:

| band | before | after | reference |
|---|---|---|---|
| 4 to 8 Hz (theta) | 0.13650396 | 0.13650396 | 0.13650396 |
| 8 to 13 Hz (alpha) | 0.13690234 | 0.13690234 | 0.13690234 |
| 30 to 50 Hz (gamma) | 0.00000038 | 0.00000038 | 0.00000038 |
| 100 to 128 Hz (reaches Nyquist) | 3.52343750 | 1.02343750 | 1.02343750 |

Bands that stop short of Nyquist are untouched. The band that reaches it was 3.44x too large.

For the hang, `get_psd_welch(data_len=256, nfft=64, overlap=64, ...)` under `timeout 15` was killed at 15016 ms with exit 124 before, and returns 13 (`INVALID_ARGUMENTS_ERROR`) in 9 ms after. Overlaps 0, 8, 16, 32 and 63 all still return `STATUS_OK` with unchanged values.

All 9 signal processing examples that CI runs pass on this branch. `clang-format` reports no changes on the touched files, and `dotnet build` is clean at 0 warnings and 0 errors. The Java change is javadoc only and was not compiled since there is no `mvn` here, but I checked it with `javac -Xdoclint:html` after rewording a bare `<` that would otherwise trip doclint.

Disclosure: this change was prepared with AI assistance. I have reviewed and tested it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d5ebf18cda9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.