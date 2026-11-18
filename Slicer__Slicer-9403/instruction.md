# Issue

**Title:** BUG: Fix sequence browser playback running at ~2x the requested rate

## Description

The increment used round-to-nearest, so it fired after half the nominal period, and resetting the reference clock on every advance kept it there. Truncate instead and carry the remainder forward.

Changes:
- Modules/Loadable/Sequences/Logic/vtkSlicerSequencesLogic.cxx: truncate increment, advance reference time by consumed items

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4eafce4f2e3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.