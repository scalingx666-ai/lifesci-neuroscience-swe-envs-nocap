# Issue

**Title:** BUG: Fix duplicate Opacity slider for segments in subject hierarchy

## Description

qSlicerSubjectHierarchyFolderPlugin::canOwnSubjectHierarchyItem recognized items in virtual branches (such as segments) as folders, which incorrectly included segment items. This made the generic Opacity subject hierarchy plugin believe it could create a folder display node for segments, causing a second, non-functional Opacity entry next to the segment's own working per-segment Opacity menu in the visibility menu.

<img width="1451" height="337" alt="image" src="https://github.com/user-attachments/assets/d18dd71e-ce69-4472-95d6-f48cdcb87d32" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa035b39c1e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.