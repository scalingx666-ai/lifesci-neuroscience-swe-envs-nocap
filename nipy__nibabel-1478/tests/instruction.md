# Issue

**Title:** fix: Adjust tests to not depend on how pytest is invoked

## Description

`python -m pytest` triggers changes in `argparse` behavior (relative to `pytest`) as of  Let's start by running some of our CI jobs with `python -m pytest` to replicate #1446.

Edit: Test failures in #1446 and #1476 replicated. Patching both.

.
.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db76723db297`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.