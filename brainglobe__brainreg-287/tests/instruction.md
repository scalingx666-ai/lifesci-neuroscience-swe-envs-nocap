# Issue

**Title:** Silence noisy loggers to prevent string parse errors

## Description

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Tests were failing when logged at DEBUG level due to malformed strings being passed around through the log tree.

**What does this PR do?**
Sets the level of logging for "noisy" libraries to WARNING rather than DEBUG.

## How has this PR been tested?
Tests pass locally.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://brainglobe.info/community/developers/index.html#to-improve-the-documentation) for details.

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65ce5ca7203b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.