# Issue

**Title:** BF: replace mutable default arguments with None

## Description

Replaces mutable default arguments (`[]`/`{}`) with `None`, initialising in the body where the value is mutated or indexed.

One behavioural note: `mouse.EyeTracker.runSetupProcedure` forwards the arg into `BaseCalibrationProcedure`, which calls `.update()` on it, so it gets an explicit `None` guard.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d37c2378ac3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.