# Issue

**Title:** Adding compression to edge indices

## Description

In the last PR, I forgot to include compression of the edge indices, and this PR adds that.
One of them has a size as large as the total number of edges, so this could decent (10-20%) additional compression.
As far as I can tell, using .save() in the builder compresses all of the datasets in node and edge h5 files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e75ecf3ffa0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.