# Issue

**Title:** feat: add fill_holes argument

## Description

Fills the holes in each connected component and removes components that
get filled in. The idea is that holes (or even entirely contained labels) 
are artifacts in cell segmentations. A common example is a nucleus segmented 
separately from the rest of the cell or errors in a manual segmentation leaving
a void in a dendrite.

This option should be very helpful for newbies to skeletonization. I've interacted with one or two researchers that were getting bad results and on inspection had holes in their segmentation. If this option was default on, it might make the package more intuitive. 

On my standard 512x512x512 test volume, this option took about 1m40s to run. On the upside, it should save somata from needing a recalculated EDT (they were already getting their holes filled, but after the EDT was calculated).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2b6223165598`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.