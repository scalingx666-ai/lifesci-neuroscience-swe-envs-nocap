# Issue

**Title:** fix hardcoded cluster config

## Description

## What does this PR do?
Issue:
Even I set `"CLUSTER": null` in config.json but neuralbench still call to slurm when run extractor task.

This pull request updates the configuration for several task files to improve how the compute cluster is specified. Instead of hardcoding the cluster as `auto`, the configs now reference a central Python variable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3a3edf060695`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.