# Issue

**Title:** rf: Calculate RMSD from motion transforms

## Description

Reconstructed from:

* https://git.fmrib.ox.ac.uk/fsl/mcflirt/-/blob/master/mcflirt.cc#L450-452
* https://git.fmrib.ox.ac.uk/fsl/miscmaths/-/blob/master/miscmaths.cc#L1065-1092

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f53185e28411`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.