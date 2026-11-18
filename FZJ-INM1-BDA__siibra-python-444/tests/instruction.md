# Issue

**Title:** Maint: ebrains datasets, private some properties and methods

## Description

This was a result of a conversation with @dickscheid on 29.08.2023. `detail` property and `parse_person()` should be private as the users have no direct use for it.

@xgui3783, would you mind writing a doc string for `_parse_person`?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9add3e7682f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.