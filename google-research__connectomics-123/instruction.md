# Issue

**Title:** Remove ImmutableArray and MutableArray.

## Description

Remove ImmutableArray and MutableArray.

These classes were added to support type checking, but they are not necessary now that Final and Literal have landed, and in fact can cause some pretty serious performance regressions by failing to use numpy's C implementations of the various ufuncs. Removing these should help general performance quite a lot.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3fecddcaf93e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.