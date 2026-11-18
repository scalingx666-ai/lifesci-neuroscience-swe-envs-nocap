# Issue

**Title:** Prepare for migration

## Description

See 

Prepares the CLI-cellfinder package for migration into brainglobe-workflows.

Note that we do not want to archive the repository, since we need it for when we merge in cellfinder-core and cellfinder-napari.

On merge, tag new release version so that the deprecation warning files through to PyPI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e5f3b6cd28df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.