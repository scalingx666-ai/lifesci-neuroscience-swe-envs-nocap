# Issue

**Title:** Switch to mne-tools scripts

## Description

`setup_xvfb.sh` and `check_qt_import.sh` tools are being moved from MNE-Python () to MNE-Tools (https://github.com/mne-tools/mne-tools).

This PR makes it so the scripts are accessed in the CIs from their new home.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e9c6151f909`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.