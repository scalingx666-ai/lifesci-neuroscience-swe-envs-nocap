# Issue

**Title:** feat: facility for converting synapse centroids into targets

## Description

Often synapses are specified as (xyz_centroid, prelabel, postlabel),
however this point is usually located within the cleft between two
neurons. This is not a useful point for skeletonization. However,
as a heuristic, we can pick the closest point to the synapse centroid
for the pre and post labels.

This doesn't work if the centroid gets so wacky that it's far away from
the in-between space of the cells, but this should be unlikely to happen
with high quality data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ede60886783`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.