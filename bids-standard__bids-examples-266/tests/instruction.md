# Issue

**Title:** fix participant_id column to use sub-<label>

## Description

fixes an issue in two datasets:

- one by @CPernet 
- one by @choldgraf 

Namely, the rows under the `participant_id` column in the `participants.tsv` file were not following the `sub-<label>` style.

We caught this just now because thanks to @adam2392, the bids-validator has been extended to cover this case.

No actions needed, this can be merged. However if you (Cyril or Chris) have the data stored somewhere else, you may want to update.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7172b39dcc51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.