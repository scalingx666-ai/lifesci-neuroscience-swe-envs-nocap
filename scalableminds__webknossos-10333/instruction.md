# Issue

**Title:** Open the dashboard on the Datasets tab by default

## Description

### Summary
The dashboard now opens on the Datasets tab by default, also on webknossos.org, where it used to open on Publications. A tab in the URL or the last used tab still takes precedence. The admin view of another user's dashboard keeps opening on Annotations, since it has no Datasets tab.

### Steps to test:
- Clear `lastUsedDashboardTab` from local storage, open `/dashboard` → Datasets tab is shown (also with `isWkorgInstance` enabled).
- Switch to another tab, reload `/dashboard` → that tab is restored.

------
- [x] Added changelog entry

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5082035f04a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.