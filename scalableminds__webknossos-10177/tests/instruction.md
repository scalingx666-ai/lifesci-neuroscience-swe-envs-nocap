# Issue

**Title:** Optimize Voxelytics workflow view for mobile

## Description

### Summary
Makes the Voxelytics workflow report usable on phones, where it is often opened to check on long-running jobs.

Below antd's `md` breakpoint (768px):
- The task list and graph are stacked in a single column instead of being squeezed side by side.
- The workflow graph is hidden by default and can be shown with a "Show Workflow Graph" button.
- The page no longer scrolls horizontally (the 1300px minimum width now only applies to wider screens).
- The task list scrolls with the page instead of in a nested scroll container.
- The graph minimap is hidden, since it covered a large part of the narrow graph.

<img width="943" height="998" alt="image" src="https://github.com/user-attachments/assets/e8a14c60-8a3f-4ff4-b4cd-2f63a3241642" />


The desktop layout is unchanged.

### Steps to test:
- Open a Voxelytics workflow report and narrow the browser window below 768px (or use device emulation, e.g. iPhone 12 Pro).
- The graph is hidden, the task list is fully visible and there's no horizontal scrolling.
- Click "Show Workflow Graph": the graph appears above the task list; clicking a task in it scrolls to the task in the list.
- Widen the window again: the two-column layout with the graph on the left is back.

### Issues:
- 

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5dbcf34be3ea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.