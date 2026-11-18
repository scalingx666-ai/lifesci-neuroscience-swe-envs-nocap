# Issue

**Title:** Cellfinder test fix

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
'brainmapper' tests were failing due to a directory not existing before being writen to.

**What does this PR do?**
Now creates the directory tree before trying to write a config file.

## References
Closees 

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?
All tests pass on CI.

Please explain how any new code has been tested, and how you have ensured that no existing functionality has changed.

## Is this a breaking change?
No

If this PR breaks any existing functionality, please explain how and why.

## Does this PR require an update to the documentation?
No

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://brainglobe.info/community/developers/index.html#to-improve-the-documentation) for details.

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de73504d4264`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.