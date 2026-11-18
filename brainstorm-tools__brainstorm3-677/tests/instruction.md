# Issue

**Title:** Improve importing events from BrainVision event file (`.vmrk`)

## Description

* Address lowercase in block header:
  https://neuroimage.usc.edu/forums/t/43953

* Import channel information for channel-wise events:
  https://neuroimage.usc.edu/forums/t/43762

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04d2848ce0b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.