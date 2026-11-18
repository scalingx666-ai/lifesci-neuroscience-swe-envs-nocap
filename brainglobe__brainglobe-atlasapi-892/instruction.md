# Issue

**Title:** fix human packaging script

## Description

There was a bug in the allen human packaging script which meant that for any annotated region all of its children were dropped, even if they were annotated.

This meant ~30% of the annotated regions were left out of the metadata file. This fixes that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2d3d03cc03b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.