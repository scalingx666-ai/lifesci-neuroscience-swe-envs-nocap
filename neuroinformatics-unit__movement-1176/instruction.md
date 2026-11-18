# Issue

**Title:** Fix tests broken by pytest 9.2 and PyQt6 6.12

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Recent dependency releases broke parts of the test suite:

- [pytest 9.2 removed `Function._nodeid`](https://docs.pytest.org/en/stable/changelog.html#miscellaneous-internal-changes), which pytest-benchmark 5.3 still uses. Every benchmark test errors as a result.
- pytest 9.2 also , which broke `test_bar_colours_follow_display_mode_not_edited_data` (it compares a list of RGBA arrays).
- PyQt6 6.12: in `test_layer_wiring_survives_closing_metawidget`, the dock widget now keeps a reference to the meta-widget until Qt actually deletes it. napari's `remove_dock_widget` schedules that deletion with `deleteLater`, which doesn't run until Qt processes events. So the loader was still alive when the test checked that it had been garbage-collected.

**What does this PR do?**

- Pins `pytest<9.2` in the `dev` dependency group, with a comment explaining why. We can remove the pin once pytest-benchmark supports pytest 9.2. Also opened #1177 to track.
- In `test_edit_timeline_widget.py`, replaces `pytest.approx` with `np.testing.assert_allclose`. The pytest 9.2 pin already keeps this test passing for now; this change stops it breaking again once the pin is removed.
- In `test_layer_wiring.py`, runs the pending deferred deletes (`QCoreApplication.sendPostedEvents(None, QEvent.Type.DeferredDelete)`) before checking that the loader has been freed.

## References
Discovered in #1162. Commits are also cherry-picked from there.

## How has this PR been tested?
Tests pass 

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74c1dd252cd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.