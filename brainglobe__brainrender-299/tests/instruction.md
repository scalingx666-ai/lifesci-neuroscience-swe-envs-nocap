# Issue

**Title:** Unpinned h5py version

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

## Description

Compatiblity with [MorphIO v3.3.7](https://github.com/BlueBrain/MorphIO/releases/tag/v3.3.7)

- [x] Other

**Why is this PR needed?**
Windows tests were failing due to a MorphIO update.

**What does this PR do?**
Unpin h5py from <=3.9.0 to ensure the correct hdf5 version is installed.

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47f04f92ed0a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.