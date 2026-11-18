# Issue

**Title:** COMP: Update ITK to write NRRD axis units also when the axis has no label

## Description

Updates ITK to include a fix in its bundled NrrdIO: it wrote the units of an axis only if the axis also had a label.

This caused two problems with the voxel value units added in d835a0dded:

- The voxel value units of a vector volume were lost on save unless the voxel value quantity was also set.
- Saving a volume sequence whose index had a name but no unit crashed when voxel value units were set.

ITK changes (Slicer/ITK `slicer-v5.4.7-2026-07-21-4c49df9`):

```
$ git shortlog d7f1552..39989a1 --no-merges
Andras Lasso (1):
      BUG: Write NRRD axis units also when the axis has no label
```

New test cases in `vtkMRMLVolumeArchetypeStorageNodeTest1` and `vtkMRMLVolumeSequenceStorageNodeNrrdTest` write and read back:

- a vector volume with units but no quantity,
- a vector volume sequence with units but no quantity,
- a sequence whose index has a name but no unit.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d32f6cdabd5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.