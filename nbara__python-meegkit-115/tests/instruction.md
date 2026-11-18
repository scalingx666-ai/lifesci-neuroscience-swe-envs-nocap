# Issue

**Title:** [FIX] ASR: reuse full SHAPE_RANGE grid in clean_windows (include beta=3.5)

## Description

`clean_windows` hardcoded `np.arange(1.7, 3.5, 0.15)`, a 12-point grid that excludes the `beta=3.5` endpoint, overriding the correct 13-point `SHAPE_RANGE` that `fit_eeg_distribution` defaults to. Reuse `SHAPE_RANGE` so the KL grid search can select `beta=3.5`.

### Testing
Added a regression test that spies on the `shape_range` argument `clean_windows` passes down (now the full 13-point grid incl 3.5), plus a fit-level test showing the dropped endpoint changes the selected shape parameter. Full `tests/test_asr.py` passes; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4487f2f00f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.