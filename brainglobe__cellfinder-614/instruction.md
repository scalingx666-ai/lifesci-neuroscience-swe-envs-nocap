# Issue

**Title:** Update `napari` dependencies

## Description

Updates dependencies such that two conditions are satisfied:

- The base dependencies don't specify a backend for `napari`
- `cellfinder` is installable via the `napari` GUI (all dependencies required to open the plugin are in the base dependencies)
- Retains an optional napari group to allow an easy one command install for fresh environments.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b3d1630f3f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.