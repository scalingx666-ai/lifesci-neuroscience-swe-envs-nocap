# Issue

**Title:** [New Atlas]: Adds the Kim Lab unified mouse brain atlas (20 µm isotropic resolution)

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [X] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
The Kim Lab unified mouse brain atlas at 20 µm isotropic resolution is not currently available in the atlas repository.

**What does this PR do?**
Adds the Kim Lab unified mouse brain atlas (20 µm isotropic resolution), including template and annotation volumes in Brainglobe format.

## How has this PR been tested?
The atlas conversion script was run locally and passed the existing atlas generation checks.
The resulting atlas was visually inspected in Napari to confirm correct orientation and anatomical alignment. 

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
Yes, updated README.md

## Checklist:

- [X] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24451f2f66fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.