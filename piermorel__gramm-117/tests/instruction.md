# Issue

**Title:** Update stat_violin.m

## Description

hi, really nice tool to plot my data! 

I think i found a small bug while plotting half violins with two groups (colors) per dependent variable. Your comments in the script are predicting to "draw right half if even index" and "left half if odd", which makes sense to plot the first group on the left side. But It actually is the other way around.

For the first group (index=1), the right half is drawn. And for the second the left.

Here I simply changed the order of drawing half's. Now the left half is drawn first.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0fc59245c17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.