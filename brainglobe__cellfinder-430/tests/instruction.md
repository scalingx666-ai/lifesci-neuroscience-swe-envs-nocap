# Issue

**Title:** Moved force cpu into cellfinder function

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Tests in `brainglobe-workflows` fail on macos-latest as they attempt to run using `mps` which is not available on github runners even though `torch.backends.mps.is_available()` returns `True`.

**What does this PR do?**
Moves the logic for forcing PyTorch to use the cpu as the device into the `cellfinder` package. This will hopefully allow the fix from this repo to generalise to `brainglobe-workflows`.

## How has this PR been tested?
Tested on CI (only place I can reproduce this issue).

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0971d4ad862c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.