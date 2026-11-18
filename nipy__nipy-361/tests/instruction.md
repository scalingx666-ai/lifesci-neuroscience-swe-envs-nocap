# Issue

**Title:** MAINT: rewrite long description; fill README.rst

## Description

Rewrite long description, with correct dependencies.

Port over the nibabel machinery for filling the README.rst file from the
long description.

Note this in the release notes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `57f47edb92a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.