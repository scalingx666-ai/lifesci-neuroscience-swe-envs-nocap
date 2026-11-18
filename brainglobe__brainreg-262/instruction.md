# Issue

**Title:** Add brainreg[napari] to dev dependencies

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Currently, running `pip install brainreg[dev]` does not return a fully functional installation as the `napari` dependencies are required to run the tests. I typically expect the optional `dev` dependency to allow me to run the entire test suite.

**What does this PR do?**
Adds `brainreg[napari]` to the optional dev dependencies to ensure the `dev` install can run tests right out of the box.

## References

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?
Tested locally in a fresh environment.

## Is this a breaking change?
No?

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b63c3dc4b38a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.