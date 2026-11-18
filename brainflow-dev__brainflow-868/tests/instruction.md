# Issue

**Title:** Fix BLACKMAN_HARRIS window using Nuttall's coefficients

## Description

## Problem

`DataFilter.get_window(WindowOperations.BLACKMAN_HARRIS, n)` doesn't return a Blackman-Harris window. `blackman_harris_function` uses `0.355768, 0.487396, 0.144232, 0.012604`, which are Nuttall's coefficients for his "continuous first derivative" four-term window (A. H. Nuttall, 1981). The four-term Blackman-Harris coefficients (F. J. Harris, 1978) are `0.35875, 0.48829, 0.14128, 0.01168`. They're also what `scipy.signal.windows.blackmanharris` and MATLAB's `blackmanharris` use.

With brainflow 5.23.0 from PyPI, `get_window(BLACKMAN_HARRIS, n)` matches the Nuttall formula to 1e-16 and differs from `scipy.signal.windows.blackmanharris(n, sym=False)` by up to 0.0064 (n = 8, 64, 256). For example, the first sample is 0 instead of Blackman-Harris's 6e-5. Anyone comparing BrainFlow PSDs or band powers with SciPy or MATLAB using "Blackman-Harris" gets slightly different numbers. The coefficients have been this way since `get_window` was added in #183, and #866 recorded them as Blackman-Harris in `docs/UserAPI.rst`.

## Change

- `src/data_handler/inc/window_functions.h`: use the Blackman-Harris coefficients. The window stays periodic like the other windows.
- `docs/UserAPI.rst`: list the corrected coefficients.
- `python_package/examples/tests/blackman_harris_window.py`: a new regression test, added to the Unix and Windows workflows next to the windowing test. It checks `get_window` against the Blackman-Harris formula for n = 8, 9, 20, 64 and 256, checks that it no longer matches Nuttall's window, and pins the first sample at 6e-5.

## Testing

- The new test fails on brainflow 5.23.0, which has the old coefficients (exit 1).
- I compiled the patched `window_functions.h` with `-Wall -Wextra` (no warnings) and compared `blackman_harris_function` with `scipy.signal.windows.blackmanharris(n, sym=False)`: the largest difference is 2.2e-16 for n = 8, 9, 64 and 256.
- No existing test hard-codes window values. `signal_processing_regression.py` builds its expected weights from `get_window`, and the other `BLACKMAN_HARRIS` users (band power examples and tests in Python, Julia and R) don't assert on window-dependent numbers.
- I haven't run a full build of the bindings locally, so CI is the end-to-end check.

## Note

This changes `BLACKMAN_HARRIS` output by up to about 0.006, so PSDs and band powers that use it will shift slightly. Both windows have similar sidelobes (about -92 dB vs -93 dB). If you'd rather keep the current numbers, I can change this PR to document them as Nuttall's window instead.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bcbe5186712`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.