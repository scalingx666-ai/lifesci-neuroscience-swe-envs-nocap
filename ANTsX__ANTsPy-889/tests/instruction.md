# Issue

**Title:** Docker version tags

## Description

Trying to have consistent docker tag rules across various ANTsX products

* Versions are 1.2.3 not v1.2.3
* 'latest' points to latest release, not latest development version

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1cc20d42a837`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.