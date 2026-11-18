# Issue

**Title:** Ensures boundaries layer is displayed in `napari`

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
 

**What does this PR do?**
Removes hard coded indexes that assume the order of layers returned by [`load_registration`](https://github.com/brainglobe/brainglobe-napari-io/blob/6da22d5b2c793f3fd012800889ee42ac3f0b5a83/brainglobe_napari_io/brainmapper/brainmapper_reader_dir.py#L151-L162).

This PR sets the "expected" default, but adds logic to double check the layers are correct.
The test now fetches the layers by name, if the layers aren't present the test will error.

## References
 

## How has this PR been tested?
All tests pass again.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d002a1bb42d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.