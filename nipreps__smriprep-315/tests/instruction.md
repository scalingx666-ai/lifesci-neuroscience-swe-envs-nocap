# Issue

**Title:** MAINT: Rotate CircleCI secrets and setup up org-level context

## Description

Responding to CircleCI's security alert on Jan 4, 2023 this PR rotates the secrets of this project.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `270762fc9dc7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.