# Issue

**Title:** Validate metadata

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other 

**Why is this PR needed?**
`_rich_atlas_metadata` expects that the metadata has only a single comma, in a specific place. However, some atlasses have citation metadata without comma or containing multiple commas, for these there will be an error when trying to print their information to the screen.  for more context. 

**What does this PR do?**
- `_rich_atlas_metadata` does not split citation string up in two parts (using a comma as seperator) like before.
- `validate_metadata` function added to validate the type of metadata of generated atlasses

## References
#525 

## How has this PR been tested?
- `test_validate_metadata` checks whether metadata is validated correctly for a few testcases
- Visual inspection of the rich panel before and after change (see screenshot below).

Before (**left**) and after (**right**; note the comma after "Wang et al 2020"):
![image](https://github.com/user-attachments/assets/06be889a-7fef-4771-9fe5-38fd16eddb44)

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cffe90272229`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.