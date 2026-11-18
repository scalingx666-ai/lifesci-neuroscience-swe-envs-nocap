# Issue

**Title:** Keep Voxelytics task filter on the same row as the toolbar buttons

## Description

### Summary
Since #10177 made the toolbar wrap, the "Filter tasks" search input (which antd renders at `width: 100%`) always took a full row of its own, pushing Refresh/run select/Collapse All onto a second line. It now uses `flex: 1 1 150px`, so it shares the row and only wraps on narrow screens.

### Steps to test:
- Open a Voxelytics workflow report: the filter input and buttons share one row on desktop
- Narrow the window: the buttons wrap below the filter

------
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff4347aa6782`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.