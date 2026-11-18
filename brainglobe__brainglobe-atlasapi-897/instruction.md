# Issue

**Title:** Fix centre calculation for atlas validation

## Description

Change calculation of centre to work with both even and odd width volumes.
 


## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Atlas symmetry check fails for volumes with an even width. 

## How has this PR been tested?

I packaged the Allen human atlas which was previously failing validation. It now passes.
This has also been tested on several other even width atlases as well as one odd width (australian mouse).

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No 

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `858a15e66ec3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.