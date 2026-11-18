# Issue

**Title:** Format durations uniformly across admin and Voxelytics views

## Description

### Summary

Durations in the admin and Voxelytics views were formatted inconsistently: decimal hours in "Time [h]" columns, `Xm` for expected times, and `1d 2h 3m 4s`-style strings elsewhere. This adds a shared `formatDuration` helper and a `<FormattedDuration />` component so these views all use the same format. It ports the backend's `formatDuration` (`Formatter.scala`), so precision depends on magnitude: `400 ms`, `1.23 s`, `2 m 5 s`, `1 h 45 m 10 s`, `3 days 4 h` (seconds are dropped once a duration exceeds a day). Units are separated from numbers by thin spaces. Hovering shows the duration in decimal hours.

- The frontend tests mirror the backend's `FormatterTestSuite`.
- Column headers no longer carry a `[h]` suffix, since the value includes its unit.
- Removes `formatMilliseconds`, `formatSeconds`, `formatDurationStrict` and `formatTimeIntervalStrict` in favor of `formatDuration` and `formatTimeInterval`.

### Steps to test:
- Run `yarn test` and confirm `libs/format_utils.spec.ts` passes
- Admin > Projects: the "Time" column shows values like `1 h 45 m 10 s`; hovering shows decimal hours. The "Expected time" column uses the same format.
- Admin > Statistics > Time tracking overview and per-user details: average and total times use the same format
- Admin > Statistics > Project progress report: "Time" column
- Admin > Tasks: annotation time in the task list and in the task annotation view
- Voxelytics workflow report: header runtime (should keep counting up while a run is active), task state tooltips, statistics tab (sum/max/median/wall durations), and task runs tab durations

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fbbed8a9c215`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.