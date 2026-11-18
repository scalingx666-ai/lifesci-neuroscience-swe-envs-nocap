# Issue

**Title:** FIX: Propagate errors from `run_without_submitting`

## Description

Came up in  , 

This adds a  `_run_errors` attribute to `DistributedPluginBase` which is only utilized during the `run()` lifecycle, to ensure any encountered errors are properly reported.

Each distributed plugin may need to be updated, this only touches on `MultiProc` and `LegacyMultiProc`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2b671ab9f5f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.