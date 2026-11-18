# Issue

**Title:** Three small backend fixes

## Description

### Summary
- include defaultViewConfiguration in `dataSourceFor`, so that saving it again from there doesn’t wipe that field on disk/in db.
- fix Instant parsing (relevant for voxelytics log times)
- Avoid dropping the x-auth-token header when setting the range header in HttpsDataVault (note that x-auth-token in HttpsDataVault is a superuser-only feature so no changelog entry)

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [x] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee4a9a8e4c04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.