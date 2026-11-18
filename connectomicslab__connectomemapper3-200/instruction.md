# Issue

**Title:** FIX: Problem to make diffusion pipeline config with ACT

## Description

This PR  by moving the handler methods for `trait_on_change()` from `DiffusionPipeline` to `DiffusionPipelineUI`.

It also add a more explicit option to perform or not bandpass filtering in the fMRI pipeline.

This PR is intended to be directly merged into the master such that it can provide a hotfix before the new `v3.1.0` release, by resintalling connectomemapper with pip using the github repository master branch e.g.:

```
pip install git+https://github.com/connectomicslab/connectomemapper3.git@master
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b77bd582603`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.