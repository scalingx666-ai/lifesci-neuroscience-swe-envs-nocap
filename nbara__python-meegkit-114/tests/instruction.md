# Issue

**Title:** [FIX] ASR: use a real PSD square root in asr_calibrate

## Description

`asr_calibrate` computed `M = linalg.sqrtm(np.real(Uavg))`, which only strips a pre-existing imaginary part but does not make `Uavg` positive-semidefinite. If the robust average covariance `Uavg` has even a tiny negative eigenvalue (realistic for average-referenced / rank-deficient EEG covariance means), `scipy.linalg.sqrtm` of the resulting indefinite symmetric matrix returns a complex `M`, which then silently propagates through `eigh(M)` into `V` and the threshold matrix `T`. `asr_process` already guards against this by taking `np.real()` of its eigen-quantities, but `asr_calibrate` did not.

Add `_psd_sqrtm()`, a real symmetric PSD square root that symmetrizes its input and clamps numerically-negative eigenvalues to zero before taking the root, and use it in `asr_calibrate`. For a genuinely PSD `Uavg` (the normal case) this is the same principal square root `sqrtm` would return, so calibration is numerically unchanged.

### Testing
Added a regression test showing `_psd_sqrtm` stays real on a slightly indefinite matrix where `sqrtm` returns complex. Full `tests/test_asr.py` passes; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f71758db5137`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.