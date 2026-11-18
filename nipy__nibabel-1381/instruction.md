# Issue

**Title:** Add broad testing for Python 3.13

## Description

Use `uv` to install the free-threading build.

We have a lot of test runs. We probably don't need to check every version of Python on every OS. Checking every version on Ubuntu should give us enough coverage. For other OSs/architectures, we're more concerned about general availability and potential numerical differences, so top and bottom Pythons should be sufficient.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59733ff5a9ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.