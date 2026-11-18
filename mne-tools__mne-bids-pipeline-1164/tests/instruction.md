# Issue

**Title:** Fix raw.filter only being applied to first run in _06a1_fit_ica.py

## Description

.

Apply ICA pre-filtering to every run (previously only run-1). Assumes all runs share the same sfreq (or are resampled via raw_resample_sfreq).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `304c4da0ea72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.