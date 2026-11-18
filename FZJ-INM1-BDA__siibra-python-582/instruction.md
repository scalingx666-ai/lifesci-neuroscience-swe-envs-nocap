# Issue

**Title:** feat: update how related regions are fetched

## Description

see  

This PR is the companion PR for updating the SANDS reference within siibra. 

Rather than relying on SANDS references of parcellation entity version, it is updated to use parcellation entity, which semantically more closely models SANDS model.

n.b. as this PR requires a specific branch of siibra configuration to function properly, this PR also aims to introduce the mechanism, by which, based on commit message, custom ref of siibra-configuration will be used. 

These changes are not yet pushed, in order to follow the Red/Green light approach for TDD

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d7a0e49ca79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.