# Issue

**Title:** ENH: Read and write channel units from channels.tsv

## Description

ENH: Read and write channel units from channels.tsv

the issue started why converting the emg2pose data to bids and seeing that the misc channel in radian was not preserved on IO in EDF format.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e09430e9a55`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.