# Issue

**Title:** use pyvista action for headless display in tox

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Tests fail weirdly with a display-related thing on Windows CI.

**What does this PR do?**

Brings the CI set-up of the headless display in line with `napari` and our `napari` plugins, ie uses a `pyvista` GitHub action to set up the headless display.

## References

 

## How has this PR been tested?

CI tests now all pass :tada: 

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Checklist:

- [NA] The code has been tested locally
- [NA] Tests have been added to cover all new functionality (unit & integration)
- [NA] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8866e3a76247`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.