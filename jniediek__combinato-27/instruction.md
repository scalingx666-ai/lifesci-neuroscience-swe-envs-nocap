# Issue

**Title:** mostly tweaking raster plot appearance, (and 'all groups' tab for <5 clusters)

## Description

made convolution lines thicker. doubled raster plot width if there is only one paradigm condition (scr or nscr). in group view, if there are <5 clusters, their plots will still only take up the top half of the screen so they don't appear so stretched - whether or not this is actually better is up for debate, but I find it helpful. the raster plot function can handle different paradigm names, specifically different lengths such as fn2 or ospr1.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a483f3ce0349`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.