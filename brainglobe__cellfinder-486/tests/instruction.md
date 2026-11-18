# Issue

**Title:** Move qt-niu dependency

## Description

I put it into the dev dependencies by mistake. Cellfinder should be re-released once this is merged. I've yanked `1.5.0` on PyPI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4eccaa4285cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.