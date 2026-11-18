# Issue

**Title:** Fix

## Description

This is round 3 of fixing #380 and #387 to merge into master. Just copying those comments here from @ljchang: 

updated version of a previous PR #380 after rebasing and fixing a bunch of merge conflict errors.

- added new functionality 
    1. Adjacency.cluster_summary - summarize within and between cluster distances
    2. align_states - hungarian algorithm 
    3. Adjacency.sum() - sum adjacency matrices
    4. added fisher_z_r() to Adjacency and Brain_Data classes.
    4. ISPS - has pairwise option
- clarified Adjacency.distance_to_similarity is for correlation or euclidean.
- fixed major bug in ISPS where the hilbert transform was being applied to wrong axis.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3467117f428b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.