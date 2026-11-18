# Issue

**Title:** Migrate to pyproject

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [x] Other

**Why is this PR needed?**

Migrates our package from `setup.py` to `pyproject.toml`. 

Also cleans up some old scripts that are no longer documented or intended for use.

**What does this PR do?**

-  (removes the old CLI functions that are no longer intended for use)
-  (removes the need for the dependencies)
-  (moves to `pyproject.toml` framework)
- Updates CI to deploy using NI-unit actions.

## References

-  
- 
-  

## How has this PR been tested?

Local install testing, and CI install testing (CI changes do not affect this process).

## Is this a breaking change?

## Does this PR require an update to the documentation?

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33add8574a89`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.