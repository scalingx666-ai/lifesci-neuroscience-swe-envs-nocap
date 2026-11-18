# Issue

**Title:** Jacob/distance gating

## Description

Added distance gating for universal template positions, and updated how centers for template grouping are determined. So far this seems to fix the major problems with multi-shank probes, will still need testing for 2D MEA probes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8182b66bfbc0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.