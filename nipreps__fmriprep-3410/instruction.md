# Issue

**Title:** chore(build): Install Workbench CLI via conda

## Description

I got connectome-workbench onto conda-forge: https://github.com/conda-forge/connectome-workbench-split-feedstock

It has a connectome-workbench-cli package that excludes the GUI, and now this is one fewer things to have special in the Dockerfile.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `152a80db7e01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.