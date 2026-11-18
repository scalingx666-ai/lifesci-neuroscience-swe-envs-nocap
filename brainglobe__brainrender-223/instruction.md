# Issue

**Title:** Changed 'lexer_name' param to 'lexer' for rich update

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

## Description

**What is this PR**

- [ X ] Bug fix
- [x] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Because a new version of rich is not compatible with previous versions of brainrender.

**What does this PR do?**
Changes the name of the parameter 'lexer_name' to 'lexer' to accommodate the change in newer versions of the rich dependency.

## References
Issue #219

## How has this PR been tested?
N/A

## Is this a breaking change?
Shouldn't be. But rich's version should be updated.

## Does this PR require an update to the documentation?
The version of Rich specified with pip or other dependency documentation should be updated.

## Checklist:

- [ x ] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [ x ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9d0a5ceb3fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.