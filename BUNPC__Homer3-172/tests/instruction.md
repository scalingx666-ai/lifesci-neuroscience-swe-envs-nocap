# Issue

**Title:** v1.78.0 -- Improve saving performance of SNIRF files by using low level HDF5 library.

## Description

v1.78.0

* DataTree, v1.13.0
-- Comprehensive solution to improving the save performance of SNIRF files by using low-level HDF5 calls and limiting the number of HDF5 open and create calls that are made for file, group and dataset.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6089f97b1db7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.