# Issue

**Title:** ICA Artefact Rejection

## Description

Closes: 

Changes:
- Added `ica_label()`: MEGNet/ICLabel automatic classification (requires `mne-icalabel`).
- Added `ica_ecg_eog_correlation()`: ECG/EOG correlation-based detection (MNE built-in).
- Improve the report.

Both return (`raw`, `ica`, `ic_labels`) with a shared interface for QC plotting. Includes composite ICA component topography plot in QC report.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9481eb3f460`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.