# Issue

**Title:** Fix incompatible pointer types build error

## Description

AFNI fails to build with `-Wincompatible-pointer-types` due to a unint32_t / uint64_t pointer type mismatch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8ee6cf3cfe4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.