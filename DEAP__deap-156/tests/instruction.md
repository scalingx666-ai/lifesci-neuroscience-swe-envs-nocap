# Issue

**Title:** dist as a tuple possibly different for each fitness instead of a sinle element applied to all

## Description

This enhancement is relative to the discussion on how handling constraints (). My point was more particularly on how to set a distance fonction abble to return penalties different for each fitness if we consider here not only constraints on inputs but also constraints on fitnesses. So, the idea here is to manage the fact that the distance should always be a tuple with a single element repeated (as many times as there are fitnesses) or diferent values for each fitnness.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d37d1f500ec5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.