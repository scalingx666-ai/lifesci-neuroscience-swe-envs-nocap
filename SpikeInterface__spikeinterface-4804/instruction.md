# Issue

**Title:** Fix: drop new_unit_ids of non-mergeable units

## Description

In case `merge_units` is called with externally provided `new_unit_ids` and some merge groups are not mergeable, we should drop new_unit ids that cannot be merged

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80aa6436dfc2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.