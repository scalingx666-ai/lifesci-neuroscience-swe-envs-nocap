# Issue

**Title:** Save widget for napari plugin

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [X] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

This PR is part of #993 (particularly addresses #997). Users can load their data into napari and use napari's native tools to dragg points and manually correct some predictions, or removed inaccurate detections. We have been working on the conversion of napari point layers back to `movement` dataset (#1011). However, we need to include a `Save` widget that calls this conversion function and saves it back to `movement` native format. This PR coverts the missing "Save" step. 

**What does this PR do?**

1. Adds a `DataSaver` widget (`movement/napari/save_widget.py`) with a single `Save` button. On click, it: 
     - Validates that the active layer is `PointsLayer` created by the `movement` `DataLoader` (this is the layer we want to save)
     - Calls `napari_layers_to_ds()` to reconstruct the `movement` `ds` from the napari Points layer. 
     - Writes the converted `ds` via `ds.to_netcdf()`, which is movement's native format. 
2. Writes `DataSaver` into `MovementMetaWidget` (`meta_widget.py`) as a new collapsible `Save tracked data` section. 
3. Adds two metadata keys in the `movement/napari/loader_widgets.py` called `PROPERTIES_KEY` and `ATTRS_KEY`, which carry the unfiltered properties, before the `DataLoader` filters out `NaN` when loading the data into napari layers. 
4. Adds `test/test_unit/test_napari_plugin/test_save_widget.py` to test the functionality  of the widget. The tests cover: 
    - widget instantation
    - three guard clauses 
    - a cancelled-dialog case 
    - a full load > save > reload roundtrip test 

<img width="1523" height="956" alt="Screenshot From 2026-07-20 16-30-35" src="https://github.com/user-attachments/assets/9e966b55-6e11-4142-99df-4be08d9f813d" />


## References

This PR focuses on Issue #997 (part of #993). 
It builds on top of: 
- #1011 : introduces `napari_layers_to_ds()`, the conversion function. 
- #1024 : ensures that moved (dragged) points have their confidence changed to `NaN`
- #1025 : ensures deleted keypoints are correctly set to `NaN` during reconstruction, or dropped in case all the predictions are removed. 

This PR is pending #1041 which adds an `edited` boolean property to flag the manually corrected (dragged) points. This widget will include edited properties once merged. 

## How has this PR been tested?

1. Unit tests: 
     - widget instantiates with a single `Save` button. 
     - clicking `Save` with no layer selected shows an error and never opens the file dialog
     - clicking `Save` on any other layers (not Point Layers) rejects the saving with an error. 
     - Cancelling the dialog does not save anything 
     - A round trip: load, save, reload the `.nc` file. 
3. GUI manually tested via `movement launch`. I loaded a sample dataset. I checked that the GUI includes the `Save` button. I dragged some points. I saved the file as `movement`'s native format. Then I reloaded the saved format and checked that the `confidence` were reloaded as `NaN`, as the expected behavior. 


## Is this a breaking change?

No, it's an additional tool. Doesn't break anything already implemented. 

## Does this PR require an update to the documentation?

Documentation is not updated. In a future PR we will add detailed documentation to help users understand how to use the "Save" widget. 

## Checklist:

- [X] The code has been tested locally
- [X] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [X] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69df94202d7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.