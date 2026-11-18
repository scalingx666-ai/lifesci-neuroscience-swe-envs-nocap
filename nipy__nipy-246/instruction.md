# Issue

**Title:** Small fixes to plotting

## Description

A set of small fixes to plotting:
- black-bg now works with pdf/svg outputs
- removed a debug print
- docstring fixes in plot_anat/plot_map
- minor tweaks to make it easier to specify axes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5eecbabc9dae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.