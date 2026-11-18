# Issue

**Title:** fix: apodize() being applied twice during tone generation and speaker backend selection bug

## Description

PR fixes a few issues:
* When creating a tone, the Hamming window was applied twice if the `sounddevice` backend is in use
* Creating a `sounddevice` interface was not possible if PTB is specified as the default in prefs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3fe2f4ec7c06`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.