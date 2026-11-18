# Issue

**Title:** Synchronize tracks layer to points layer

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Previously, `_add_tracks_layer` created the napari `Tracks` layer once at load time and never touched it again. `_on_points_data_changed` only updated the Points layer's properties when a point was dragged (setting `confidence` to `NaN` and flagging `edited`). The visible Tracks line never reflected the edit. This made it visually confusing to follow corrections: a user could drag a keypoint to fix a bad prediction, but the track line kept showing the old, uncorrected trajectory until the file was reloaded.

**What does this PR do?**

It keeps the Tracks layer in sync with the Points layer whenever a point is dragged, via a new `_sync_tracks_layer` method called from `_on_points_data_changed`. Specifically:

1. **Links the Points and Tracks layers.** Both are independent napari layer objects with no built-in relationship. A new metadata key, `TRACKS_LAYER_KEY`, is stored on the Points layer's `.metadata` dict (the same pattern already used for `POINTS_LAYER_KEY` / `POINTS_PROPERTIES_KEY` / `DATASET_ATTRS_KEY`, which `save_widget.py` reads). `_add_tracks_layer` now does:

   ```python
   self.tracks_layer = self.viewer.add_tracks(...)
   self.points_layer.metadata[TRACKS_LAYER_KEY] = self.tracks_layer
   ```
   so the drag callback can look up `points_layer.metadata[TRACKS_LAYER_KEY]` to find the matching Tracks layer directly.

2. **Relies on matching row order between the two layers.** `_add_points_layer` builds the Points layer from `self.data[self.data_not_nan, 1:]` (columns: frame, y, x), and `_add_tracks_layer` builds the Tracks layer from `self.data[self.data_not_nan, :]` (columns: track_id, frame, y, x). Both slice the same underlying array with the *same* boolean mask, so row `i` in the Points layer is always row `i` in the Tracks layer. This means a moved point's row index can be reused directly against the Tracks array, with no lookup by frame/track_id needed.

3. **Adds the actual sync logic** in `_sync_tracks_layer`, called at the end of `_on_points_data_changed` right after the existing confidence/edited-flag update:
   ```python
   tracks_data = tracks_layer.data
   tracks_data[moved_indices, 1:] = points_layer.data[moved_indices]
   ```
   This copies the dragged point's new `(frame, y, x)` into the same row of the Tracks array, so the track segment connecting the previous frame to this one now terminates at the corrected position.

4. **Fixes a resulting `color_by` warning.** napari's `Tracks.data` setter internally does `self.features = {}` every time `.data` is reassigned (part of rebuilding the track geometry). Since the layer's `color_by` was set to `individual_factorized`, and that column momentarily doesn't exist in the wiped features table, napari's own `_check_color_by_in_features` immediately warns `"Previous color_by key ... Falling back to track_id"` and silently resets `color_by` to `track_id`. Since we always restore the exact same properties right after (only positions changed, not the property columns), this warning is a false alarm about a transient state that gets fixed one line later:
   ```python
   tracks_properties = tracks_layer.properties  # save before .data wipes it
   color_by = tracks_layer.color_by
   with warnings.catch_warnings():
       warnings.filterwarnings(
           "ignore", message=".*Previous color_by key.*", category=UserWarning
       )
       tracks_layer.data = tracks_data              # wipes features, triggers the warning
       tracks_layer.properties = tracks_properties  # restore properties (incl. individual_factorized)
       tracks_layer.color_by = color_by              # restore coloring
   ```
   The suppression is scoped narrowly (this message text, only around these three lines) so genuine warnings elsewhere aren't hidden.

## References

Part of #993 

Related to: 
#1024 set the confidence of edited points to NaN and flag them as edited.
#1053  change the point symbol to a ring for edited points in napari (open).

## How has this PR been tested?

This has been tested manually, locally in napari: loading a dataset, dragging keypoints across multiple frames/individuals, and confirming the Tracks layer updates immediately to match, with correct coloring and no stray console warnings.

Following tests were added: 

- `test_on_points_data_changed_syncs_tracks_layer` drags a point and verifies `_sync_tracks_layer` write the new `(frame, y, x)` into the same row of the Tracks layer, while every other row is left untouched. Uses the `edited` property (set by `_on_points_data_changed`) to differentiate dragged and untouched rows. 
- In `test_convert.py` we had a helper function `_move_points()` to simulate a mock event that moves a point. That was reused in several tests in that script. However, in `test_data_loader_widget.py` we also needed to move an event and see if the Tracks layer was accordingly updated. That is why, in the end I though that it would be better to add a factory fixture in `tests/fixtures/napari.py` called `move_point()` that is reused both in `test_convert.py` and `test_data_loader_widget.py`. What do you think of this approach? 

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `588db617e8a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.