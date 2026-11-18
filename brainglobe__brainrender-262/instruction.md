# Issue

**Title:** Potential fix for test_ruler_from_surface, removed transformation

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Fix the test_ruler.py::test_ruler_from_surface.

**What does this PR do?**
Update the API calls to vedo for intersectWithLine(). Removing the Mesh::apply_transform call to meshes in render,py fixes the test and also allows most examples to render correctly (without weird transpositions - cells outside of the brain region, etc...). 

## References
 

## How has this PR been tested?
Tested locally, all non-slow tests pass!

## Is this a breaking change?
No

## Checklist:

- [x] The code has been tested locally
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3cf712a24625`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.