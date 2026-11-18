# Issue

**Title:** 305 bounded voronoi tessellations

## Description

Merging in changes to how Bounded Voronoi Tessellations are calculated.

Specifically make it so you can 
 *set a edge length to ignore to match a cut off length (like used for an Off Lattice force).
 * Make it so that the bound changes with cell length to more accurately calculate cell size on the edge.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f46efcf82e69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.