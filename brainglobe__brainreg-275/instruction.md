# Issue

**Title:** Update `napari` dependencies

## Description

Updates dependencies such that two conditions are satisfied:

- The base dependencies don't specify a backend for `napari`
- `brainreg` is installable via the `napari` GUI (all dependencies required to open the plugin are in the base dependencies)
- Retains an optional napari group to allow an easy one command install for fresh environments.

 

Had to add pyvista/setup-headless-display-action before the conda tests now that `pyqt6` is being used instead of `pyqt5`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa147d153671`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.