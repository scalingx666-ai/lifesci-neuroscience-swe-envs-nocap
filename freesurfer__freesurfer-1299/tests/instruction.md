# Issue

**Title:** Enhancements for mri_synthstrip Docker builds

## Description

GPU Dockerfile
- switch to minimal python base image (~200MB savings)
- add support for docker build cache of pip files
- use github tarball of hash to avoid git install
- use official pytorch wheel

New CPU Dockerfile
- features as above
- 3.79GB (!!!) savings

I'd like to request the CPU tag variant be published alongside the regular one in Dockerhub.

Ref:
https://pytorch.org/get-started/previous-versions/

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ebb35b07cccd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.