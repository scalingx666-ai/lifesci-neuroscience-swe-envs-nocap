# Issue

**Title:** old_format_output now also creates a matfile with cluster info

## Description

The generated cluster_info.mat is similar to cluster_info.csv. It includes a cell array with channel labels and one vector per channel indicating the category of each cluster in that channel (SU, MU or Artifacts). The elements of the vector refer to the clusters in ascending order, the 1st one being cluster 1. Unassigned data (labeled as cluster 0 in the other .mat files) is ignored.
It should make it easier to extract e.g. only single unit data in Matlab.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `faa5aeb174b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.