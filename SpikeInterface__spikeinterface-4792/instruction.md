# Issue

**Title:** Fix failing tests: decimate in chunks and skops

## Description

Ported here some test fixes from #4713 and #4703

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a137611ad03e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.