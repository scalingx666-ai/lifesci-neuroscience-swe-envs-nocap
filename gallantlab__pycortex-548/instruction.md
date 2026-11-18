# Issue

**Title:** NF,DOC improve docstring for show and make_static

## Description

This PR
- reorganizes the order of the kwargs for both `cortex.webgl.view.show` and `cortex.webgl.view.make_static` so that they match the docstring
- improves the docstring for both functions
- allows passing `curvature_{brightness,contrast,curvature}` to `make_static` too
- adds a new keyword `surface_specularity` in both functions to allow disabling that hideous surface specularity 😝 
- removes the `cmap` kwarg since it doesn't do anything anymore

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b29502ceef63`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.