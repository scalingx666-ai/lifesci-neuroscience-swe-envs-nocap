# Issue

**Title:** Increase margin of cropping in case of mindgrab

## Description

Turns out the default automatic cropping is too agressive for mindgrab, which makes it bleed into the skull. Adding a 10 voxel margin around that cropped volume seems to improve results. Definitely improves on the demo volume.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c64a879f79f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.