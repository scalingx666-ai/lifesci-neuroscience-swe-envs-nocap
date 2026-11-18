# Issue

**Title:** MNT: Update build requirements to use numpy 1.25 and cython<3

## Description

and simplifies the build logic a bit, thanks to backwards-compatible numpy builds (see https://numpy.org/doc/stable/release/1.25.0-notes.html#compiling-against-the-numpy-c-api-is-now-backwards-compatible-by-default).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46eff4cb6d42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.