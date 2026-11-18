# Issue

**Title:** Exclude napari 0.6.0, enforce >= 0.5

## Description

Reverting napari pin and standardising minimum napari version across BrainGlobe.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c86212f0d0aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.