# Issue

**Title:** Fix Gao2026 amplitudes divided by 256 (BDF header scale is correct)

## Description

.

- Removes the `raw._data[eeg_picks] /= 256` step from `Gao2026`. The released
  BDF files store values within the 16-bit digital range their headers declare,
  with a per-file physical range, so MNE's header calibration already gives the
  correct amplitudes.  for the evidence over all 125 recordings.
- Adds `test_gao2026_keeps_bdf_header_amplitude_scale`, which writes a
  synthetic 24-bit BDF stored the way the Gao2026 files are (16-bit digital
  range, physical range set to the file's peak) and checks that the loader
  returns the written amplitudes. The test fails on the current loader
  (amplitudes 1/256 of the written ones) and passes with this change.
- Adds a changelog entry under Bugs.

Checked: `pytest moabb/tests/test_dataset_fixes.py` (18 passed) and
`pre-commit run` on the changed files (ruff, ruff-format, codespell all pass).
On the real sub-01 ses-01 AVI file, the MOABB-loaded and `mne.io.read_raw_bdf`
amplitudes now agree (median SD 13.98 µV both; it was 0.055 µV).

Note: the NEMAR deposit nm000242 was generated with the old loader and may
need regenerating ().

AI disclosure: I used Claude Code to help identify and patch this issue. I reviewed the changes and ran the checks above myself.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12c7ecba358c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.