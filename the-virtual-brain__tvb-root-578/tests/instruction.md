# Issue

**Title:** TVB-2878 Implement Deepcopy

## Description

- [x] all **checks** should pass
- [x] **benchmark** our implementation against the default deepcopy implementation
- [x] answer the question: **what can we give more** than the default deepcopy implementation ?
- [x] validate/document what happens with **random stream generator** on deepcopy

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ea6e34ecf52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.