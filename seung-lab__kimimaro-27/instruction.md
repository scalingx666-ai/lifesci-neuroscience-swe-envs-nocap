# Issue

**Title:** feat: adds join_close_components to postprocess

## Description

This feature joins all skeletons and components of skeletons together at their closest vertex. The action of this function can be limited by the argument "radius" so that very distant components will not be connected.

The current algorithm for computing this is O( C^2 V ) where C is the number of components and V is the average number of vertices per a component. This can probably be improved with a kdtree.

This algo probably belongs in cloudvolume.skeleton but it has a scipy dependency.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07e944486499`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.