# Issue

**Title:** FIX,DOC make sure cmap filename ends with png

## Description

A small fix to `cortex.utils.add_cmap` to ensure that a proper filename is used when saving a new colormap. Also improve the docstring a bit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa4b48c6373f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.