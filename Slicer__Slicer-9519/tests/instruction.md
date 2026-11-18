# Issue

**Title:** BUG: Update VTK to fix point data of uniform glyph point sampling

## Description

Updates Slicer's VTK to fix the point data of `vtkMaskPoints` output in the `UNIFORM_SPATIAL_SURFACE` and `UNIFORM_SPATIAL_VOLUME` random modes.

These modes gave every output point the attributes of the input point whose id happened to match the index of the current sample. Point positions were correct, so glyphs appeared in the right places but were colored and scaled by unrelated values.

The warning that these modes log when the input has no cell of the sampled dimension now names that dimension, instead of always reporting 2D cells.

The fixes were merged upstream (vtk/vtk!13621) and backported in

## Changes

```
$ git shortlog 470a7a557a..167845c5b6 --no-merges
Andras Lasso (3):
      [Backport] Fix point data of uniform surface/volume sampling in vtkMaskPoints
      [Backport] Add test for the point data of masked points
      [Backport] Report the missing cell dimension in uniform sampling warning
```

## Testing

Built and tested on Windows only as part of a development branch that also has the vector field display changes and a newer vtkAddon. This branch by itself, on top of `main`, has not been built locally.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b43f5f8d3da5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.