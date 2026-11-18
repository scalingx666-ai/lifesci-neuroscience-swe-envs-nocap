# Issue

**Title:** Fix wavelet coefficient buffer under allocation in five bindings

## Description

`perform_wavelet_transform` writes `wt->outlength` doubles into the output buffer the caller supplies. The safe upper bound, taken from the wavelib sources, is `data_len + 2 * decomposition_level * (40 + 1)`. That is exactly what `cpp_package/src/data_filter.cpp`, `DataFilter.java`, `data_filter.rs`, the Swift `DataFilter.swift` and the internal caller at `src/data_handler/data_handler.cpp:1557` all allocate.

Five bindings dropped the `decomposition_level` factor and allocate only `data_len + 2 * (40 + 1)`: python `data_filter.py:881`, C# `data_filter.cs:354` and `:1118`, node `data_filter.ts:494`, matlab `DataFilter.m:189` and julia `data_filter.jl:300`. The R package calls through the python one, so it inherits the same buffer. Short wavelets stay under the smaller bound and hide the problem, but the longer filters do not, and the transform writes past the end of the buffer.

I measured the real write count by handing the C function a hugely oversized sentinel filled buffer and finding the highest index it touched, across 53 combinations of wavelet, length and level. The `decomposition_level` bound was never exceeded, 0 of 53. The smaller bound was exceeded in 6 of 53. The worst case is db15 with a 1024 sample input at level 5, which writes 1167 doubles into a 1106 slot buffer, 61 doubles or 488 bytes past the end. db15 already overflows at level 3, so this is a function of the wavelet filter length as well as the level, not level alone.

To confirm it is a genuine out of bounds write rather than an accounting mismatch, I mapped the buffer so its final byte is the final byte of a mapped page with a `PROT_NONE` guard page immediately after, then called `perform_wavelet_transform` through the built `libDataHandler`. At the old size of 1106 slots the process takes a hard fault, SIGBUS, exit status 138. At 1434 slots, which is what the corrected python formula gives for that case, it completes normally and reports 1167 coefficients.

There is a second, quieter symptom. Each wrapper slices the buffer to `sum(lengths)`, and when that total exceeds the buffer the slice silently clamps, so the caller gets a short coefficient vector. Through the public python API on 8 cases, 6 came back truncated before the change, for example db15 at level 5 returning 1106 of 1167 coefficients. The inverse transform then read past the end of that short array. After the change all 8 return the full vector and round trip to a maximum absolute error of 1.8e-15.

The fix restores the `decomposition_level` factor in all five bindings. The C# overload taking a 2d array also sized itself from `data.Length`, the total element count of the matrix, while passing `data.GetLength (1)` as the actual `data_len`, so I switched it to `GetLength (1)` to match what the C side is told and is now correct for a single row matrix too.

Verified on macOS arm64 against a fresh `cmake .. && make -j8` build. The nine synthetic board examples CI runs all pass: `denoising.py`, `signal_filtering.py`, `transforms.py`, `downsampling.py`, `band_power.py`, `band_power_all.py`, `windowing.py`, `ica.py` and `csp.py`. `transforms.py` is the one that exercises the wavelet path. The C# package builds with `dotnet build -c Release`, 0 warnings and 0 errors, and the node package typechecks with `tsc --noEmit`, exit 0. I have no julia or matlab toolchain locally, so those two are one line changes reviewed against the working java and rust versions rather than executed. There is no assertion based test surface for these functions, the existing coverage is demo scripts that plot rather than assert, so I could not extend one, but I am glad to add a db15 round trip case if you would like it covered in CI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7addb8c5d8b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.