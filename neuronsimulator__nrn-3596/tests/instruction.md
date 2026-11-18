# Issue

**Title:** Bump MacOS version in CI from 13 to 15

## Description

Use MacOS 15 instead.

.

~Note that MacOS 14 on GitHub Actions is ARM-based, while the Azure one is Intel-based, so we can still build x86 wheels, but we cannot do extensive testing on it anymore.~

**UPDATE**: the `macos-15-intel` is the _last_ Intel-based image that will be supported by GitHub Actions and Azure, so we can still build wheels for MacOS on Intel for now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5adb854c137b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.