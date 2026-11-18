# Issue

**Title:** Reconstruction of removed napari pose predictions back to movement ds

## Description

## Description

This PR extends `napari_layers_to_ds` to correctly handle deletion of pose predictions in napari, and adds test coverage for the different ways that can happen.

As @sfmig highlighted in #1011 (), when you remove a point in napari, that prediction is not set to  a ``NaN`` value. Instead, the entire row is removed, both from the points layers and its properties.


This PR extends `napari_layers_to_ds` so that a keypoint or individual with no data left anywhere is dropped entirely from the reconstructed dataset, rather than kept as an all-NaN coordinate, and raises a ValueError if every point has been removed. It also adds unit tests covering these deletion scenarios.

With the following implementation, we extend `napari_layers_to_ds` to (1) restore removed points from napari layers back to `movement` ds as `NaNs`;  (2) drop entirely an individual or keypoint from the reconstructed dataset when it has been completely removed from the napari layers; (3) raises `ValueError` when all predictions have been removed; (4) adds unit test to check the utility of this function in the multiple deleting scenarios. 

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Same reasoning as in #1024. We want ``napari_layers_to_ds()`` to reconstruct the napari layers back to ``movement`` dataset. Removing predictions is a type of edit to be implemented. 

**What does this PR do?**

In `movement/napari/convert.py`:

- After reconstructing the dataset, `napari_layers_to_ds` now drops any keypoint with  or individual with no data left anywhere (all `NaN` across every other dimension), rather than keeping it as an all-NaN coordinate. `time` is never dropped this way. A frame with no detections still stays in the timeline.
```python
# Drop keypoints/individuals with no data left; never `time`.
        ds = ds.dropna(dim="keypoint", how="all").dropna(
            dim="individual", how="all"
        )
```
- If the edit leaves no keypoints or no individuals at all (i.e. every point was removed), the function raises `ValueError` instead of silently returning an empty dataset.
```python
if ds.sizes["keypoint"] == 0 or ds.sizes["individual"] == 0:
            raise logger.error(
                ValueError(
                    "No points found in the napari layer. "
                    "This happens when all points have been removed."
                )
            )
        return ds
```

In `tests/test_unit/test_napari_plugin/test_convert.py`:

- Added `_target_points_to_remove` and `_remove_points` test helpers to simulate napari point deletion for keypoint/individual/frame selections.
- `test_removed_pose_napari_layers_restores_nans`: tests if partial removal (a keypoint, an individual, a single frame, or a frame range) always leaves something behind, so the affected points come back as NaN and nothing is dropped. Parametrized over datasets with and without pre-existing `NaN`.
- `test_removed_pose_napari_layers_drops_empty_coord`: if we fully remove a keypoint or an individual, does `napari_layers_to_ds` drop it entirely from the reconstructed dataset.
- `test_removed_pose_napari_layers_empty_ds`: tests if removing every point on the dataset raises `ValueError`.
- `test_never_detected_keypoint_dropped_on_round_trip`: test if a keypoint that was never detected by the tracker (all-NaN in the source file) is indistinguishable from a user-deleted one once loaded into napari, so it's dropped on conversion too, even with no user edits at all.

## References

Part of #1008. . Related to #993.

## How has this PR been tested?

The new test has been added to the unit test suit and passes locally.

The implementation has also been verified interactively in napari to confirm that deleting a point removes the corresponding row from Points layer and the associated properties (confidence). 

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d9a4b360b14`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.