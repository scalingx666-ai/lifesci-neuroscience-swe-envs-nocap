# Issue

**Title:** MNT warn about alpha only if dtype is not uint8

## Description

Volume2D and Vertex2D objects use VolumeRGB/VertexRGB for plotting. They set the alpha channel to a uint8 array. This returns a warning, because the check on the alpha values is too liberal. This PR fixes the issue, and should warn only when the alpha array is a float.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87d9b8648130`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.