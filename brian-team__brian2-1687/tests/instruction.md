# Issue

**Title:** Fix GSL for C++ standalone mode

## Description

The GSL implementation did not catch up with recent changes in C++ standalone mode, leading it to raise `NotImplementedError`. Unfortunately, the GSL test suite skips tests that raise `NotImplementedError`, since this is supposed to be a signal for use of the `numpy` backend, which doesn't have GSL support (this is probably not a good approach…). The failure therefore went unnoticed. A few small additional fixes were necessary, probably related to changes in our compiler flags.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3af71d688f1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.