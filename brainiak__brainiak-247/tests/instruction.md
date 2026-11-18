# Issue

**Title:** dev: Allow pr-check to run from sdist

## Description

This is useful for testing distribution packages before uploading to
PyPI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef6925d84b69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.