# Issue

**Title:** Fix Nyquist bin inclusion for even N FFT lengths

## Description

## Problem

The current non-negative frequency indexing implementation incorrectly excludes the Nyquist frequency bin for even N FFT lengths. This affects the accuracy of connectivity measures computed on even-length FFTs.

### Current Behavior
- Uses `arange(0, (N+1)//2)` for non-negative frequency selection
- For **even N=1024**: produces 512 frequency bins (missing Nyquist)
- For **odd N=1023**: produces 512 frequency bins (correct, no Nyquist exists)

### Mathematical Issue
According to FFT conventions:
- **Even N**: should have `N//2 + 1` non-negative frequencies (DC + positive + Nyquist)
- **Odd N**: should have `(N+1)//2` non-negative frequencies (DC + positive, no Nyquist)

The current formula `(N+1)//2` works for odd N but misses the Nyquist bin for even N.

## Solution

Replace `arange(0, (N+1)//2)` with `arange(0, N//2 + 1)` which correctly handles both cases:
- **Even N=1024**: `1024//2 + 1 = 513` frequency bins ✅ (includes Nyquist)
- **Odd N=1023**: `1023//2 + 1 = 512` frequency bins ✅ (same as `(1023+1)//2`)

## Changes Made

### Core Changes
1. **`_non_negative_frequencies` decorator** (line 107): Updated frequency indexing logic
2. **`canonical_coherence` method** (line 638): Fixed frequency selection for canonical coherence
3. **`_estimate_spectral_granger_prediction`** (line 2108): Fixed Granger causality frequency indexing

### Test Changes
4. **Added `test_nyquist_bin_even_n()`**: Validates N=1024 produces 513 frequencies
5. **Added `test_nyquist_bin_odd_n()`**: Validates N=1023 produces 512 frequencies
6. **Updated `test_frequencies()`**: Expects correct frequency count including Nyquist

## Validation

### Test Results
```python
# Even N validation
N = 1024: Expected 513 frequencies, Got 513 ✅
N = 8: Expected 5 frequencies, Got 5 ✅
N = 4: Expected 3 frequencies, Got 3 ✅

# Odd N validation
N = 1023: Expected 512 frequencies, Got 512 ✅
N = 15: Expected 8 frequencies, Got 8 ✅
N = 7: Expected 4 frequencies, Got 4 ✅
```

### Frequency Verification
For `n_fft_samples=4`, `sampling_frequency=1000Hz`:
- **Before**: `[0, 250]` Hz (2 frequencies, missing Nyquist)
- **After**: `[0, 250, -500]` Hz (3 frequencies, includes Nyquist at -500 Hz)

### Regression Testing
- ✅ All wrapper tests pass
- ✅ All transform tests pass
- ✅ No shape regressions in downstream connectivity metrics

## Impact

This fix ensures:
1. **Correct FFT frequency bin handling** according to standard conventions
2. **Improved accuracy** for connectivity measures on even-length FFTs
3. **Backward compatibility** for odd-length FFTs (no behavior change)
4. **Minimal code changes** (3 one-line modifications)

The implementation follows test-driven development principles with comprehensive validation of both even and odd N cases.

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e4928754bd6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.