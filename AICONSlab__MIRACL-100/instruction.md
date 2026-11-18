# Issue

**Title:** Add overwrite flag for ACE

## Description

Add overwrite flag for the comparison workflow of ACE. This forces the workflow to skip over the steps that are for single subjects (seg, conv, reg, vox, warp) and assumes (with checks) that these steps have already been performed. It then will perform only the comparison-based steps of the workflow (cluster, correlation, heatmap). 

This allows the user to skip the computation-intensive steps of the workflow once they have already been performed once. If one wants to just re-run the comparison-based steps, they can do so.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `113ef481c578`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.