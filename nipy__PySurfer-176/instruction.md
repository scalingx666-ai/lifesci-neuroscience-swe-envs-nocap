# Issue

**Title:** MRG: Suppress spewed traits warnings

## Description

On Mayavi 4.5.0 (conda), I get a ton of warnings due to `traits` during normal usage. This gets rid of most of them.

The only ones left now are of the form:
```
ERROR: In /home/ilan/minonda/conda-bld/work/VTK-6.3.0/Rendering/Core/vtkCoordinate.cxx, line 351
vtkCoordinate (0x6e7a7a0): Request for coordinate transformation without required viewport
```
But I can't suppress those I don't think.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5dd4acdac31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.