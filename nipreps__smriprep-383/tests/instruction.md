# Issue

**Title:** FIX: Invert sulcal depth metric before passing to MSM, use HCP atlas files

## Description

This PR narrowly inverts sulcal depth metrics before passing to MSM. I do not currently invert sulcal depth and curvature for GIFTI/CIFTI morphometric outputs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e370a7307e7d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.