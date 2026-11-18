# Issue

**Title:** [ENH] Creates plot_fsvertex() function

## Description

For plotting vertex-level data using pysurfer. Also refactors `plot_fsaverage()` so that after initial input formatting it calls `plot_fsvertex()` under the hood.

@VinceBaz since you've worked on `plot_fsaverage()` before maybe you could take a look at this (to make sure it makes sense) and ensure I didn't screw up anything too dramatically with my refactoring? If you're not working on anything that would be able to test the new `plot_fsaverage()` at the moment then no worries.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afa3af380a30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.