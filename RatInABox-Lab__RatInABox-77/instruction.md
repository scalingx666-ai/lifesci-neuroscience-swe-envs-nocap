# Issue

**Title:** Vector cell refactoring

## Description

Vector cells (BVCs and OVCs) have been refactored effectively in line with #71. 

This ended up being fairly major but has been done in a backwards compatible way. Major changes include:

- `BoundaryVectorCells` and `ObjectVectorCells` are now child classes of `VectorCells` where almost all the initialisation logic lives.
- `FieldOfViewNeurons` (which was a contrib) has been moved into the main `Neurons.py` and split into the child classes `FieldOfViewOVCs` and `FieldOfViewBVCs`. The old contrib still exists but will give a deprecation warning so backwards compatible.  
- A new demo was created to showcase vector cells. 

Some kwargs were changes (as they're shared by the `VectorCell` class not one for eachh of the BVCs and OVCs but, again, this gives deprecation warnings so should not break. All in all, it's a fairly major change which shouldn't be too disruptive but this will be much easier to maintain in the long run. Also @mehulrastogi did 98%, not me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03c57ca3fa6b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.