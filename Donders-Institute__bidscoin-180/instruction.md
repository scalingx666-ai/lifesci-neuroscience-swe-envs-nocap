# Issue

**Title:** ENH: skip files in hidden folders.

## Description

I found that non-hidden DICOM files that are located within a hidden folder are indexed by the `bidsmapper`. In my application case (a Datalad dataset per subject with a hidden `.git` folder on the level of the DICOM series), this was not desirable. Not sure if this behaviour was generally intentional, though. 

The code patch in this PR rectified the behaviour for me such that the function `lsdirs` skips any path **under** `folder` that contains a hidden folder on **any** level.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce602830d383`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.