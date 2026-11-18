# Issue

**Title:** Adding edited properties to napari layers when a keypoint is dragged.

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [X] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

When a user manually drags a point in the napari Points layer, `movement` already sets that point's confidence to `NaN` (#1024) to flag it as no longer coming from the original pose estimation model.

 However, there was no way to distinguish a point that was manually corrected from one that originally has `NaN` (e.g. during occlusions). 

That is why, to easily track which points were moved, in this PR we propose an `edited` property (bool), which will set as `True` all the points that were dragged by the user in the napari layers. 

**What does this PR do?**

-  Adds an `edited` boolean property, set to `True` for points a user has dragged in the napari Points layer (`_on_points_data_changed` in `loader_widgets.py`). The property is only created the first time a point is edited, so datasets/layers with no edits never carry it.
- `ds_to_napari_layers` includes `edited` in the properties DataFrame when the source dataset has an `edited` variable.
-  `napari_layers_to_ds` reconstructs an `edited` data variable (defaulting missing values to `False`) when converting napari layer data back into a `movement` dataset.

## References
Builds on #1024  and #1025 
It is part of #993 

## How has this PR been tested?

**Manually on the GUI**: 
When we load a dataset into the GUI (see image below), we see columns for keypoints, individuals, time and confidence. So when nothing is touched (dragged) the `edited` properties do not appear.  
<img width="1440" height="900" alt="Screenshot 2026-07-18 at 16 56 45" src="https://github.com/user-attachments/assets/d4a3bdf8-1224-4eec-9597-81d8421d7670" />

However, when we move a point, we see that confidence is set to `NaN` (implemented in #1024) and `edited` properties is set to True (see image below): 
<img width="1440" height="900" alt="Screenshot 2026-07-18 at 16 56 59" src="https://github.com/user-attachments/assets/eeff61d2-eae8-4559-a23c-85bf5f833d5d" />

I have further tested that dragging a second point then updates the `edited` to `True`. 

**Tests**:
Added in `tests/test_unit/test_napari_plugin/test_convert.py`

- I added a helper function called `_move_point` to simulate a user dragging a point and not repeating it across consecutive tests. 
- Edited the current tests on editing/removing keypoints (e.g. `test_edited_pose_napari_layers`, `test_removed_pose_napari_layers_restores_nans`, etc.) to directly test if `napari_layers_to_ds` returns edited properties. It needs to be `True` for edits and `False` for removal. 
- I added a roundtrip test called `test_edited_property_round_trip` to test if a returned ds from `napari_layers_to_ds` includes the edited properties when it is loaded back to napari layers. 

## Is this a breaking change?

No. 

## Does this PR require an update to the documentation?

The documentation has not been updated yet. 

## Checklist:

- [X] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [X] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `915792df792e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.