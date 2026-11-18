# Issue

**Title:** [MRG]: Set surface

## Description

I often find myself plotting with one surface and then wanting to look at it with another. This implementation is based on keeping track of all the meshes that are added to the brain. I've implemented it for data, labels and annotations, not yet for all other layer types because I wanted to confirm first that there is no better way to implement it. I was wondering whether all the mesh objects could be combined into one somehow (re #177), but it looks like they all need to have a different `scalars` attribute, and I don't see a straightforward way to separate the scalars from the triangular mesh...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9fa66d3f4313`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.