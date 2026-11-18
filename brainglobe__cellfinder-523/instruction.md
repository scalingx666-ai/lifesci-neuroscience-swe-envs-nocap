# Issue

**Title:** Fix #423 : Clean up TensorFlow-related code after migrating to Keras 3.0 with PyTorch backend

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
This cleans up the TensorFlow-related code in the cellfinder project by:
- Moving Keras imports from within functions to the top of `train_yaml.py`
- Removing the comment about TensorFlow warning suppression from `train_yaml.py`

**What does this PR do?**
- These changes align with the project's migration to Keras 3.0 with PyTorch as the default backend, making the codebase cleaner and more maintainable. 
- The functionality remains intact while removing unnecessary TensorFlow-specific error handling and import patterns.

## References
- #423 
- #418 

## How has this PR been tested?
- Successfully ran all pre-commit hooks locally.
- Verified `train_yaml.py` shows no linting issues after cleaning up imports.

## Is this a breaking change?
 - No
 
## Does this PR require an update to the documentation?
- No
## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5060682ec2d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.