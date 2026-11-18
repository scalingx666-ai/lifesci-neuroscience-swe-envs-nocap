# Issue

**Title:** fix: Fix unit tests

## Description

## Description
Fix a few things related to the unit tests (and even some) that always were failing beforehand:
* Bad typescript config - was not letting us run the unit tests on Node versions older than 14.x
* Changed modifier validation
* Fixing assertion for the following tests:
  * `uses compare2D when width > 1`
  * `converts Textures to Arrays of numbers`

## Motivation and Context
We have unit tests to check the code but currently, we have a few unit tests that are failing, fixing the problematic tests will allow us to have more trust in our unit tests

## How Has This Been Tested?
Run:
```bash
npm test
```

## Types of changes
- [X] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)

## Author's Checklist:
- [X] My code focuses on the main motivation and avoids scope creep.
- [X] My code passes current tests and adds new tests where possible.
- [X] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
- [X] I have updated the documentation as needed.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afe99e7db17a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.