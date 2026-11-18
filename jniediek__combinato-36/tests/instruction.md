# Issue

**Title:** Handle channels which generate no sessions

## Description

Presently if there are no sessions for a particular channel and sign, the css-simple-clustering and mask_artifacts code will crash. Two changes to simply produce no sorting and output files in those cases. This permits easier batching of large number of experiments.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6474b4081667`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.