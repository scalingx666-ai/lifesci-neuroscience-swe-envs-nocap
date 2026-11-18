# Issue

**Title:** STY: Apply ruff/pyupgrade rules

## Description

## Summary

Apply `UP` rules except `UP031` (598 errors) and `UP032` (86 errors)

## List of changes proposed in this PR (pull-request)

* Apply ruff/pyupgrade rule UP018
    UP018 Unnecessary `float` call (rewrite as a literal)
* Apply ruff/pyupgrade rule UP024
    UP024 Replace aliased errors with `OSError`
* Apply ruff/pyupgrade rule UP030
    UP030 Use implicit references for positional format fields
* Apply ruff/pyupgrade rule UP036
    UP036 Version block is outdated for minimum Python version

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a17de8ee8706`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.