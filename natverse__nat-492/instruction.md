# Issue

**Title:** Making as.seglist compatible with R/igraph 1.3.0

## Description

as reported in #491 . This should cover new behaviour with backward compatibility.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad5717cbb997`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.