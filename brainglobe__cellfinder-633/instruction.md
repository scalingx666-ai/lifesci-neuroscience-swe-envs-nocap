# Issue

**Title:** Validate test-uv action in CI

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
- To validate the experimental ```test-uv``` action.

**What does this PR do?**
- Replaces the current tox-based test action with the experimental uv-based test action.

## References
-  
- 

## How has this PR been tested?
- Tested locally with:
   - ```uv pip install -e .[dev]```

   - ```uv run pytest```

## Is this a breaking change?
- No.

## Does this PR require an update to the documentation?
- No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed146a5a601f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.