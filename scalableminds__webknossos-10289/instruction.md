# Issue

**Title:** Update antd to 6.6.7 and deduplicate yarn.lock

## Description

### Summary
- Ran `yarn dedupe` (64 ranges). Most notably, antd had its own nested copies of `@rc-component/util`, `trigger`, `motion` and `portal`, while the other rc-* packages used older versions. Every `@rc-component/*` package now resolves to a single version.
- Updated `antd` from 6.5.3 to 6.6.7 and `@ant-design/icons` from 6.3.2 to 6.3.4, and refreshed the `@rc-component/*` packages within their existing ranges. This stays on the same major version, and the 6.6.x release notes list no breaking changes. 6.6.8 is skipped because it is still inside our 3-day `npmMinimalAgeGate`.

Checked as a possible cause of #10277, but probably not the cause: the `useBreakpoint`/`responsiveObserver` path only uses a stateless `useLayoutEffect` from `@rc-component/util`. 6.6.2 does fix Grid `Row` keeping stale classes when responsive breakpoints stop matching, which may be related.

### Steps to test:
- `yarn install`, then click through the UI (dropdowns, tooltips, modals, tables, trees, date pickers, notifications)
- `yarn dedupe --check` reports nothing left to dedupe

### Issues:
- related to #10277

------
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8615db1c15f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.