# Issue

**Title:** dev: Reduce number of Travis MacOS builds to 2

## Description

This reduced build time, frequently to half, because Travis has a limit
of 2 concurrent builds:
"After much painstaking deliberation, we have decided to limit the
concurrent macOS builds to a maximum of two out of the five offered."
https://blog.travis-ci.com/2017-09-22-macos-update

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b03aa5727656`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.