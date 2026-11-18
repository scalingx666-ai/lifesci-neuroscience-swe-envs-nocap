# Issue

**Title:** Update Bone Imaging Toolbox extension entry

## Description

## Summary
- Rename the existing `TimelapsedHRpQCTSlicer` catalog entry to `BoneImagingToolbox`
- Point the ExtensionIndex entry at https://github.com/wallematthias/SlicerBoneImagingToolbox
- Update the entry to the current catalog schema style with explicit git SCM type and enabled flag

## Context
This is the follow-up to prior reviewer guidance in  where grouping HR-pQCT modules into one already-approved extension was recommended instead of submitting separate extensions for each module.

The toolbox repository now acts as that single extension container. It includes Timelapsed HR-pQCT, Motion Score HR-pQCT, Scanco I/O, Segmentation HR-pQCT, and space for future bone-imaging modules under one ExtensionIndex entry.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7b31fd4b5a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.