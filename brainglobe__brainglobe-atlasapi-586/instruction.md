# Issue

**Title:** Add additional_references keys on construction

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
 

**What does this PR do?**
On `AdditionalRefDict` construction all additional references passed in the `references_list` are added to the dict with `None` as the entry. When `__getitem__` is called, it now checks if `self.data[ref_name] is None` to see if the reference has been loaded to memory, if not it opens the additional reference file and saves it in the dict.

## References
 

## How has this PR been tested?
All existing tests pass.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
Yes. We should document the canonical way to fetch a list of names for the additional references from within the API.

Something like `tuple(atlas.additional_references)`?

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62b89b465c5d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.