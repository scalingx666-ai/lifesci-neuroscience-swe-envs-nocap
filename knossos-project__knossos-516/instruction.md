# Issue

**Title:** 16bit support

## Description

To tests these changes I used attachment, just a checker pattern.

[knossos-testdata.zip](https://github.com/user-attachments/files/30829763/knossos-testdata.zip)

Didn't touch the GPU part and unsure about LUT lookup now windowing is applied before lookup so it also affect the

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c62a4a8bb59c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.