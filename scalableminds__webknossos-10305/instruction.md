# Issue

**Title:** Tweak antd success, warning, info and error colors

## Description

### Summary
Retunes antd's status colors to the WEBKNOSSOS palette.
- Light theme: new success/warning/error base colors. All three share one recipe: the text is darkened to ~5:1 contrast on Paper, hover/active make the text darker rather than lighter, and the backgrounds and borders are 9/16/35/55% tints of the base color.
- Dark theme: new success/warning/error seeds. Info text uses Indigo Light, including hover and active.
- `<Tag>`s that used preset colors (`green`/`orange`/`red`) now use `success`/`warning`/`error`.
- The job status icons import their colors from `theme.ts` (`ThemeIndependentStatusColor`) instead of hardcoding them.

### Steps to test:
- In light and dark theme, check success/warning/error UI, e.g.: 
    - **Job list:** the job status icons.
    - **Task types and the dashboard task list:** the skeleton and volume tags.
    - **Users and Teams:** the Admin tags.
    - **Viewer toolbar:** the "Split Workflow" tag.
    - **Alerts and form validation**, wherever they appear.


<img width="1500" height="3074" alt="image" src="https://github.com/user-attachments/assets/71aa19bf-fbda-40d8-bf31-4b315e8a69a2" />


------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20fcb4cdf24d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.