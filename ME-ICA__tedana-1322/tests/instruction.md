# Issue

**Title:** chore(deps): Set cooldown for dependabot

## Description

.
.

Changes proposed in this pull request:

- Adds a cooldown period to dependabot updates.

Via #1321:

> It includes a [dependency cooldown](https://blog.yossarian.net/2025/11/21/We-should-all-be-using-dependency-cooldowns) of 1 week to avoid falling prey to supply-chain attacks. This will also incidentally help avoid spending time testing `x.y.0` releases that are quickly followed with `x.y.1` bug fixes.

This just implements this using Dependabot's built-in configuration option.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e9d5484c6dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.