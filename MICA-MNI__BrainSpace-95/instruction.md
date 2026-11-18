# Issue

**Title:** Speed up cosine affinity in kernels

## Description

I replaced `x = 1 - squareform(pdist(x, metric='cosine'))` with `x = cosine_similarity(x)` from `sklearn.metrics.pairwise`. This speeds up computation considerably when done on high-res surfaces (fsLR 32k).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `443b4e7dbdf0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.