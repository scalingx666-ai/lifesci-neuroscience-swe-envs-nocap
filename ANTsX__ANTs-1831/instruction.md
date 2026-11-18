# Issue

**Title:** ENH: Update default gradient step, turn off histogram matching

## Description

Have left antsBrainExtraction.sh alone because I'm not sure if histogram matching is more important where Laplacians are involved

Trying to harmonize with #768 and #770 in ANTsPy.

There are a lot of specialized / old scripts that I didn't change, we should consider moving to a permanent archive.

Histogram matching also defaults to on in antsMotionCorr, but again that is kind of a specialized case

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0cff6f29a2f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.