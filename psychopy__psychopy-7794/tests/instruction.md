# Issue

**Title:** RF: Rework of display sync on MacOS

## Description

This PR reworks the DisplayLink logic for synchronizing buffer flips with actual screen refreshes. It is not possible to eliminate the frame lag entirely, however these changes improve stability. I also added a change that has `getFutureFlipTime` report the authoritative timestamp from the system when a frame will appear next on screen. So you can now synchronize audio, cameras, etc. with that timestamp to get precise multi-modal synchronization

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `782a1cc285e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.