# Issue

**Title:** Allow custom colormap objects or registered names

## Description

This expands the flexibility of our what we accept as a colormap a bit to matplotlib colormap objects or the name of a custom colormap that has been registered with matplotlib.

This does not fix a weird behavior in pysurfer where lists are assumed to have colors in [0-1] and arrays are assumed to have colors in [0-255]. I have always thought that is probably a bug, but fixing it might break things for people who are dealing with it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5176164f3fc5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.