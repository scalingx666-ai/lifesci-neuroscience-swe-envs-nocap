# Issue

**Title:** Fix: Prevent in-place modification of user-provided params

## Description

This PR addresses issue #152 where `GLM_single` was modifying user-provided `params` in place, causing unintended behavior when the same dictionary is reused. The fix ensures that instead of altering the original dictionary, a `deepcopy` of `params` is made and modified, preserving the original input and preventing side effects.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18c8d1899c91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.