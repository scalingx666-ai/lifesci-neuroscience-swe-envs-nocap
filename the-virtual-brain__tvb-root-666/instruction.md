# Issue

**Title:** TVB-2847: run notebooks automatically from a github worflow

## Description

It creates a github workflow that runs in parallel all the notebooks present in tvb_documentation/demos directory, in order to test them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f192384007ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.