# Issue

**Title:** [SCHEMA] Add "directories" description for "study" DatasetType and add "docs" where was missing

## Description

Apparently I have missed this file entirely whenever I was preparing

-   (study DatasetType)

and also due to all the duplication we (I) missed that docs was not listed among "root.subdirs" or not listed at all.

This would provide a fix, but I wonder if we could/should make it so we could avoid duplication altogether.  As I have argued in #1972 I feel that "study" is the base dataset type and next ones just add potentially more to them.  So may be we could come up with some more compact representation here... but not in this PR

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bbd951363bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.