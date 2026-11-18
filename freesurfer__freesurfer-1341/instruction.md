# Issue

**Title:** Claustrum seg

## Description

- Re-enabled install of mri_claustrum_seg
- Updated wrapper script to run on CPU only (more efficient on the CPU than GPU)
- Updated python requirements to include minimal branch of SynthSeg that contains only the functionality required for the predict() method used in this util and updated to work with numpy >= 1.24

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e23b6692f49`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.