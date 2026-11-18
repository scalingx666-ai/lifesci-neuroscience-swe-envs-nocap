# Issue

**Title:** visualizer.py - transferred 'output' attribute to cpu in get_semantic_map()

## Description

Indices should be either on cpu or on the same device as the indexed tensor

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdc7d05e85ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.