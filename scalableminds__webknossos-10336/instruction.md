# Issue

**Title:** Fix welcome banner font weight and light cards in dark mode

## Description

### Summary

The dashboard welcome banner title looked different after #10326: the LESS rules that set its light weight were removed, so it fell back to antd's bold heading weight. This PR sets the "Welcome to WEBKNOSSOS" title back to font weight 200. It also wraps the action card grid in a light antd `ConfigProvider`, so the cards stay light in dark mode and readable against the blue banner. The title and intro text keep their white-on-blue styling.

### Steps to test:
- Make the dashboard welcome banner show for a user, e.g. set `hasSeenDashboardWelcomeBanner` to `false` in `novelUserExperienceInfos` for a dev user, then open the dashboard.
- Check that the title has the light weight, on a wide window and on a narrow (phone-sized) window.
- Switch the theme to dark. The action cards should stay light, and the title and intro text should stay white on the blue banner.

### Issues:
- None

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `edc699f50de8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.