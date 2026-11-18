# Issue

**Title:** Fix for deleted layers hanging around in CurationWidget

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

Adds a function to the constructor of curation.py which removes the curation widget's internal layer references (e.g. self.training_data_cell_layer...) if that layer is deleted from the Napari viewer. This prevents the "training data layers already exist, overwrite with empty layers?" popup from occurring in CurationWidget when you delete training data layers from the viewer and then try to create new training data layers from the CurationWidget.

I'm uncertain what other parts of the codebase are affected by this bug, if any, so I'd like to extend functionality to other areas affected by this bug if anyone happens to know what is affected off the top of their head.

**What is this PR**

- [x] Bug fix

**Why is this PR needed?**

 for the CurationWidget.

**What does this PR do?**

Synchronizes layer deletion between the napari viewer and CurationWidget.

## References

#345

## How has this PR been tested?

- Ran pytest without and with inserted code; no change to pytest results.
- Opened curation widget and created signal/background layers from sample data and cell/non-cell layers according to https://brainglobe.info/tutorials/cellfinder-detection.html. Attempted to create training layers, then deleted training layers from viewer, then re-created layers; no "training data layers already exist" popup occurs. Popup still occurs if one or both training layers are present when you attempt to create training layers (as expected).

## Is this a breaking change?

Not breaking.

## Does this PR require an update to the documentation?

No documentation updates seem to be necessary.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de7e4a7596ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.