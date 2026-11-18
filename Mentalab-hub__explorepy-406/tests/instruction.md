# Issue

**Title:** fix header and data format for imp file

## Description

populates the impedance file with correct headers for 32 channels. This commit also fixes directly writing timestamp data as a list to csv

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `967139218d6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.