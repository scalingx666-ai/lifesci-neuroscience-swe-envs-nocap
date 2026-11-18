# Issue

**Title:** pass DISPLAY env var to tox

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Currently ubuntu test running crashes on CI

**What does this PR do?**

Sets up `tox` so it passes the DISPLAY env var from the host env to the tox env.

## References

 

## How has this PR been tested?

On Ubuntu, `tox` and `gh act -j test` now don't fail with a Fatal error locally or on CI, but rather fail as documented in #255 

## Is this a breaking change?

Nope.

## Does this PR require an update to the documentation?

Nope.

## Checklist:

- [x] The code has been tested locally
- [n/a] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3fd335999098`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.