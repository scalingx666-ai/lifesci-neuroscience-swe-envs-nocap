# Issue

**Title:** Changing -d --downsample flag to -a --additional

## Description

- changed -d -downsample arguments to -a -additional. Updated tests so all pass. Issue brainglobe/brainreg#84

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [X] Other

**Why is this PR needed?**
Make the -d / --downsample argument clearer as it rather takes additional images to be processed.

**What does this PR do?**

changes -d and --downsample flags to -a and --additional

## References

Please reference any existing issues/PRs that relate to this PR.

Issue brainglobe/brainreg#84

## How has this PR been tested?

The flags in testing code (-d) was changed (to -a) and all tests ran.

Please explain how any new code has been tested, and how you have ensured that no existing functionality has changed.

All test passed after change

## Is this a breaking change?

no 

If this PR breaks any existing functionality, please explain how and why.

NA

## Does this PR require an update to the documentation?

Yes, the README.md was updated as part of the PR. The documentation at [here](https://docs.brainglobe.info/brainreg/user-guide) needs to be updated

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://docs.cellfinder.info/for-developers/documentation) for details.



## Checklist:

- [X ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5b0e623c422`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.