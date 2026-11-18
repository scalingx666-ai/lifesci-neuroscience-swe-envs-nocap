# Issue

**Title:** Changing the point symbol to ring for edited points in napari

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Since #1041, dragging a keypoint in the napari Points layer flags it as `edited = True` in the layer's properties, but there was no visual indication of this on the canvas itself. An edited point looked identical to an untouched one, so it is hard to remember which points were edited at a glance. 

**What does this PR do?**

- Adds a `EDITED_SYMBOL = "ring"` to `layers_style.py`,  because it is purely a styling value (what symbol represents an edited point). Also, if we want to change it from ring to a different symbol type, it is faster to change this way. 
- On `loader_widget.py` I added the `_set_symbol_by_edited()` so dragging one or more points changes its symbol type from `fill` to `ring`. 
- Calls the helper `_set_symbol_by_edited()` on `_on_points_data_changed()` to change to `ring` the `moved_indices` (edited points). 
- Also, applies it in `_add_points_layer()` on initial load, so reopening a dataset that already was edited shows the edited points constantly, based on the `edited` properties. 

## References

Builds on #1041 and #1044. 

## How has this PR been tested?

- Update on `test_on_points_data_changed_second_drag_extends_edited` to assert on `points_layer.symbol`, not only on the `edited` property. 
- Added `test_set_symbol_by_edited_no_indices_is_noop` to cover early return branch when no indices are passed. 
- Manually verified in napari that dragging a point changes the symbol to `ring` type. 

<img width="1384" height="880" alt="Screenshot From 2026-07-27 15-20-10" src="https://github.com/user-attachments/assets/5d25a4f4-9dad-424d-8962-13e1074265af" />

## Is this a breaking change?

No. This only changes the style of points that are already flagged in `edited`. 

## Does this PR require an update to the documentation?

Documentation will be updated to show examples on how to use this feature. 

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9f3032bcf68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.