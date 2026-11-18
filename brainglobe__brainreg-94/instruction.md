# Issue

**Title:** Fix additional flag extra tiff extension

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

## Description

This merge will fix the additional .tiff extension if a .tiff file is passed to --additional flag, addresses brainglobe/brainreg#83

This could more succinctly be fixed by editing [here](https://github.com/JoeZiminski/brainreg/blob/a500e3cae7a88b9c9892a29a21795d9a0cad5d66/brainreg/cli.py#L186), happy to change to this but thought there was a higher chance of breaking some else with this high-level change.

**What is this PR**

- [X] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

addresses brainglobe/brainreg#83

**What does this PR do?**

Fix double .tiff extension on output files when .tiff file is passed to --additional

## References
addresses brainglobe/brainreg#83

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?
tested locally with pytest 

Please explain how any new code has been tested, and how you have ensured that no existing functionality has changed.

tested locally with pytest, low-level change that only changes the filename immediately before writing output file

## Is this a breaking change?
No

If this PR breaks any existing functionality, please explain how and why.

## Does this PR require an update to the documentation?
No
If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://docs.cellfinder.info/for-developers/documentation) for details.

## Checklist:

- [X] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87b4bec50801`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.