# Issue

**Title:** write to mmapped files on disk

## Description

Additional optional argument for niread 'writeable'. When set to true, it is possible to write to mmapped files.
Default behaviour is unchanged

New tests for writing to mmapped files.
Garbage collection after the tests to close all inactive mmapped files, before removing them from disk.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `962bb7dce5b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.