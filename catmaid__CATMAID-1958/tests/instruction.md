# Issue

**Title:** N5 polish

## Description

This polishes several rough edges around N5 and image block layers to bring them up to a generally usable level:

- Creates an admin wizard for importing N5 stacks by reading the metadata directly ()
- Loads blocks with web workers so that it doesn't freeze the browser and can be done in parallel (currently uses between 2 and 8 threads, not yet configurable)
- Fixes rendering problems that frequently showed wrong tiles in the image block layer
- Optimizes block slicing. Can now easily maintain 60+ FPS with XY/XZ open in fullscreen in FAFB on my laptop. ZY is unfortunately still somewhat slow because any kind of strided array access in javascript is slow, and the FAFB blocks are huge which kills locality in ZY.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eeac898f642f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.