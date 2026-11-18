# Issue

**Title:** [MAINT] validate citation.cff

## Description

- closes none

- add a github action workflow to make sure that the citation.cff validate conforms to the its schema

## benefit

avoid having failed zenodo releases when the citation.cff is invalid

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5407a2c4cae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.