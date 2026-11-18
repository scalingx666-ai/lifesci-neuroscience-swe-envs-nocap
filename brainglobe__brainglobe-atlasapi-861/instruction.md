# Issue

**Title:** Change mask caching strategy

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Mask caching checked for the existence of the corner chunk of the zarr array on disk. However, if the chunk is empty, zarr doesn't write it to disk and generates dynamically. This was causing caching to fail for multiple masks, causing the download to be triggered on each run.

**What does this PR do?**
Changes the cache strategy to just check the existence of the mesh directory, rather than the corner chunk of the array.

## How has this PR been tested?
Tested locally, new test added.

## Is this a breaking change?
No

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9f5138ac218`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.