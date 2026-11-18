# Issue

**Title:** feat(sdf): adds signed distance function

## Description

Found that doing the more complex version (version 2) was about 1 second faster but almost 2x the RAM, so not really worth the complexity.

It should be possible to do the SDF in one pass in C++ with small modifications to the core algorithm.

Also fixes bug in multi-segment logic that treated zeros incorrectly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ca48eb569ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.