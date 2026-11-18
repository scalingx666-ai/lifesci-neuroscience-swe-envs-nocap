# Issue

**Title:** Show task type in info tab

## Description

### Summary
When working on a task, the Info tab of the right sidebar now shows the task type next to the task ID. Clicking it opens a modal with the task type's (markdown) description. The data was already part of the annotation's task info, so no backend change was needed.

### Steps to test:
- Open a task annotation (e.g. request a task from the dashboard) whose task type has a description
- Open the Info tab in the right sidebar: the Task section lists the task ID and the task type
- Click the task type row: a modal shows the task type description rendered as markdown
- Open a non-task (explorative) annotation: no Task section is shown

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e42ab1f2ab88`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.