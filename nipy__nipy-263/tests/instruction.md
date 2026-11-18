# Issue

**Title:** MRG: Fix type graph

## Description

This PR aims at solving issue #256 by casting to float 64 the arrays that need to.
I took this opportunity to clean the tests in nipy.algorithms.graph.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e7291fa07bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.