# Issue

**Title:** minor ports from matlab to python (re: cases with no repeats; new FIR summary voxel viz)

## Description

these two new commits contain ports of the following commits of matlab code made by @kendrickkay 

371754299834852bc31eae126f63cee97441d068: making sure dmetric is nan if no repeats
881b5a31c917462027e30e210c0042c718969db5: adding warnings if no repeats
31f9eaa46e6f8c01cde49315826a0aef5cc674f1: runwise_FIR summary voxel visualization
3c0c435ca3bf34e3e37ef6d3c6229d263a881ca9: adding sanity check to prevent conds occurring at same time.

for some reason there is weirdness with whitespace in the commit of glmsingle.py; I will try to avoid this in future commits. would recommend using "ignore whitespace" to review the code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b32fc4dcd783`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.