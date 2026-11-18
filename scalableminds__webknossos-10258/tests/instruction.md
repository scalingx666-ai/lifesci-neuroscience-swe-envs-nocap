# Issue

**Title:** Remove disabled polling code from voxelytics workflow viewer

## Description

### Summary
Automatic polling in the voxelytics workflow viewer has been switched off since #6732 (Jan 2023) because of server load (`VX_POLLING_INTERVAL = null`). This PR removes the leftover code: the `VX_POLLING_INTERVAL` constant, the `refetchInterval` options in the workflow view and workflow list, and the `usePolling` calls (always `null` delay) in the log and statistics tabs, which now load once via `useEffect`. The unused `isRunning` props go away too. The manual "Refresh" buttons work as before. No behavior change.

Alternative: #10210 made the workflow queries a lot faster (~30 s → ~2 s DB time for the largest workflow), so polling running workflows might be affordable again. That needs load testing on production first and can be done in a separate PR.

### Steps to test:
- Open the voxelytics workflow list. The list loads, and "Refresh" reloads it.
- Open a workflow. The report loads, and "Refresh" in the task list reloads it.
- Select a task and open the "Logs" and "Statistics" tabs. Data loads, it reloads when you switch tasks or change the log level, and both "Refresh" buttons work.

### Issues:
-

------
(Please delete unneeded items, merge only when none are left open)
- [ ] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cfe2207e8115`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.