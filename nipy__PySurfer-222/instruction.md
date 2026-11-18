# Issue

**Title:** [MRG] View persistence

## Description

The problem can be seen by using a view in which roll is non-default, for example "ventral", and adding data; before this patch, the view changed after the add_data call.

Also adding a comment to docs to clarify something that confused me the first time I read it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `234f7b52c446`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.