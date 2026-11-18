# Issue

**Title:** Update lazy plane downsampling in napari

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
The downsampling step from the `napari` widget wasn't utilising multiple cores. 

**What does this PR do?**
Ensures the downsampling path in `napari` uses multiple cores

## References

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?

Please explain how any new code has been tested, and how you have ensured that no existing functionality has changed.

## Is this a breaking change?

If this PR breaks any existing functionality, please explain how and why.

## Does this PR require an update to the documentation?

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://brainglobe.info/community/developers/index.html#to-improve-the-documentation) for details.

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65ce5ca7203b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.