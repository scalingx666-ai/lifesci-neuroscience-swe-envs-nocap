# Issue

**Title:** Disable branch coverage

## Description

New lcov defaults meant we were uploading branch coverage rather than just line coverage.

A discussion for another day about whether this is a better metric, but for now this change should mean we're comparable to prior coverage info.

Minor fix on top of #599

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6ebf502f3c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.