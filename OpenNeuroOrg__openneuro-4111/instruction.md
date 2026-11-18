# Issue

**Title:** fix(worker): Apply object access tags progressively and periodically reconcile tags

## Description

This fixes an issue where object tags could fail to apply fully for larger datasets due to expected interruptions in the runtime for task. Instead of repeating the task from the start, we only reapply to objects missing the tags which allows the retry to succeed.

Adds a new maintenance task which will periodically check datasets on S3 for misapplied tags and rerun. This will take some time to check every dataset but should eventually catch all cases where public tags have not been applied.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `160b62a854f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.