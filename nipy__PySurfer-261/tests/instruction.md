# Issue

**Title:** MRG: Fix scale_data_colormap and add FXAA

## Description

.

@hichamjanati can you see if this solves your problem?

I also added a `use_fxaa = True` to improve rendering quality slightly while I was in there, and fixed where we should have enabled backface culling for the quiver arrows.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c635dcb5c494`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.