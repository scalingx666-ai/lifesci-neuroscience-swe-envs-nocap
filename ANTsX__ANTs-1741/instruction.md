# Issue

**Title:** Remove deprecated label geometry filter

## Description

Fixing #1733 

- [X] ImageSegmentation/antsAtroposSegmentationImageFilter.hxx
- [X] Examples/ImageMath_Templates.hxx
- [x] Examples/GetConnectedComponentsFeatureImages.cxx
- [x] Examples/CreateDTICohort.cxx

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c68a48ea4f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.