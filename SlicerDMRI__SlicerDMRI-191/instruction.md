# Issue

**Title:** ENH: Test build

## Description

Test build: call `ctest` so that the tests are run.

Some tests launch Slicer's GUI: use the `coactions/setup-xvfb@v1.0.1` coaction so that `xvfb` is installed for when tests are run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `372675b96e91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.