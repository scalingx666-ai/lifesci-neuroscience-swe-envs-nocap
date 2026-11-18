# Issue

**Title:** Add fn_update as an optional argument

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
 added an indicator during the download, but because the code was functionally duplicative and we needed to keep the code simple by incorporating a new argument in bg_atlasapi.


**What does this PR do?**

Added fn_update as an optional argument in update_atlas/install_atlas function.

## References

Please reference any existing issues/PRs that relate to this PR.

- 

- 

## How has this PR been tested?

Please explain how any new code has been tested, and how you have ensured that no existing functionality has changed.

By running the following command:

`pytest -v --color=yes --cov=brainglobe_atlasapi --cov-report=xml`

## Is this a breaking change?

If this PR breaks any existing functionality, please explain how and why.

No

## Does this PR require an update to the documentation?

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://brainglobe.info/community/developers/index.html#to-improve-the-documentation) for details.

No

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `639c79822a27`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.