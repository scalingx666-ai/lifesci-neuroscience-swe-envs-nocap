# Issue

**Title:** Fix hemisphere bug in `check_orientation`

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

`check_orientation` gave false information when working with hemispheres

**What does this PR do?**

Ensures `check_orientation` info is displayed correctly when working with hemispheres, and adds a test for this too (the test(s) could be more exhaustive, but hopefully sufficient in their current state, given `brainreg` development beyond maintenance not on our roadmap at the moment)

## References



## How has this PR been tested?

* manual inspection by @IgorTatarnikov and I
* new test added
* I have locally checked that the new test failed before I made the bugfix commit

## Is this a breaking change?

No (apart from fixing faulty behaviour).

## Does this PR require an update to the documentation?

Maybe we should specify better the point of view of the check_orientation, and understand that better in the first place - to be tackled in 

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ \ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `517d578a0c38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.