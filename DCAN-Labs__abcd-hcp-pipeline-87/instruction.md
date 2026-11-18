# Issue

**Title:** Downgrade MRE from v96 to v91

## Description

New MRE version matches the Matlab version that dcan_bold_proc was compiled with.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7fbc448e79c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.