# Issue

**Title:** dev: Fix pr-check for sdist

## Description

Currently, pr-check fails when calling run-tests in an sdist directory
because of the editable install detection.

Note that editable install detection is there to minimize testing errors
during development, i.e., the developer testing the checked out code
while having a different version installed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04e408b3f816`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.