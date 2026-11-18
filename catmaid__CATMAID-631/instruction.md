# Issue

**Title:** Fix some more url template tags for Django > 1.4

## Description

As of Django 1.5, the url template tag's first argument must be a quoted literal and the arguments cannot be comma-seperated anymore.

This commit fixes all occurences of `{% url` followed by a character other than `'` or `"`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9a8dc6e0350`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.