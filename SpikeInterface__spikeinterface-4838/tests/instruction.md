# Issue

**Title:** Fix group (and other property) propagation in channel slice

## Description

Fix #4835

The main issue was that `set_probegroup` was resetting the gorup property.

Easily fixed by moving copy metadata after the probe setting. Also added a test similar to what proposed by @xiao-1011

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5cacee5421d4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.