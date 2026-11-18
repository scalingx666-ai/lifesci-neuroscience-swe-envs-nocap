# Issue

**Title:** Changes from divest 1.1

## Description

Changes to the core codebase incorporated into `divest` 1.1, both for R compatibility and to address various runtime issues identified by `clang` ASan/UBSan and `valgrind`. One of the latter fixes is fenced using `USING_R`, as I'm not totally confident that it's the right change in the right place.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed6a38b3ab62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.