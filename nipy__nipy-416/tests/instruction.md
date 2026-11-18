# Issue

**Title:** MRG: add new design utilities, extend tests

## Description

Add new design utilities for working with OpenFMRI designs.

Refactor and test make_recarray.  Deal with annoying trailing length 1
dimension from make_recarray when input is a non-structured array (rather than
a list).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfbee7273e47`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.