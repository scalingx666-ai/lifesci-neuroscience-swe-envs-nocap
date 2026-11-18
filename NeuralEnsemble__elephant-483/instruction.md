# Issue

**Title:** Fixed MANIFEST.in to include CUDA/OpenCL sources when installing

## Description

Currently, when installing Elephant, the CUDA/OpenCL sources in `elephant/asset` are not copied. This leads to failure when trying to run ASSET using GPU acceleration.

This PR fixes the manifest file so that all required files are copied.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f2a01cc50e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.