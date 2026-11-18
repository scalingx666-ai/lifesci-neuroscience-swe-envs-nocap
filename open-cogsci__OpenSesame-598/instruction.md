# Issue

**Title:** Fix canvas.text_size raising error

## Description

`'tuple' object is not callable`, because RichText.size is a property not a function

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c95ff7769c51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.