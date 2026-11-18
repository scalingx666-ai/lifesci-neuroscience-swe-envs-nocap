# Issue

**Title:** Fix black page background below the fold in dark mode

## Description

### Summary

In dark mode (or with "System default" on a dark OS), long pages such as the dashboard lists showed a black background once scrolled past the first screen. The backend injects `html { background: black }` to avoid a white flash before React mounts (`AboutPageRedirectController.renderThemeCss`). A background on `html` stops the body background from covering the whole page, and the themed layout wrapper is only one viewport tall. The theme provider now sets the `html` background to the layout color as well, which overrides the injected rule once React runs.

### Steps to test:
- Select the dark theme (or System default with a dark OS) and open a dashboard tab with a long list, e.g. on a phone. Scroll to the bottom: the background stays dark blue instead of turning black.
- Switch between light and dark themes: the background below the fold follows the theme.

------
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cfef159e6199`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.