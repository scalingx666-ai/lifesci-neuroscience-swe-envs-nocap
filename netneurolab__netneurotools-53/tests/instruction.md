# Issue

**Title:** [REF, ENH] Refactors `nntools.datasets` module

## Description

**ENH**: Adds a `fetch_connectome()` function for getting species-specific structural/functional connectivity matrices.

**REF**: Separates dataset fetchers from dataset generators and moves former `OSF_RESOURCES` dictionary into `data/osf.json` for easier maintenance.

To Do:
- [x] Add tests for new dataset fetchers

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f10f85d0dda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.