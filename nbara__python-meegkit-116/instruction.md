# Issue

**Title:** [FIX] ASR: round half away from zero for window/bad-chan counts

## Description

numpy's `np.round` (banker's rounding, round-half-to-even) and Python's `int()` truncation diverge from MATLAB's round-half-away-from-zero at exact-half inputs, giving ±1 counts for the bad-channel count and window length `N` in `clean_windows` and `asr_calibrate`. Add a `_round_half_away` helper and apply it at those sites.

Reachability is narrow (ties need specific channel counts or odd-integer `sfreq` with `win_len=0.5`; common rates never trigger), so this mainly hardens the edge cases.

### Testing
Added a helper unit test covering ties (`2.5→3`, `128.5→129`, `-2.5→-3`), divergence from `np.round`, array input, and `int()` exactness. Full `tests/test_asr.py` passes; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cbc8943fe99d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.