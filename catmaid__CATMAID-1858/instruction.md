# Issue

**Title:** Landmark widget: add multiple mappings by name match

## Description

Partial but already useful implementation of one of the tasks in #1856. This does exact name matching only and does not yet support regexes and substitution, but will at least solve my current workflow between projects.

The landmark widget is complicated and it's been some time since I've created any CATMAID UI, so submitted as a PR in case there are obvious problems.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4f6742e4814`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.