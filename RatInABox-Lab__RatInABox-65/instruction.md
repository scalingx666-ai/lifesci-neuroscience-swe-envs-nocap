# Issue

**Title:** Moved OVC initialization steps to methods

## Description

Moved initialization steps in ObjectVectorCells to separate methods, to allow these to be overridden more easily by child classes.

This can be useful for creating an ObjectVectorCells child class where the assignments of objects to cells is not uniformly random. Like this, a minimalist child class can be written where just a method or two are overridden, but the original init can be kept.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `542a7f2036d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.