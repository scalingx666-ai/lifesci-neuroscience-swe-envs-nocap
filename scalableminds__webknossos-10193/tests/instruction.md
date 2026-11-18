# Issue

**Title:** Avoid SQL error on concurrent dataset disk scans, remove isScratch logic

## Description

### Summary
 - Users may trigger disk scans that run concurrently to each other or to the scheduled ones
 - This creates a race condition on the SQL side, with concurrent inserts triggering unique constraints
 - This PR adds "on conflict do nothing", but *only* for the disk-scan codepath.
 - This also removes the unused-for-a-while-now isScratch property of datastores which dictated the precedence for multiple dataset inserts from different datastores.

### Issues:
- fixes https://scm.slack.com/archives/CMBMU5684/p1792173862541139

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [x] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `719d17cf36f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.