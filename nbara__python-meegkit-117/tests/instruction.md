# Issue

**Title:** [MAINT] ASR: defensive hardening and docstring fixes

## Description

A group of small defensive and documentation fixes in the ASR module (no behavior change on the common paths):

- **`asr_process`:** read `state` by key (`state["M"]`, `state["T"]`, `state["R"]`) instead of `state.values()`, removing the reliance on dict insertion order.
- **`fit_eeg_distribution`:** nudge the descending gridsearch `arange` stop endpoint so `min_width` is not dropped by floating-point error (mirrors the existing `cols` grid nudge).
- **`ASR`:** expose `max_bad_chans` as a constructor parameter (default `0.3`, preserving current behavior) and document it.
- **`clean_windows`:** build the window-start offsets from the non-truncated `win_len * sfreq` to avoid ~1-sample phase drift for non-integer products (byte-identical when the product is integer, including all existing tests); fix the `win_len` docstring default (0.5, not 1); document the meegkit-specific flat-window removal criterion.

### Testing
Adds tests for the `max_bad_chans` parameter, `state` key-order independence, and the offset spacing. Full `tests/test_asr.py` passes; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fcfbfd06797`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.