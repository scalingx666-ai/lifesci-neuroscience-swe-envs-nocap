# Issue

**Title:** Fix removed points missing from the edit timeline

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

The edit timeline only learned about removed points from `REMOVING` events, which caused two problems:
- When the first edit it a **removed point**: with the current implementation the timeline widget is created when the first edit expands the "Edit tracked data" widget. That happens after the removal's event has fired, so the first removed point never shows. This behavior is not observed when the user first expands the "Edit tracked data" widget.
- When you close and reopen the timeline widget, the edited points disappear. The widget starts with an empty `_removed_points` list, so earlier removals disappear from it.

**What does this PR do?**

The timeline no longer stores removal events as a list. Each time the timeline redraws it compares the points currently on the layer with the points that were there when the file was loaded (similar behavior to `napari_layers_to_ds`). Anything missing counts as removed.

A more detailed explanation:
- A new function, `removed_points()` in `layer_wiring.py`, treats a point as removed if it is missing from the live layer and either:
  - was present at load time (removed in this session; this is the same rule `napari_layers_to_ds` uses on save), or
  - was flagged `edited` at load time (removed in an earlier session).
- Each loaded point's (frame, keypoint, individual) is encoded as an integer key. These keys are cached per layer in a `WeakKeyDictionary`, so a redraw only needs to encode the live points.
- In `EditTimelineWidget`, this removes `_removed_points`, `_capture_removed_points` and `_reconstruct_previously_removed_points`. `_on_layer_data_changed` now just schedules a redraw on `CHANGED` or `REMOVED`, and `_on_edits_reset` just redraws.

The first commit is the prototype implemented by @niksirbi (). The second commit adds more tests.

## References

## How has this PR been tested?

Tested manually in napari with a sample dataset: deleting a point as the first edit, and closing and reopening the timeline, both now show the removal.

New tests:
- `test_meta_widget.py`: both bugs, tested through the full widget with real point removals:
  - a removal as the first edit
  - closing and reopening the timeline
- `test_edit_timeline_widget.py`:
  - a removal shows up on a timeline created after it happened
  - `removed_points()` unit tests:
    - no loaded data returns nothing
    - removals are reported at the correct frame when `fps` is set, both for this session and an earlier one
    - dragged points, and points that were never tracked, are not counted as removed

Updated tests: the tests that checked the old `_removed_points` list (in `test_edit_timeline_widget.py` and `test_reset_edits.py`) now check `removed_points()` or `_edited_frames` instead.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No. Behaviour now matches what the docs already describe.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes (not needed)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d12a41b8ec2f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.