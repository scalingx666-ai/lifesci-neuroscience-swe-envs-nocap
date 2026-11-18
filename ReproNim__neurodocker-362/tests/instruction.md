# Issue

**Title:** FIX: etelemetry version printing and flake8 fixes

## Description

There was a bug in which `neurodocker generate ..... --json` printed comments with version info, but json does not support comments. Neurodocker version info has been moved to the generators.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce8e8cf4b4e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.