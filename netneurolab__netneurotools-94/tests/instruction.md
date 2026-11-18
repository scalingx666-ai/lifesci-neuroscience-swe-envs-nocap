# Issue

**Title:** [REF] Allow integer inputs in `freesurfer.parcels_to_vertices()`

## Description

.

Allows integer inputs to `netneurotools.freesurfer.parcels_to_vertices()`. Previously this would error due to the insertion of `np.nan` for "ignored" parcels (e.g., corpus callosum, medial wall).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2ea2cf55c55`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.