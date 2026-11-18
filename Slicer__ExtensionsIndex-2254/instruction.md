# Issue

**Title:** upgrade QuantitativeReporting with planar annotations

## Description

This PR updates QuantitativeReporting with the ability to load and view planar annotations, using the latest highdicom and relying on pydicom 3.0.1. 

See  and  for more information. 

@fedorov

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `519b7a5229fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.