# Issue

**Title:** Bug found by user and corrected. Specifically, the gaussian random fi…

## Description

Bug found by user and corrected. Specifically, the gaussian random fields had asymmetric variance when the X and Y dimensions were not symmetrical. This led to rippling type pattern in the gaussian fields. Fixed by upsampling the volume into a symmetrical dimensionality and then cropping after generation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8994231c0b12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.