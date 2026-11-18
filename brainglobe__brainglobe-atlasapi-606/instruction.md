# Issue

**Title:** Use Zip Stores for V2 atlases

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
V2 atlases currently use the default DirectoryStore from Zarr. To simplify file downloading and allow hashing of each atlas component this PR changes the store to ZipStore both locally and on GIN.

**What does this PR do?**
Updates `bg_atlasv2.py` to use ZipStore.
Updates metadata fields to change nomenclature from `template_images` and `annotation_images` to `template_names` and `annotation_names` instead.

The [V2 GIN repository](https://gin.g-node.org/BrainGlobe/atlases-v2) has been updated to reflect these changes.

## References
#604 
#562 

## How has this PR been tested?
All current test pass, and downloading and visualisation of V1.5 atlases inspected manually.

## Is this a breaking change?
Yes, the atlases in the V2 GIN repository are now stored as Zip Stores, previously installed V2 atlases will fail. Suggestion is to delete `~/.brainglobe/atlases` directory prior to testing.

## Does this PR require an update to the documentation?
Not at this time.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0c1ede544e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.