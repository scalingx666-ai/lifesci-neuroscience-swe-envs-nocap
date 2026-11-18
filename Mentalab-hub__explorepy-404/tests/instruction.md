# Issue

**Title:** drop trailing zeros on BIN2CSV conversion

## Description

Changed the numpy savetxt format from '%4f' to '%.12g' in FileRecorder to remove trailing zeros

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ad28a89a87a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.