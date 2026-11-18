# Issue

**Title:** Support all registered loaders in GUI unless excluded

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Support for loading the COCO .json results format was added in #1092 but we forgot to expose the format through our GUI.

**What does this PR do?**

- Adds the format to the `SUPPORTED_POSES_FILE` in `movement.napari.loader_widgets`, so it appears in the `source_software` dropdown of our GUI.
- Adds a section to the "Implementing new loaders guide", so we don't forget to do this in the future.

I also thought about automating this step, by using [`get_supported_source_software()`](https://movement.neuroinformatics.dev/dev/api/movement.io.load.get_supported_source_software.html).
However, not all supported formats can be loaded in the GUI. 3D data doesn't work, so 3D-only formats, like Anipose, would have to be excluded. That basically still implies a manual step, but it shifts the inclusion in the GUI from opt-in to opt-out. @lochhh let me know if you prefer that, and I could switch to that option.

## References

.

## How has this PR been tested?

I launched the GUI and verified the new option appears.

I also rendered the docs locally and checked how the new section of the contributing guide renders.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

Contributing guide has been updated.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96733f808885`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.