# Issue

**Title:** Centralize logout handling in a useLogout hook

## Description

### Summary
Logout logic (API call, clearing the react-query cache, `logoutUserAction`, navigation) was duplicated across the navbar, the account security view and the change-email view. It now lives in one `useLogout` hook (`admin/auth/use_logout.ts`) that every call site uses.

This also fixes that the change-email logout didn't clear the shared react-query cache. Since it navigates client-side, a later login in the same tab could briefly see the previous user's cached data (e.g. jobs, scripts, folders).

### Steps to test:
- Log out via the navbar → redirected as before.
- Account → Security → "Log out on all devices" → lands on the login page; log in as another user in the same tab, the dashboard shows no data from the previous user.
- Change password → logged out and sent to the login page.
- Change email → logged out and sent to the login page.

### Issues
Related to #6533

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f244022e13ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.