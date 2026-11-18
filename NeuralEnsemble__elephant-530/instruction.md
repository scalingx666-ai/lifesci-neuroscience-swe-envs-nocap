# Issue

**Title:** Feature/remove pandas bridge

## Description

## remove pandas_bridge
This PR will remove the  `pandas_bridge.py` module from elephant.

## deprecation
 The `pandas_bridge` module was deprecated here:  on Mar 2, 2020. 

Removal was planned for elephant 0.8.X.

## decision
As discussed in the last elephant meeting (Nov 28, 2022), the `pandas_bridge` module will finally be removed from elephant with release v0.12.0.  (v1.0.0 update: 06.11.2023)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `996e557832b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.