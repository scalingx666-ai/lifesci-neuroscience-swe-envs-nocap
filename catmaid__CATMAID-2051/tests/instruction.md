# Issue

**Title:** WIP: GitHub Actions CI build

## Description

Big fan of having the lints in separate jobs (which each complete in under a minute) so you don't have to wait for enormous installations and dig through miles of logs to find you've left out a space.

Also caches pip dependencies (the same could be done for npm but it wasn't a significant drag factor).

I went for the "classic" approach of setting up our own database with the existing scripts, but we could get Actions to do it with a docker image. Although we might want to spin our own image/action for CI so that we can run postgres in a ramdisk - I could see that being quite popular, actually, if it significantly improves speed.

Pypy failing at the moment. I can squash the commits down if/when this wants to go in.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2e2e9062fb3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.