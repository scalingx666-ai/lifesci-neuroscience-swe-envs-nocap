# Issue

**Title:** [ENH] Improves geodesic parcel centroids

## Description

Uses more accurate surface graph construction to better estimate geodesic parcel centroids in `nnsurf.find_parcel_centroids()`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ff61eb5452f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.