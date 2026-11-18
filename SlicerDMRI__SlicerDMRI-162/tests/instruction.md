# Issue

**Title:** Save tracts in LPS coordinate system

## Description

Images are saved in LPS coordinate system to be consistent with image coordinate system.

See discussion here: https://discourse.slicer.org/t/export-dti-as-ply-rotational-error/26478/5

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66db1262e06a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.