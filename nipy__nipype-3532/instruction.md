# Issue

**Title:** CI: Disable nipy tests generally, re-add with max numpy

## Description

## Summary
CI is broken because nipy is not being updated to deal with numpy deprecations. This removes nipy tests generally. I'm seeing if I can add a requirement config that will cap numpy for now so we don't skip these tests entirely.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f98ce46c197f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.