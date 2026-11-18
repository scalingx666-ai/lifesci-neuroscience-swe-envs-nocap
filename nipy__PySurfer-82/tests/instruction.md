# Issue

**Title:** Better colormaps

## Description

As you may know, I have strong opinions about colormaps.

This improves the colormap handling in PySurfer substantially. For `add_data` and `add_contour_overlay`, you can pass
- A LUT array
- The name of a matplotlib colormap (including the `_r` reversed colormaps)
- A list of colors

and it will handle them appropriately.

I also changed the defaults so there are no [evil](http://eagereyes.org/basics/rainbow-color-map) rainbow colormaps in PySurfer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d77cea2256b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.