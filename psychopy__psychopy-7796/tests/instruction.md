# Issue

**Title:** RF: Rework saving movies from window framebuffers

## Description

Rework 'screen grabbing' images from window framebuffers to not rely on `moviepy` anymore, rather reusing the high-performance movie writer classes we created for real-time `Camera` recording. Adds tests to for this feature to `test_window.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3398b00b7677`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.