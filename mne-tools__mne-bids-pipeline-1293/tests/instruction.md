# Issue

**Title:** FIX: Keep run sections in run order under parallelization

## Description

Make report ordering deterministic regardless of parallelization by adding a step before closing the report that enforces a run-number ordering. If run 2 writes its report then run 1 gets the lock and goes to write, it'll reorder to put 1 before 2.

Drafted with Claude Fable 5 and reviewed by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `518d7b860a4c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.