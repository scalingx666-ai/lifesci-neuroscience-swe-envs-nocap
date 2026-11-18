# Issue

**Title:** [REF] Updates FreeSurfer-related spin test functionality

## Description

Including allowing 2D data in `parcels_to_vertices` and `vertices_to_parcels` and accepting pre-computed spins in `spin_data`,

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `368cff101f3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.