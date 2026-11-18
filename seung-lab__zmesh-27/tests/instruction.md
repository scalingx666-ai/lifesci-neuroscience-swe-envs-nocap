# Issue

**Title:** perf: much faster marching cubes

## Description

- Avoids a slow cython -> cpp point copying a numpy array to a vector
- Fast path for when all voxels in the 2x2x2 stencil match

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c25bf5e958ce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.