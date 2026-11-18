# Issue

**Title:** Stack: use backend ID instead of index for mirrors

## Description

Fixes persistence of mirror preferences when set or priority of
available mirrors changes.

This resolves confusion when communicating with users about explicit
selection of mirrors and makes clear when priority/position sorting is
being used.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f18919fad60f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.