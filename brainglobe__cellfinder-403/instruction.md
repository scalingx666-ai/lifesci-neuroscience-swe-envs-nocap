# Issue

**Title:** Add codecov token

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [X] Other

**Why is this PR needed?**
Codecov is currently complaining on all actions runs with: `secret-codecov-token is not set. This will be required in the future. See https://docs.codecov.com/docs/quick-start#step-2-get-the-repository-upload-token on how to get a token.` and `Codecov: Failed to properly upload report: The process 'D:\a\_actions\codecov\codecov-action\v4\dist\codecov.exe' failed with exit code 1`

**What does this PR do?**
This PR ensures `test_and_deploy` is using the codecov token, as recommended in the [readme for the neuroinformatics unit test action](https://github.com/neuroinformatics-unit/actions/tree/main/test#python-test-action)

## References

None

## How has this PR been tested?

Hopefully codecov won't error on the github actions runs for this PR

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Checklist:

- [X] The code has been tested locally
- [X] Tests have been added to cover all new functionality (unit & integration)
- [X] The documentation has been updated to reflect any changes
- [X] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `152ece572a10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.