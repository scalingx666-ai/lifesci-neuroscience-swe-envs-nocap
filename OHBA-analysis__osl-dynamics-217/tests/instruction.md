# Issue

**Title:** Fix: Zero out NaN values in multitaper PSDs

## Description

Fixes the issue #216.

In a case where one (or more) state does not activate over the entire time period, there can be PSDs with NaN value, creating bugs in the post analysis pipeline and visualisation. This fix solves this problem by substituting NaN values with zeroes, while giving the user a detailed warning about potentially poor HMM fit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9fe8e2534fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.