# Issue

**Title:** minor bug fix bg_atlas.__repr__

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
When I was reviewing PR #517, I noticed a small bug demonstrated below.

```
atlas=BrainGlobeAtlas("nadkarni_mri_mouselemur_91um")
repr(atlas)
```
Output:
```
'nadkarni mri atlas (res. mouselemur)'
```
The output should reflect the full name and resolution, but if there are more or less than 3 underscores the representation is incorrect.

**What does this PR do?**
Bug fix `repr` method in `bg_atlas`

## References
#517 #514

## How has this PR been tested?
I've suggested adjusting `test_repr` in #517 which should cover correct processing of several different possible atlas names.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9362d2d88981`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.