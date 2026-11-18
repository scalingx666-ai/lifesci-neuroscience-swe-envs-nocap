# Issue

**Title:** [numpy] Fix users of NumPy APIs that are removed in NumPy 2.0.

## Description

[numpy] Fix users of NumPy APIs that are removed in NumPy 2.0.

This change migrates users of APIs removed in NumPy 2.0 to their recommended replacements (https://numpy.org/devdocs/numpy_2_0_migration_guide.html).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c3b0815ffe71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.