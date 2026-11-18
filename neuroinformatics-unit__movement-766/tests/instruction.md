# Issue

**Title:** Use `tox-uv` in test action

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

In this PR I experimented with using `tox-uv` for the "test" action of our CI, to see if it circumvents #762.
For context #762 is currently blocking all of our CI jobs.

**What does this PR do?**

- I first tested using the `tox-uv` branch of our `actions`,  introduced in 
- After confirming that it worked, and merging  I updated this PR to use `actions@main` as the source for the "test"action.

## References

- Closes 
- 

## How has this PR been tested?

The tests pass in CI.

> [!note]
> The failing "Build Sphinx Docs" action is due to #767, which is being addressed in a separate PR #768 

## Is this a breaking change?

No. 

## Does this PR require an update to the documentation?

No.

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc2f4aef7013`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.