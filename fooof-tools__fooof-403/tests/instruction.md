# Issue

**Title:** [MNT] - Fix up docstring copying

## Description

This PR fixes what used to be called the `copy_doc_func_to_method` decorator function, splitting it into two different decorator functions with separate use cases for dropping or not the first parameter.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d72714f7dae4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.