# Issue

**Title:** Remove edge effects in inferred HMM state probabilities

## Description

Changes:
- Added `hmm.Model.get_alpha(..., remove_edge_effects=True)`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86e907f9964f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.