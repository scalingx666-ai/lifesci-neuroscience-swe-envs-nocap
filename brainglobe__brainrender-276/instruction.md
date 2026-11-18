# Issue

**Title:** Fix video test

## Description

⚠️ Depends on #277 being merged first 

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
The local video tests fail because we don't install, or document anywhere explicit, (AFAICT) that `ffmpeg` is needed (the command line tool).

**What does this PR do?**
Makes the video tests not local, and sets up `ffmpeg` on CI.

## References

People have struggled with this before: #202 


## How has this PR been tested?

This PR adds extra tests (previously only run locally) to the CI

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02b7565d72b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.