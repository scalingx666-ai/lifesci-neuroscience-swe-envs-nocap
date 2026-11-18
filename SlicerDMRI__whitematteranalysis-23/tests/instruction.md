# Issue

**Title:** Fixed stack on wm_cluster_atlas.py --help

## Description

wm_cluster_atlas.py now has a #! line, and the --help isn't b0rked

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f73f11f188d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.