# Issue

**Title:** ENH: Separate surfaces and morphometrics into standalone outputs

## Description

Rather than handling the paring down of surfaces when needed, this PR adds an aggregator node to collect and sort each surface output into a L/R list, simplifying retrieval for future use.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23f9dc4f1975`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.