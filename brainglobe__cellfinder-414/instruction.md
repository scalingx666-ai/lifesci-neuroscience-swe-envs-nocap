# Issue

**Title:** Simplify model download

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
The code to download trained models was unnecessarily complicated and had some bugs. This was leftover from when the same code also downloaded atlases (pre `brainglobe-atlasapi`). 

**What does this PR do?**
* Uses Pooch to download the models
* Refactors and simplifies some of the other downloading code
* Saves models into `.brainglobe/cellfinder/models` by default
* Adds checksum for the default model
* Adds a download progress bar

## References




## How has this PR been tested?

Automated tests have been updated and pass. Manual testing ongoing (it's very slow to properly test all scenarios as it involves downloading data). 

## Is this a breaking change?

No

## Does this PR require an update to the documentation?
No, but the `cellfinder_download` CLI should probably be documented. I've raised 

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eeffd7873b56`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.