# Issue

**Title:** Keep dashboard task detail values beside their labels

## Description

### Summary

From the `md` breakpoint up, the dashboard task card's details column used antd's `vertical` Descriptions layout, which always put labels above their values even when there was room beside them. The details column now uses the horizontal layout. A label/value row can wrap, so a value only moves below its label when it doesn't fit. The actions column still stacks vertically from `md` up, and the phone layout is unchanged.

- `task_card_list.tsx`: removes the `layout` switch from the details Descriptions and adds a `task-details` class.
- `_dashboard.less`: lets the label/value row wrap and sets the content to `flex: 1 1 auto`, so antd's `flex: 1` doesn't squeeze values into a narrow strip.

### Steps to test:
- Open the dashboard Tasks tab with a user that has open tasks, at desktop width. Task ID and Task Type should sit on the same line as their values.
- Narrow the window to the `md` breakpoint (about 800px). Short values should stay beside their labels. A long task type or ID should wrap onto its own line below the label without overflowing the card.
- Check a phone width (e.g. iPhone SE, 375px). Values should stay beside their labels, nothing should scroll sideways, and long values should wrap.
- Check the finished-task cards still render correctly.

### Issues:
- No linked issue.

------
(Please delete unneeded items, merge only when none are left open)
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Added migration guide entry if applicable (edit the same file as for the changelog)
- [ ] Updated [documentation](../blob/master/docs) if applicable
- [ ] Adapted [wk-libs python client](https://github.com/scalableminds/webknossos-libs/tree/master/webknossos/webknossos/client) if relevant API parts change
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [ ] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8087ef07d382`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.