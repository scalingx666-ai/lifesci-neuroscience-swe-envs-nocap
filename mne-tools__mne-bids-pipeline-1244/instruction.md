# Issue

**Title:** Bump UV and CircleCI to 3.14

## Description

I just increased the `.python-version`. I then modified `autofix.ci` to run `uv lock --upgrade` for now in this PR. Assuming it works (it should push an update to `uv.lock`), I'll then modify it to run this once a month on a schedule, and open a PR if there are updates.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f58efcb20da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.