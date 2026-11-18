# Issue

**Title:** Propagate image scale to napari Points layers

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
-  When using anisotropic voxel sizes in napari, points created by the cellfinder napari plugin (like cell candidates and classified cells) were not inheriting the image scale, causing the detected points to be misaligned with the image.

**What does this PR do?**
- This PR ensures that points created by the napari plugin inherit the image scale.

## References
-  

## How has this PR been tested?
- It was tested locally in napari using anisotropically scaled image layers. Points added via the cellfinder plugin now align correctly with the image.

## Is this a breaking change?
- No, this change only affects the visualization of points in napari.

## Does this PR require an update to the documentation?
- No, this fixes a bug in existing behavior.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2646ced26877`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.