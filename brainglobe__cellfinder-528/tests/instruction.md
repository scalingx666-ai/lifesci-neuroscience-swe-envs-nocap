# Issue

**Title:** make check_training_data_exists more strict, and test it

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**What does this PR do?**

~~Makes `check_training_data_exists` more strict, by requiring both non-empty training data layers to return True.~~
For `check_training_data_exists`, this PR
- Improves the user messages and UI
- makes the code more explicit
- adds tests and docstring for this function.

## References

 

## How has this PR been tested?

Local `pytest`

## Is this a breaking change?

Yes - users can't get away with a non-existent training data layer anymore.

## Does this PR require an update to the documentation?

Our tutorial still works the same, so no change needed there. This change enforces good practice with users.
Have added a docstring to a function that didn't have one.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b14b22484ecd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.