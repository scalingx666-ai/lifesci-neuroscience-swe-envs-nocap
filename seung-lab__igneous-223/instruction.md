# Issue

**Title:** fix: Allow for encoded single mip downsamples of sharded layers

## Description

When generating downsample tasks for a sharded layer and `num_mips` is set to `1`, the for loop responsible for setting the correct encoding (and quality level) never executes. This PR modifies the indexing to allows for the encoding to be set correctly in this case.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `963f42e64f38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.