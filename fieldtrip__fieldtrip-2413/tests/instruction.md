# Issue

**Title:** gdf event reading

## Description

This is an attempt to read in events from a biosemi/gdf file, where the events are represented in the header (and not in the trigger channel)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27a4918803d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.