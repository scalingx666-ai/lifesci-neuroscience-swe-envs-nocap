# Issue

**Title:** Extend preprocessing pipeline by defining a `BasePipeline`

## Description

- create a `BasePipeline` to allow inherited classes to define their own dictionary of steps to check against
- switched dict to lists, to allow for duplicated steps

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfd398aac464`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.