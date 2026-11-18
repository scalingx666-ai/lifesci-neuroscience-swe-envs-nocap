# Issue

**Title:** Allen internal pipeline

## Description

added flexible handling of the ap_timestamps file which sometimes seems to get overwritten by kilosort but not on NP2

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1879c9751af2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.