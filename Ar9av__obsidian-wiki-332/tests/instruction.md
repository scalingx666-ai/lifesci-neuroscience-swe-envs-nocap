# Issue

**Title:** ci: run the Python 3.9 jobs on ubuntu-24.04

## Description

`ubuntu-latest` is now Ubuntu 26.04, and there's no Python 3.9 build for it. That made `pytest (ubuntu-latest, 3.9)` and `readme-translation-drift` fail at the setup-python step, before any test ran (for example on #330 and #331).

- The 3.9 pytest job now runs on `ubuntu-24.04`. The 3.12 jobs stay on `*-latest`.
- The README drift job (Python 3.9) is pinned to `ubuntu-24.04` too.

Remove the pin when 3.9 support is dropped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe19827d85c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.