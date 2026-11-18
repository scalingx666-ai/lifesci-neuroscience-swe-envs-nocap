# Issue

**Title:** CI: Update build to match fMRIPrep

## Description

Build images from Ubuntu 22.04, which also requires upgrading the CircleCI machines to 22.04 due to some fixes in Docker (see https://stackoverflow.com/questions/71941032/why-i-cannot-run-apt-update-inside-a-fresh-ubuntu22-04).

Also add connectome workbench in preparation for #321/#322 and upgrade FreeSurfer and Convert3d for parity.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99b0cfde690b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.