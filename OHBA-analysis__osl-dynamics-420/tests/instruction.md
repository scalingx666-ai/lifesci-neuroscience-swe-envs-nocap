# Issue

**Title:** New more efficient sign flipping algorithm

## Description

Changes:
- Implemented a new **much** faster sign flipping algorithm (marginally outperforms the random search in terms of alignment).
- Sign flipping is deterministic now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `851809035d50`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.