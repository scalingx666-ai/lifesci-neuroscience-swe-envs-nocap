# Issue

**Title:** Add "Resume Last Annotation" action to dashboard dataset list

## Description

### Summary
Datasets with at least one of your own annotations now offer a "Resume Last Annotation" action in the dashboard (row actions and context menu). It opens your most recently modified active annotation of that dataset. The dataset list now includes the id of that annotation (`latestOwnAnnotationId`), so nothing is fetched on click.

The surrounding actions were renamed to tell them apart: "New Annotation" → "Start New Annotation", "View" → "Open in Viewer" (read-only hint in the tooltip).

<img width="3332" height="1432" alt="image" src="https://github.com/user-attachments/assets/43fcc7eb-8402-45fd-848e-6f23eb5af283" />

### Steps to test:
- Open the dashboard dataset list; datasets with annotations show "Resume Last Annotation"
- Modify an older annotation of a dataset, then click "Resume Last Annotation" → that annotation opens
- Same via the right-click context menu
- Datasets without own annotations (e.g. only team-shared ones) don't show the action

### Issues:
- related: https://scm.slack.com/archives/C5AKLAV0B/p1791901650975719

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ae610c48566`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.