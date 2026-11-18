# Issue

**Title:** Cast numpy.fft.fft2 result to numpy.complex64

## Description

numpy.fft.fft2 returns numpy.complex128 on some systems, which is not going to be accepted as an input type by apply_dotnorm.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27cc4c4753d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.