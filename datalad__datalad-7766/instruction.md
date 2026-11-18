# Issue

**Title:** ENH: push --since=^ should not push when there are no changes

## Description

When using `push --since=^`, if the remote tracking branch equals HEAD (i.e., nothing has changed since the last push), the push operation was still being executed unnecessarily, though it would report "notneeded".

The bug was in `_datasets_since_()`: it accumulated all diff results including entries with state='clean' and yielded the dataset for pushing even when all files were unchanged.

Fix: Skip entries with state='clean' in `_datasets_since_()` so that when there are no actual changes, no dataset is yielded and no push operation is attempted. The command now returns a single 'notneeded' result with message "Given constraints did not match any changes to publish".

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83b83bb3600a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.