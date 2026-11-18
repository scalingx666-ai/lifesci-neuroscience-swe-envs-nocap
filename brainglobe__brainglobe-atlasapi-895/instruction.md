# Issue

**Title:** change blosccodec to use bit shuffle as string

## Description

[Tests were failing ](https://github.com/brainglobe/brainglobe-atlasapi/actions/runs/30625244867/job/91138918189?pr=892) because [zarr deprecated ](https://zarr.readthedocs.io/en/latest/release-notes/)the way we were passing bitshuffle to the compressor. This updates the call to the new method

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89113db9781f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.