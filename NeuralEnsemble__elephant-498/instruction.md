# Issue

**Title:** Add feature to map pairwise distances matrix to disk while computing the cluster matrix in ASSET

## Description

The `cluster_matrix_entries` step in ASSET uses DBSCAN on the generated mask matrix, to extract the clusters associated with the SSEs being identified. As a custom distance metric was used, the implementation in ASSET first precomputes all pairwise distances and passes them to the `sklearn` function that performs DBSCAN.

Depending on the number of significant points being clustered, the memory requirements for this distance matrix increase. An option to compute the distances in chunks is available when memory errors occurred, but this still requires the allocation of an NxN matrix with `float32` precision in memory (where N is the number of significant points found in the mask matrix). As the data length increases, it is expected that the number of significant points will also increase, and the computation would be unfeasible as this matrix can quickly reach TiB sizes.

This PR adds an option to pass a location for a file on the disk, that will be used to map the pairwise distance matrix to a file. Therefore, no allocation in memory is needed, but the operations will be slower. This was implemented to be used only if already using chunking (`working_memory` parameter). As additional options, the user can produce verbose messages for debugging, and also has the option of keeping the file (which could be useful if the user wants to do some analyses on the distances, such as k-distance graphs).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9ce63bea839`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.