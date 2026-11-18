# Issue

**Title:** Optimize max pool

## Description

Optimize the max pool and compare and fix tests
Also: Fix some spelling and linting and some type issues


## Description
Optimize the bounds of the pool operation, in particular the compare step. Also some issues with types were fixed and minor cleanup.

## How Has This Been Tested?
Tests for the pool have been updated and fixed

## Types of changes
- [x] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)

## Author's Checklist:
- [x] My code focuses on the main motivation and avoids scope creep.
- [x] My code passes current tests and adds new tests where possible.
- [x] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
- [x] I have updated the documentation as needed.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `812b27dd00f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.