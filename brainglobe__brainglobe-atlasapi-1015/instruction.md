# Issue

**Title:** Replace PyMCubes with skimage marching cubes

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
 

**What does this PR do?**
Replaces PyMCubes with skimage as per the discussion.

## References
 

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?
Meshes built and visually inspected.
Tests added.

## Is this a breaking change?
No, the output should stay basically the same.

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a492ee013e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.