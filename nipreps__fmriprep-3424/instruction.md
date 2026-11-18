# Issue

**Title:** rf: Reconstruct motion confounds from minimal derivatives

## Description

After an exploration in  we now know how to reconstruct the original motion parameters (to at least 0.001 mm/rad precision) from the ITK transforms we generate.

To ensure consistency between single-shot and fit+apply runs, I propose to use this function in place of the original outputs.

I will add a regression test before merging, to ensure we notice if a change in nitransforms breaks this calculation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e933636f6530`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.