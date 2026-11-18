# Issue

**Title:** Revise Figure 5 code example

## Description

I rewrote the code example to make it closer to the manuscript figure and better understandable:

- except for the initial raw voxel plot, all plots are done in physical coordinates using nilearn.plotting, removing all explicit point to voxel conversions. I achieved this by finding out how we can work with the 2D canvases of nilearn's 3D plot to plot contours, points, bounding boxes
- The region of interest is not any more explicit, but defined just from a bounding box around a probability threshold of the pixels, so more intuitive now.
- complicated filtering and aggregation of layer 4 vertex projections now much simplified. filtering removed since the plotting command filters implicitly.
- overview plot with section position on glass brain now also implemented.

The PR should work, I tested several times, but please check it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `369502b0716e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.