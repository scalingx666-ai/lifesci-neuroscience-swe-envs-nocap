# Issue

**Title:** FIX: Make vendored LooseVersion comparable to distutils.version.LooseVersion

## Description

Turns out we need LooseVersions to be compatible with one another.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0df3e7cdf4f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.