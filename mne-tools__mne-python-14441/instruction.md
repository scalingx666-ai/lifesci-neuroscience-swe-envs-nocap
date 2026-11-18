# Issue

**Title:** Add CircleCI scheduled-workflow issue opener [ci skip]

## Description

Scheduled `main` CircleCI runs have been failing and I wasn't notified. Same with `linkcheck`. I hate messing with CircleCI notification settings and GH issues are a better way to track problems anyway, so let's have a scheduled run look for failures and open an issue if one is found (and close an existing open issue if a scheduled run succeeds). Drafted by Opus 5.5 and reviewed and tweaked by me.

Will manually merge, then `workflow_dispatch`, which should then open two issues: one for the `main` failure, and one for the `linkcheck` failure. (The `maint` run is succeeding at least.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0616647f51c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.