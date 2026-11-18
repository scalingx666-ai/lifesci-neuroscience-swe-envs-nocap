# Issue

**Title:** ENH: subjects_dir parameter

## Description

In addition to using the SUBJECTS_DIR environment variable, allow the subjects directory to be set using a parameter. This is useful allows e.g. opening several Brain figures with different values for subjects_dir.

This feature is also used in the new SourceEstimate plot functionality of mne-python. See mne-tools/mne-python#303.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f310413b3438`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.