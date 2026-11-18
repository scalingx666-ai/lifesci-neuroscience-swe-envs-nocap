# Issue

**Title:** Refactor dashboard task list view into a function component

## Description

### Summary

- Rewrites `DashboardTaskListView` from a class component into a function component, with the task loading and state logic in a new `useDashboardTasks` hook.
- Moves the view into `dashboard/task_list/`: the hook, the task card list, the per-task actions, and the top bar each get their own file.
- Fixes a first-load bug: if "show finished tasks" was saved from an earlier visit, the first fetch loaded unfinished tasks and stored them under finished. The saved setting is now read before the first render.
- Smaller behaviour notes: the task array is copied before sorting instead of sorting the stored array in place, and the saved setting is only written when the toggle changes.

### Steps to test:
- Open the dashboard Tasks tab and check that the open tasks list loads.
- Click "Show Finished Tasks Only", check the finished list, then reload the page and check that the finished mode is still shown and its first page loads.
- Finish an open task and check that it moves to the finished list.
- Click "Get a New Task" with and without open tasks.
- As a team manager or admin, check Transfer, Download, Reset, and Reset and Cancel on a task.
- Check "Load more Tasks" on a list with more than one page.
- Open the admin view of a user's tasks and check that View and Transfer appear and Finish does not.

Not yet verified in a browser. The checks above are the manual pass to run before merging.

------
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `573482a9adf1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.