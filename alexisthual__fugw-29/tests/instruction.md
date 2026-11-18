# Issue

**Title:** Feature/enable l2 dense solver

## Description

This PR:
- enables fitting fugw problems with an L2 norm using solver for dense solutions
- implements a sparse solver for fugw problems with an L2 norm and enables it

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ec94fe3b556`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.