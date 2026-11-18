# Issue

**Title:** Updated supported Python versions to 3.12 - 3.14

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other: dependencies

**Why is this PR needed?**

We try to adhere to [SPEC0](https://scientific-python.org/specs/spec-0000/) on supported Python versions, when possible. This means we'd have to support 3.14 and drop 3.11.

`napari` and `pytables` were previously blocking us from adding py3.14 support, but both projects have now released 3.14-compatible wheels ().

**What does this PR do?**

Updates supported Python versions across config files and CI workflows.

## References

 
Previous attempt: #702

## How has this PR been tested?

CI.
Also, `uv tool install movement --python 3.14` works fine on MacOS.

## Is this a breaking change?

Yes, in the sense that Python 3.11 will no longer be supported from our next release onwards. But older `movement` versions will work fine with Python 3.11.

## Does this PR require an update to the documentation?

Installation docs now suggest 3.14 (latest supported Python version).

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd4314728b76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.