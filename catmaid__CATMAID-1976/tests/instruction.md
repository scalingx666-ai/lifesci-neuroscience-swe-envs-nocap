# Issue

**Title:** Replace pgmagick with PIL

## Description

. tl;dr take a minor performance hit in some rarely-used routines, to save ourselves a lot of maintenance and dependency issues.

Not tested yet.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `340d3c422837`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.