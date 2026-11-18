# Issue

**Title:** Added shade_kwargs to utils.mountain_plot().

## Description

This addresses issue #121 enabling users to pass keyword arguments to the `fill_between()` function used for shading in `utils.mountain_plot()`. As a result, users can control the shading properties more closely. 

For instance, this provides an easy way for users to circumvent the pyplot  whereby exported plots with a lot of `fill_between()` shading produce very large and even truncated vector files. Until this issue is fixed, this problem can be circumvented by adding `"rasterized": True` to `shade_kwargs`, such that the shading specifically is converted to a pixel image instead of being saved as a very large set of vectors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c95ef1886694`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.