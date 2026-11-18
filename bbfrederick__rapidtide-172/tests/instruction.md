# Issue

**Title:** Update fMRIPrep-related documentation

## Description

Closes none. I'm trying to translate the settings we're planning to use in fMRIPost-rapidtide into recommendations in rapidtide's documentation.

Changes proposed in this pull request:

- fMRIPrep outputs all of the transforms you might need, so I removed a comment about extracting transforms from the working directory.
- Change recommended interpolation method for aparc+aseg files from NearestNeighbor to GenericLabel.
- I added a tip to use the gray matter mask derived from fMRIPrep for `--globalmeaninclude` (already recommended), `--refineinclude`, and `--offsetinclude`.
    - @bbfrederick I want to make sure this is a good tip- it's what I have in fMRIPost-rapidtide, so if I'm wrong to recommend it I should modify fMRIPost-rapidtide as well.
- Some formatting changes to the associated sections. I broke a few lines on punctuation and code-formatted arguments in the text.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d596f8e16302`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.