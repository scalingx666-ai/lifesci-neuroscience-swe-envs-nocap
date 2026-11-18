# Issue

**Title:** Hide _factorized properties from Points layer tooltips

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other: UX improvement

**Why is this PR needed?**

When hovering over keypoints in a Points layer, properties like "individual_factorized" and "keypoint_factorized" appear in the tooltip.

This can be confusing for users, who probably have no idea what "factorized" even means in this context. Moreover, the information is superfluous, as the "individual" and "keypoint" properties are already shown.

These "factorized" properties are created by us during loading, because they are necessary for color assignment in Tracks and Shapes layers. They are not needed in the Points layer, and they were not shown in old versions of `movement`.

The current behaviour was likely inadvertently introduced while refactoring the loader widget to share properties across layer types.

**What does this PR do?**

Filters out columns ending in `_factorized` when passing properties to the Points layer specifically.

It also updates the link to the Aeon habitat (a failing linkcheck alerted me to this).

## References

N/A

## How has this PR been tested?

Existing tests have been updated to verify that the modification applies to Points but not Tracks layers.

I've also verified that the "factorized" properties no longer appear in `napari`.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No. The [GUI guide](https://movement.neuroinformatics.dev/latest/user_guide/gui.html) is correct, as it was created before the "bug" was introduced.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- ~[ ] The documentation has been updated to reflect any changes~
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ed8d852310d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.