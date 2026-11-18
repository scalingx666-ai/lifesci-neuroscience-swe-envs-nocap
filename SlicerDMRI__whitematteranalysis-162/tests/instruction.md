# Issue

**Title:** STYLE: Prefer using lowercase to name package

## Description

Prefer using lowercase to name package in line with other relevant scientific computing Python packages.

Change it as well in the commented PyPI URL (note that the package was never been uploaded to PyPI, and thus, changing the package name at this stage is safe from that point of view).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1b19a05d0f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.