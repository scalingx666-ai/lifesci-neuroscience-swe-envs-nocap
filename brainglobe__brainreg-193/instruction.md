# Issue

**Title:** Harmonise napari plugin and CLI entry points

## Description

## Description
This PR makes sure the outputs of the napari plugin and CLI are equal. Previously, as highlighted in #192 by @AdrianAriasAbreu, there were differences when running the same data in the napari plugin and CLI. +


- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
The plugin and CLI should be two ways of achieving the same thing.

**What does this PR do?**
1. It ensures that the default parameters in the GUI are the same, are are displayed the same as the defaults in the CLI. Previously, some were made negative under the hood. This PR corrects this so everything matches.
2. It downsamples data in the exact same way as [`brainglobe_utils.image_io.load.load_any()`](https://github.com/brainglobe/brainglobe-utils/blob/main/brainglobe_utils/image_io/load.py) (as used by the CLI). 

## References

 (I think)

## How has this PR been tested?
The same data has been registered with the plugin and CLI and results confirmed to be the same. Existing tests pass.

## Is this a breaking change?

No

## Does this PR require an update to the documentation?
No, but I noticed some errors in the docs, updated in 

## Checklist:
- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7010a0b7f201`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.