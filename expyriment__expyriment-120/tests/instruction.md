# Issue

**Title:** Added right-to-left option to io.TextInput

## Description

The user can now set `message_right_to_left` as well as `user_right_to_left` to `True`, which will result in both being shown (and updated) in right-to-left.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35d846a321fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.