# Issue

**Title:** Improve Voxelytics DAG view layout and interaction

## Description

### Summary
Fixes overlapping tasks and labels in the Voxelytics workflow DAG and improves how it reacts to selection, filtering and running workflows.

- **Layout:** edge labels are passed to dagre so space is reserved for them, and edges are drawn along dagre's route (right angles with rounded corners) instead of React Flow's `smoothstep`, which cut through other tasks.
- **Performance:** the layout is only recomputed when the graph structure changes, not on every click or polling update.
- **Run states:** running (blue, pulsing), timed out (orange) and skipped (grey, dotted) tasks are now distinguishable.
- **Selection:** clicking a task highlights all its upstream and downstream tasks and fades the rest.
- **Filtering:** the graph is no longer remounted on every search keystroke, so zoom, pan and selection persist. It is still refitted when the structure changes (e.g. collapsing a meta task).

<img width="1345" height="1819" alt="image" src="https://github.com/user-attachments/assets/3a2dbbd2-fcab-4706-8ed2-28bc70b9002c" />


### Steps to test:
- Open a Voxelytics workflow report with a larger DAG: tasks and edge labels don't overlap, edges don't cross tasks
- Click a task: its upstream/downstream chain is highlighted; click the background to clear
- Type in the task search: matching tasks stay, the graph keeps its zoom/pan
- Expand/collapse a meta task: the graph is re-laid out and fitted into view
- Open a running workflow: running tasks pulse, the layout doesn't jump on polling updates

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5578c5b2f383`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.