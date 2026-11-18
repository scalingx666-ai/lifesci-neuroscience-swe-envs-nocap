# Issue

**Title:** Include shared collections in the output of my_collections api endpoint

## Description

This PR changes `/api/my_collections` so the resulting list of collections includes collections shared with the user. This is similar to [My Collections](http://neurovault.org/my_collections/) page.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbc46363ef76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.