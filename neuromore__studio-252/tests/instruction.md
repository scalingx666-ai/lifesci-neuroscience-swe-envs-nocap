# Issue

**Title:** RawEEG: GridLayout for Electrode CheckBoxes

## Description

* RawEEG: Replaces infinitely growing `QHBoxLayout` for EEG Electrodes by `QGridLayout` with 8 columns
* RawEEG: Only select/show first 8 electrodes by default.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db42ac938e6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.