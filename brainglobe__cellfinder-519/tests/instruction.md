# Issue

**Title:** Update pinned pytorch version

## Description

What is this PR

 Bug fix

<!-- It fixes a known issue with an outdated torch version. -->
Why is this PR needed?

This PR updates the PyTorch version to >=2.4.1, skipping 2.4.0 which contained a bug affecting inference on Windows. The bug has been resolved upstream in PyTorch. See  for reference.

What does this PR do?

Updates the pyproject.toml dependency list to require torch>=2.4.1

Ensures Cellfinder avoids the buggy PyTorch 2.4.0 version

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab0e22e15fa9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.