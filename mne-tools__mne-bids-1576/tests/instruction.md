# Issue

**Title:** When fine calibration data is provided as a file, just copy the file

## Description

When writing fine calibration data using `mne_bids.write_fine_calibration`, when a filename is given, just copy the file instead of trying to parse it.

fixes mne-tools/mne-python#13859

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bcfe88c8c06c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.