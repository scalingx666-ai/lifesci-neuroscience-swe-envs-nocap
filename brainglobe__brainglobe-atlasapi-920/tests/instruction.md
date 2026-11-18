# Issue

**Title:** reorient asymetric hemispheres during packaging

## Description

## Description
We now reorient asymetric hemisphere masks during atlas packaging. 

- [x] Bug fix

**Why is this PR needed?**

Previously asymmetric hemisphere masks were not being reoriented. 

## References

 

## How has this PR been tested?

I packaged the duke mouse atlas and validated the hemispheres were now in the correct orientation. 



## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02c39dc5548e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.