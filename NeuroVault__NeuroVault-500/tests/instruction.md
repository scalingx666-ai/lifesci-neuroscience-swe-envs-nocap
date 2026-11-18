# Issue

**Title:** tag sensitivity issue #29

## Description

This command lowercases all tags in the db. Then, there is a choice to make.

-Force lowercase for all new tags manually (easy way).
-`TAGGIT_CASE_INSENSITIVE=True` in settings.py (problematic way). Why? 'Cause all the Tags that were created with case differences (say 'motor' and 'Motor') have different tag-PK (KeyValueTag). This means that there is a conflict when creating a new 'motor' tag, since the db will find 2 keys for that tag and an error arises. This can be solved with a mergetags() function iterating over all conflicting Tags and deleting their PK and pointing to the lowercased one.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af644b34c051`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.