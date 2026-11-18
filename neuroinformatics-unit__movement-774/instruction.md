# Issue

**Title:** Move docs dependencies to pyproject.toml

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other (build configuration)

**Why is this PR needed?**
- Documentation dependencies were previously defined in ```docs/requirements.txt```, which duplicated dependency definitions outside of ```pyproject.toml```.

**What does this PR do?**
- Moves documentation dependencies into a docs optional dependency in ```pyproject.toml```.
- Removes ```docs/requirements.txt```.

## References
- Following this  in [Ethology](https://github.com/neuroinformatics-unit/ethology)

## How has this PR been tested?
- Installed docs dependencies locally using ```pip install -e .[docs]```, and build the documentation locally using ```make html```.

## Is this a breaking change?
- No.

## Does this PR require an update to the documentation?
- No update needed beyond this point.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed4beb5801fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.