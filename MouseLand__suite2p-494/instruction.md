# Issue

**Title:** Refactors: run_s2p.py conditionals

## Description

This set of refactors simplifies run_s2p.py by removing complexity from some extraneous if-statements, removing resulting unused intermediate variables, and removing duplicated code between multiple conditional branches.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe35be394ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.