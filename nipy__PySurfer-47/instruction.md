# Issue

**Title:** RF Use nibabel IO functions where available

## Description

This is half a query as to why PySurfer merged much of its IO into nibabel without switching to using those functions and half something you can pull if the answer is "Haven't gotten around to it."

There's also a save_geometry method that I've found useful when using PySurfer as a library, which you may or may not want.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad8bf565a58c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.