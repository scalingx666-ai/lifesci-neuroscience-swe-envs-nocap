# Issue

**Title:** Initial V1.5 implementation

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
 

**What does this PR do?**
This PR creates a new `BrainGlobeAtlasV2` class that inherits from `BrainGlobeAtlas` and overrides any methods that need to be changed for V1.5 to work.

Downloading an atlas to a fresh `.brainglobe` directory triggers the following:
- Local name for the requested atlas is not found (this specifically checks for the `json` e.g. `allen_mouse_100um_v1.2.json`
- The `json` is fetched from the [GIN](https://gin.g-node.org/BrainGlobe/atlases-v2) repository
- The metadata from the `json` is read, and directories for the annotations, template, and meshes are created
- `structures.json` and `structures.csv` are fetched for the appropriate annotations
- The `BrainGlobeAtlasV2` object is instantiated

The actual annotations and template images are not fetched at this time, nor are the meshes.

When the user requests the annotations or references by calling `atlas.reference` or `atlas.annotation` the respective data is fetched at the correct resolution. Meshes are fetched individually when they are requested for now.

Things that still need attention/discussion:
- Need to add a function/API endpoint to force download all data for a given atlas
- Fetch the meshes in a grouped way some how (parent, and 2 levels of children perhaps?)
- Print/log a warning the first time the annotation/template data is requested to inform the user it has to be downloaded first
- I'm also not a fan of needing to download the `structures.json` and `structures.csv` to instantiate the Atlas object but that would involve more changes to `core.Atlas` which I've tried to avoid for now.
- The function that sets up the atlas is named `download_extract_file` even though we're not longer extracting, this is to keep compatibility with the `__init__` method of `BrainGlobeAtlas`.

## References
#562

## How has this PR been tested?
Added tests that compare the data between a V1 atlas and a V2 atlas where possible.

## Is this a breaking change?
Sort of. All V2 atlases live in a `.brainglobe/atlases` directory, ensuring compatibility with the current V1 layout. However, the cached `last_versions.conf` file is overwritten in the `.brainglobe` directory.

## Does this PR require an update to the documentation?
Will have to come later.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48ff3606087b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.