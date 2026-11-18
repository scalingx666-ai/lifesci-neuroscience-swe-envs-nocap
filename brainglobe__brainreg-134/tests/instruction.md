# Issue

**Title:** Find conda-installed binaries on Windows

## Description

# `niftyreg` backend binaries

Addresses  when attempting to locate CONDA-installed `niftyreg` binaries.

Addresses #116, but does not close it.

## Changes

If the user has installed `niftyreg` into a conda environment, then installed `brainreg` into the same environment, we should detect the conda-installed `niftyref` binaries and use these in the backend rather than the binaries that we bundle with the package.

Previously, Windows users experienced an error due to the conda install path of the niftyreg binaries being different to that on Linux/MacOS. Full changes are:

- `.exe` is now explicitly appended to all executables/binaries when on Windows OS
- The conda install path is properly set when the underlying OS is Windows (`CONDA_PREFIX/Library/bin` vs `CONDA_PREFIX/bin` on Mac/Linux)
- Some backend tests have been added along with an additional step in the CI to confirm that package installs now correctly detect when there are CONDA-binaries that can be used.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e074ef27e322`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.