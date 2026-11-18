# Issue

**Title:** [FIX] ASR: tolerate flat/degenerate segments in fit_eeg_distribution

## Description

`fit_eeg_distribution`'s vectorized grid-search histogram divides by a per-column baseline-relative value that is **zero** when a run of samples is tied (e.g. a flatlined / disconnected electrode): `cols = nbins / newX[mcurr]` → `inf`, then `H = newX[:m] * cols` → `nan` (0·inf). Casting `nan` to int yields `INT64_MIN`, and `np.bincount` then raises `ValueError: 'list' argument must have no negative elements`.

A flat segment is exactly the dropout case `max_dropout_fraction` is meant to tolerate, so the fit should degrade gracefully rather than crash. This makes the histogram binning ignore non-finite entries (count them in no bin), so a degenerate grid column just yields a poor — but finite — objective and the grid search continues. Results on finite input are unchanged.

The crash is reachable through the primary public entry point: `ASR().fit(X)` with a single dead channel currently raises `ValueError`.

### Testing
Adds three tests: the direct `fit_eeg_distribution` crash on a tied/flat vector; `ASR().fit()` with a dead channel; and a guard that the result on clean data is numerically identical (same `mu, sig, alpha, beta`). Full `tests/test_asr.py` + `tests/test_cov.py` pass; `ruff` clean.

---
**Note:** includes the `nonlinear_eigenspace` reproducibility fix from #118 so the riemann CI test (`test_asr_class[*-riemann]`) is stable regardless of what this PR changes. Once #118 merges first, that commit drops out on rebase.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ae2321fbdc7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.