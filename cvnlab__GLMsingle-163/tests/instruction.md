# Issue

**Title:** Fix HRF sampling to maintain precise timing

## Description

## Problem
The HRF sampling calculation in `getcanonicalhrf()` was truncating the end time to an integer, which could occasionally result in losing a sampling point. This caused inconsistencies between the length of the assumed HRF and the HRF library.

## Solution
Remove the `int()` cast from the sampling end time calculation to maintain floating-point precision:

## Why
- The end time `(hrf.shape[0]-1)*trold` is a precise time in seconds (e.g., 68.8s)
- Previously, `int()` would truncate this to 68s, potentially losing a sampling point
- Keeping the float value ensures we sample the full HRF duration
- This maintains consistency with the expected 47-point HRF length used throughout the library

## Testing
Debug output confirms correct sampling:
- End time: 68.8s
- Sampler points: 47 (as expected)
- Range: 0.0 to 68.54
- Consistent with HRF library shape (47, 20)

No changes to the underlying HRF computation, only to the sampling precision.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b6453fa12708`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.