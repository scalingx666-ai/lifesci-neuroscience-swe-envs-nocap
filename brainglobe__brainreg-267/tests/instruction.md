# Issue

**Title:** Use argument-list subprocess calls for NiftyReg commands

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
- NiftyReg commands in brainreg are currently constructed as shell strings, which can be fragile when file paths contain spaces and lead to platform-dependent behavior.

**What does this PR do?**
- It updates all NiftyReg command invocations to use argument-list based subprocess execution instead of shell-based string commands. This removes the need for manual quoting and safely handles paths with spaces on all platforms.

## References
- brainreg issue #4 
- depends on corresponding update in brainglobe-utils 

## How has this PR been tested?
- Tested locally on Windows with input, output, and install paths containing spaces.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1757ba2ad904`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.