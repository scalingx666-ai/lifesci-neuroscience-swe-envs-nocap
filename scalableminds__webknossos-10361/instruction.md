# Issue

**Title:** Show item count in admin lists

## Description

### Summary
The users, projects, task types, scripts and tasks lists now show how many entries match the current filters next to the pagination (e.g. "1–50 of 87"). The task list is capped at 1000 results by the server, so it shows "1000+" when that limit is hit.

### Steps to test:
- Open the users, projects, task types, scripts and tasks lists and check the count next to the pagination.
- Use the search box or a column filter and check that the count updates.
- Search for more than 1000 tasks and check that the count reads "1000+".

### Issues:
- contributes to #5205 (the dashboard lists are not covered yet)

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ff3c509f0bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.