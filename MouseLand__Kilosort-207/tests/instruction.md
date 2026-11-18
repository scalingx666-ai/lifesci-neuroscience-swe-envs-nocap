# Issue

**Title:** Fix for short runs, correct indexing when last cluster has no spikes

## Description

In runTemplates, don't save more PCs than time batchs
In postProcess and rezToPhy, allocate arrays to ensure summary measures are
specified for highest index cluster even if it has no spikes.

Important bug fix in mexmpnu8 -- skip conversion to/from doubles when ENSURE_DETERM compile switch is set.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e243c934339e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.