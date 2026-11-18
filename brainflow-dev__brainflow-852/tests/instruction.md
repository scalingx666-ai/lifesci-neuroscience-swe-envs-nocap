# Issue

**Title:** Fix perform_fft ignoring get_window failure and transforming uninitialized memory

## Description

`perform_fft` allocates `windowed_data` with `new double[data_len]` and calls `get_window` to fill it, then discards the return code. When `window_function` is not a valid `WindowOperations` value, `get_window` returns `INVALID_ARGUMENTS_ERROR` without writing a single element. The very next loop does `windowed_data[i] *= data[i]` on that never initialized buffer, `kiss_fftr` transforms the result, and `perform_fft` returns `STATUS_OK`. The caller receives a spectrum computed from whatever bytes the allocator happened to hand back, with no indication anything went wrong.

The fix checks the code from `get_window`, frees `windowed_data` and returns the error. `get_psd` already checks the `perform_fft` return value, so the error now propagates the whole way up through `get_psd_welch` to `get_band_power` and `get_custom_band_powers`, and the language bindings raise instead of returning a garbage spectrum.

Verified by building `libDataHandler.dylib` on macOS arm64 and calling `perform_fft` with `window_function = 99`. To make the uninitialized read observable rather than merely arguable, the harness supplies a global replacement `operator new[]` that pre-fills every heap block with a chosen value. That is a standard C++ replacement function, so it covers the `new double[data_len]` inside the library. Input is a pure 5 cycle sine over 64 samples, so all energy lands in bin 5.

| | before | after |
|---|---|---|
| `get_window(99)` called directly | 13 | 13 |
| `perform_fft(99)` return code | 0 (STATUS_OK) | 13 (INVALID_ARGUMENTS_ERROR) |
| output bins overwritten by the failed call | 33 of 33 | 0 of 33 |
| bins differing between two runs with different heap contents | 33 of 33 | 0 of 33 |
| magnitude at bin 5, heap filled with 7.0 | 224.000000 | untouched |
| magnitude at bin 5, heap filled with -3.0 | 96.000000 | untouched |
| ratio of magnitude to heap fill value | 32.0 in both cases | n/a |

The reported spectrum was exactly `|heap contents| * FFT(data)`. Change the heap, the spectrum changes proportionally, and the function still reported success. After the fix the output buffers still hold the caller's `-12345.0` sentinel, so nothing is written on the error path.

All four valid window functions are unaffected. `NO_WINDOW`, `HANNING`, `HAMMING` and `BLACKMAN_HARRIS` all return 0 and round trip through `perform_ifft` back to `window[i] * data[i]` with maximum error between 2.371e-16 and 3.908e-16, identical before and after.

All 9 signal processing examples that CI runs pass on this branch, and `clang-format` reports no changes on the touched file.

One note for anyone reproducing this: valgrind and MemorySanitizer are both unavailable on macOS arm64, and an attempt using `MallocScribble` plus heap priming produces all zeros and proves nothing. The `operator new[]` replacement is what makes the read observable.

Disclosure: this change was prepared with AI assistance. I have reviewed and tested it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `993cb6ca7e32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.