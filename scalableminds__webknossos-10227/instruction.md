# Issue

**Title:** Avoid rewriting an update group on retry

## Description

### Summary
 - When a resent save request contains groups that were already saved, keep the current version instead of resetting it to each group's version, so those groups aren't written again (which was be harmelss for most actions, except addLayer, because it generates a new id every time).

### Steps to test
 - I created artificial retries locally and tested that everything succeeds and stays consistent
 - Note that I also ran a full claude review, discussing the various call paths for this, so the coderabbit rate limit is not a blocker

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2b8e888577f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.