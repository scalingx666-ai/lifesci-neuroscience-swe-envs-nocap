# Issue

**Title:** FIX deprecated scipy APIs

## Description

[SciPy 1.8.0](https://docs.scipy.org/doc/scipy-1.16.1/release/1.8.0-notes.html#clear-split-between-public-and-private-api) deprecated the use of of several internal APIs in favor of a consistent public API. This PR uses the new public API, and enforces a minimum version of SciPy to make sure it exists.

If we want to maintain support for SciPy < 1.8.0 (released Feb. 2022), we can add additional logic.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4bf6d7527bef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.