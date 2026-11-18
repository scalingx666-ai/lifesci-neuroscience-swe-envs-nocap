# Issue

**Title:** Trusted pypi publishing and release guide

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other: CI and docs

**Why is this PR needed?**

[Trusted Publishing](https://docs.pypi.org/trusted-publishers/) is the method recommended by PyPI, but our actions workflow was using the older, less secure method (having a long-lived token).

We've recently migrated  and are also  accordingly.

**What does this PR do?**

- Updates the `test_and_deploy.yml` workflow to use the trusted publishing route. I've already configured PyPI accordingly and I've also set up a GitHub environment named `pypi`, with deployment tag rule (`v*`).
- Updates the contributing guide. At first, I only meant to mention trusted publishing, but I realised that our "Versioning and releases" section was severely out of date. We already had some internal notes on how to make a new release (on HackMD), and I thought the time is ripe for porting them to the contributing guide. I originally meant for these notes to become part of a new 'Maintainer's guide' (#826), but since that will take time, better to have these as part of the current contributing guide rather than not at all. Therefore, this PR introduces a detailed "Making a new release" section, which is marked as being aimed at maintainers. The PR also updates the existing section on "Versioning" to document our practices re semantic versioning.

## References

- Follows the example of  and 
- The idea of documenting the release process as part of a 'Maintainer's guide' had been floated in 

## How has this PR been tested?

The new route has been confirmed to work by releasing `poseinterface` v0.2.0 succesfully.

I've checked the updated contributing guide via a local docs build.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

Yes, the contributing guide now includes a whole new section on 'Making a new release', and also mentioned trusted publishing.

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5fe7930b1891`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.