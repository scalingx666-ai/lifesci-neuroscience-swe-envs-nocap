# Issue

**Title:** ENH: Cleaner normal calculation

## Description

Found a faster solution working with the `vispy` folks. I'm also porting it to `mne-python`, where I got these routines from anyway.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06ad2de19a58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.