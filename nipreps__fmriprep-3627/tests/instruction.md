# Issue

**Title:** Remove cohort entity and append cohort to space

## Description

. Reproduces nipreps/nibabies#524. Depends on nipreps/smriprep#526.

## Changes proposed in this pull request

- Remove uses of `cohort` and just pass `space` along.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75407fcb37a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.