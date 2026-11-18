# Issue

**Title:** [FIX] Fix plotting issue

## Description

Fixing the error: `'Axes3D' object has no attribute '_generate_normals' in neuromaps.plotting.plot_surf_template` by bypassing the shading patch function. This may produce a slightly different figure than previous versions.

The functions have been moved out of the `Poly3DCollection` class to `mpl_toolkits.mplot3d.art3d`. One could try simply call the functions but it did not give nice results for me. Not planning to amend it unless there's a simple solution.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af7839741043`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.