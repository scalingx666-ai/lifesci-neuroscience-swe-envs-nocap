# Issue

**Title:** Fix login redirectPage being ignored for logged-in users

## Description

### Summary
`/auth/login?redirectPage=…` (used by the Discuss SSO flow) ignored `redirectPage` when the user was already logged in: the login form stayed visible and you were never sent back to Discuss. The "already logged in" redirect called `navigate("/")` during render, which react-router ignores on first render, and `redirectPage` was only read after a form login.

- `LoginView` now redirects in a `useEffect` whenever the user is logged in, whether they just logged in or already were: to `redirectPage` (full page load), else to the `redirect` prop, else to `/dashboard`
- Discuss SSO redirect now uses `https://discuss.webknossos.org`

### Steps to test:
- Logged in: open `/auth/login?redirectPage=https://example.org/` → lands on example.org (before: login form)
- Logged out: open the same URL, log in → lands on example.org
- Logged out: open `/users`, log in → stays on `/users`
- Logged in: open `/auth/login` → goes to `/dashboard`

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce7132fa0144`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.