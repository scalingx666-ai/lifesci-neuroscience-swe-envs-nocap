# Issue

**Title:** Set property edited=True on removed predictions

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

We have added an `edited` property to flag the points that were edited (dragged) from the original dataset (#1041). When a point is instead deleted, `napari` removes the row from the layer's live properties table entirely. So, by the time `napari_layers_to_ds` reconstructs the dataset, a removed point looks indistinguishable from a point that was simply never tracked. Both reconstruct with `edited = False`. 

We want to keep track of both dragged and removed points. Thus, we need to change the implementation to support removed points flagged as `edited = True`. 

**What does this PR do?**

This PR updates `napari_layers_to_ds` in `movement/napari/convert.py` to also infer `edited=True` for removed points. 

Since a deleted point no longer appears in the `napari` live properties table, we need to infer removed points by comparing the reconstructed dataset against the original. That is, if a point had a real (non-NaN) confidence value in `properties_with_nans` (original `ds`), but is now missing (`NaN` confidence) in the reconstructed `confidence_da`, it's treated as removed and flagged as `edited = True`. 


## References

This PR extends the implementation in #1041 to `edited` properties `True` for removed points. 
It is also part of #993. 

## How has this PR been tested?

Added `test_removed_point_marked_edited` in `tests/test_unit/test_napari_plugin/test_convert.py`, mirroring the existing `test_edited_pose_napari_layers`. Instead of dragging a point, in this case we remove it and assert the reconstructed dataset has `edited = True` at the point's coordinate and `edited.dtype == bool`. 

The rest of the tests written in `tests/test_unit/test_napari_plugin/test_convert.py` still pass, indicating that this change does not break any functionality. 

## Is this a breaking change?

No. This just changes `edited` properties when points are removed from `False` to `True`

## Does this PR require an update to the documentation?

No. 

## Checklist:

- [ ] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd8c241c014d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.