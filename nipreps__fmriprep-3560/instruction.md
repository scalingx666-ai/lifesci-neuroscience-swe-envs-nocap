# Issue

**Title:** chore(ci): Add workflow to update pixi lock on PRs

## Description

In #3556, @tsalo discovered he couldn't (effectively) run `pixi lock` from a mac, which I believe is due to 

This PR runs `pixi lock` on PRs and commits to the incoming branch if they are out-of-date.

#3559 demonstrates (see, e.g., 35151f72058cbd4bce2c7395c60fdb5c0c689972).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1c53adae22c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.