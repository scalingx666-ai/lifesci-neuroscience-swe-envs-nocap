# Issue

**Title:** refactor: convert utilities/kernel to ts

## Description

## Description
- Converted utilities/kernel to typescript
- Updated estimator/mean-squared-error because of this change
- ESLint doesn't like non-null-assertion-operator `!` but due to the way it has been set up, I couldn't avoid it. (ESLint does throw a warning though)

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->


## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [x] ¯\\\_(ツ)_/¯

## Author's Checklist:
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [x] My code focuses on the main motivation and avoids scope creep.
- [x] My code passes current tests and adds new tests where possible.
- [ ] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
- [ ] I have updated the documentation as needed.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c2faa1aac1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.