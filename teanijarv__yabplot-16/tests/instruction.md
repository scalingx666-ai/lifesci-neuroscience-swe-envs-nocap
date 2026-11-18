# Issue

**Title:** FIX: add support for a LUT in plot_vertexwise()

## Description

When plotting categorical data as the scalar, the cmap was not used as a lookup table, so it was normalized and returned non-matching colors, which was not expected. 

This PR adds a `lut` parameter to `plot_vertexwise()` and feeds it into `_render_cortical_views`, which already supported lookup tables. I also added a fallback in case `lut=None`, where arbitrary colors will be used instead.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0fd1af9c4c28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.