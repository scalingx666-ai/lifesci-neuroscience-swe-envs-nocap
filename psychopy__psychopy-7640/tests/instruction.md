# Issue

**Title:** PKG: sounddevice is now the preferred audio lib

## Description

From recent updates to our code sounddevice is now performing as well as ptb and doesn't have the downsides of questionable licensing, and building of binaries etc

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ccc9850fb168`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.