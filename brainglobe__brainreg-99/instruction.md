# Issue

**Title:** update setup.py for napari optional install

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

## Description

Fix issues with macOS install, M1 M2 chip and pyside2 by splitting imports to default (CLI tools only) and [napari] to cover GUI, including pyside2 #77

**What is this PR**

- [ X] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Brainreg fails on M1, M2 chips due to lack of upside build 

**What does this PR do?**

splits imports into CLI and napari

## References

Please reference any existing issues/PRs that relate to this PR.

#77

## How has this PR been tested?

tested with manual install

## Is this a breaking change?

No

If this PR breaks any existing functionality, please explain how and why.

## Does this PR require an update to the documentation?

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://docs.cellfinder.info/for-developers/documentation) for details.

## Checklist:

- [ X] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d2b40e96606`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.