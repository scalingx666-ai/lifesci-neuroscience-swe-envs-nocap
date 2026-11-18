# Issue

**Title:** Set confidence of edited points in napari to NaN

## Description

## Description

This PR adds a unit test verifying that edits made to pose data in napari Point layer are correctly preserved when converting back to ``movement`` dataset using ``napari_layers_to_ds()``.

The test simulates editing coordinates of one visible point (no ``NaN``) in the napari Points layer and updating its confidence value in the associated properties. It then reconstructs the dataset and checks that both edits are present in the output from ``napari_layers_to_ds()``. 

A key detail is that the test uses two boolean masks that express the same logical selection: the ``centroid`` keypoint, of ``id_0`` at frame ``2``. These masks are defined separately because they are applied to different objects. ``loader.points_layer.properties`` corresponds to the filtered napari Points layer, and excludes rows with ``NaN``. While ``loader.properties`` keeps the full original set of rows, including ``NaN`` positions. So these objects have different lengths, so we cannot really use the same mask here. From what I understand. Give me your opinion on this. We need to use ``loader.properties`` (with NaN) because ``napari_layers_to_ds`` reads confidence from ``properties_with_nans``. Modifying ``loader.points_layer.properties["confidence"]`` would have no effect on the reconstruction dataset. 

Although the mask is "duplicated", this can ensure that the test reflects the actual ``DataLoader`` widget behavior. 

Alternatively, we could also consider factoring the repeated condition into a small helper. Something like this: 
```python
def _at(props):
    return (
        (props["time"] == frame)
        & (props["keypoint"] == keypoint)
        & (props["individual"] == individual)
    )
```
And then calling: 
```python
loader.points_layer.data[_at(loader.points_layer.properties), 1] = 100
loader.points_layer.data[_at(loader.points_layer.properties), 2] = 200
loader.properties.loc[_at(loader.properties), "confidence"] = 1.0
```
I think this would reduce the repetition, but need to test this locally. 

What are your thoughts about this? 

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
``napari_layers_to_ds()`` converts napari Point layers back to ``movement`` xarrays. But the ultimate goal of #993 is to be able to edit the trajectories and save them back from napari to ``movement``. Thus this function not only needs to be able to reconstruct the original structure, but also incorporate some edits. 


**What does this PR do?**

We add a simple unit test that simulates user editing point coordinates in napari Point layer and then converts this edit to a ``movement`` ds using ``napari_layers_to_ds()``. 

As we have discussed, the confidence values in properties are set to 1.0 after an edit. This is important because if we edit a point with a low-confidence value, and the confidence is not reassigned, it would be filtered out in subsequent workflows (e.g. interpolate low-confidence predictions). But, since it's going to be manually edited, we expect it to be correct. 

This is something we need to further discuss, but for this test I simply reassigned the confidence to 1.0. 

The test verifies that both the position and confidence edits are present in the reconstructed dataset and that ``napari_layers_to_ds()`` is correctly saving the expected outputs after the edit. 

## References

This is part of 
- #1008 
- 

Related to #993 

## How has this PR been tested?

The new test has been added to the unit test suit and passes locally. 

## Is this a breaking change?

No. 

## Does this PR require an update to the documentation?

No. 

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42adc97b37aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.