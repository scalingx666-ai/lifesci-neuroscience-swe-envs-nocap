# Issue

**Title:** Expand parent meta tasks when focusing a nested Voxelytics task

## Description

### Summary
. Focusing a task inside a meta task (via a link in the Runs tab, or by clicking it in the DAG) left its parent meta-task panels collapsed, so the task wasn't shown or scrolled to.
- Focusing a task now also expands its parent meta tasks (`a` and `a@b` for `a@b@c`).
- The nested meta-task collapses are now controlled by the same `expandedTasks` state as the outer one. Each collapse only replaces its own keys.
- "Collapse All" now also collapses nested panels.

### Steps to test:
- Open a workflow with nested meta tasks and several runs (e.g. a task named `a@b@c` that was executed in more than one run)
- Expand the nested task, open its Runs tab and click another run: on the target page, all parent meta tasks and the task are expanded and scrolled into view
- Click a nested task in the DAG: its parent meta tasks expand and it's scrolled into view
- Expanding/collapsing top-level panels doesn't close nested panels; "Collapse All" closes all

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18093fd4c717`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.