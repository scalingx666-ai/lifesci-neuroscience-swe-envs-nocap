# Issue

**Title:** Public sform/qform affine

## Description

I realized while working in another project that making those functions public was more practical than modifying both `code`s and calling `affine()` to get one affine, then changing both codes again to get the other affine.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1efadb069494`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.