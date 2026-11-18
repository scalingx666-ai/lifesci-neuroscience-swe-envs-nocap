# Issue

**Title:** Added functions to extract time bin and neuron information from SSEs obtained using ASSET

## Description

This PR includes two additional functions for the post-exploration of SSE patterns extracted from neuronal data using ASSET.

They are used to get the start/end bins of each sequence in the SSE, as well as the IDs of the neurons involved in the pattern.

Besides their use in the descriptive analysis of the patterns, they will be also used in visualization functions that are intended to be included in Viziphant.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8aab43c8e5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.