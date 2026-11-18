# Issue

**Title:** Automate fetching latest installer information

## Description

We can use GitHub's API for fetching the information about the (chronologically) latest release. This removes the tedious and error-prone "make a PR which updates links to the installer in `index.rst`" step from the release process.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a902db33e049`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.