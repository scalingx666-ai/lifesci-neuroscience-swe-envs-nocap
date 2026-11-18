# Issue

**Title:** Fix click-through in create annotation modal of dataset list

## Description

### Summary
Clicks inside the "Create New Annotation for Dataset" modal (opened via `…` next to "New Annotation" in the dataset list) reached the dataset table row. The modal is rendered via a portal, but React still bubbles its events through the component tree to the row's handlers. Left-clicks (de)selected the row, right-clicks opened the row's context menu. The modal is now wrapped in a span that stops click, double-click and context menu events.

### Steps to test:
- In the dataset list, click `…` next to "New Annotation" for a dataset
- Left-click, right-click and double-click inside the modal: the row should not get (de)selected, no dataset context menu should open and the dataset should not be opened

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb3a77c5104a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.