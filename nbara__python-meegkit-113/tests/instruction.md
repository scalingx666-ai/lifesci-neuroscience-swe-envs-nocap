# Issue

**Title:** [FIX] ASR: init clean_windows rejection masks before one-sided zthresholds

## Description

In `clean_windows`, `mask1` and `mask2` were only assigned inside their respective `if np.max(zthresholds) > 0` / `if np.min(zthresholds) < 0` branches, but combined unconditionally via `np.logical_or.reduce((mask1, mask2, mask3))`. Since `zthresholds` is a documented, user-facing parameter, passing a one-sided value (e.g. `[1, 2]` or `[-5, -1]`) skips one branch and raises `UnboundLocalError`. The default `[-3.5, 5]` straddles 0 so both branches run, keeping the bug latent.

Initialize both masks to all-`False` before the conditionals, so a criterion that isn't evaluated simply rejects no windows.

### Testing
Added a regression test exercising `clean_windows` with both one-sided directions of `zthresholds`. Full `tests/test_asr.py` passes; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b107c92cbc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.