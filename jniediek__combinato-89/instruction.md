# Issue

**Title:** Fix seed initialization for tutorial mode

## Description

### Issue

The tutorial crashes when using `css-simple-clustering` because it directly calls `main()` from `cluster.py`, bypassing `argument_parser()`. As a result, `SEED` remains `None` and is passed to `cluster_features()`, which expects a numeric value, causing a `TypeError`.

### Fix

Ensure `SEED` is initialized before `cluster_features()` is called.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f4a88d470d98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.