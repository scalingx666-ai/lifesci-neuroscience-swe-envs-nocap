# Issue

**Title:** Conversion from napari Points layers to movement pose datasets

## Description

## Description

This PR is part of  #1008 and provides support for converting edited napari Points layer data back to a ``movement`` pose dataset. 


- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

``movement`` currently provides functionality to convert pose datasets into napari layers. However, for #993 we need a way to convert back the edited Point layers to ``movement`` pose dataset, so the tracking corrections can be saved and reused in subsequent workflows. 

A particular challenge is that the ``DataLoader`` widget filters out points with ``NaN`` coordinates before creating the napari Points layers. During reconstruction, these missing detections must be restored so that the final dataset preserves the original structure. 

**What does this PR do?**

This PR adds ``napari_layers_to_ds()`` function that reconstructs napari Point layers to ``movement`` pose xarrays. It reconstructs the original structure, including missing predictions, using original properties. 

This PR also includes unit tests covering round-trip conversion. 

## References

Part of:
- #1008

Related to:
- #993

## How has this PR been tested?

The code has been tested manually in a local Jupyter notebook using example tracking data.

This implementation is also covered by unit tests that verify: 
- Round-trip conversion between ``movement`` datasets and napari Point layers. 
- Dataset reconstruction of ``NaN`` values. 

## Is this a breaking change?

No. This PR adds new functionality and should not change existing behavior.

## Does this PR require an update to the documentation?

Yes. 

API documentation has been added to ``napari_layers_to_ds()``. 

The documentation was also checked locally, according to the [contributing guidelines](https://movement.neuroinformatics.dev/latest/community/contributing.html#continuous-integration). 

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45d29ab7db52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.