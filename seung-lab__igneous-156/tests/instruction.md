# Issue

**Title:** Reduce read requests when creating sharded skeletons and meshes

## Description

This PR makes two changes to reduce read api calls when created sharded formats:
1. Cache spatial_index files. Because all the spatial_index are used by each skeleton/mesh merge tasks, the total reads goes quadratically with the volume (total number of spatial_index files x total number of tasks). Cache it makes the growth linear.
2. Optionally save the intermediary *.frag files to a separate location specified by frag_path. To create sharded format, each segment must be read from frag files at least once. Save and read them from a shared nfs volume reduces the read requests significantly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdc9e351b62b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.