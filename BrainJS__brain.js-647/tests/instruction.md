# Issue

**Title:** Update es5 require to es6 import on src folder

## Description

Basically, to keep an harmonized codebase I switched `require` calls to `import` from ES6 instead

## Description
This code doesn't fix anything other than keeping codebase equal.

## Motivation and Context
- It doesn't solve any issue but keep things organized

## How Has This Been Tested?
- First of all `npm run lint` to remove some warnings and second `npm run build` to guarantee it is not adding any issues

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [x] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)

## Author's Checklist:
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [x] My code focuses on the main motivation and avoids scope creep.
- [ ] My code passes current tests and adds new tests where possible.
- [ ] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
- [ ] I have updated the documentation as needed.

## Reviewer's Checklist:
- [x] I kept my comments to the author positive, specific, and productive.
- [x] I tested the code and didn't find any new problems.
- [x] I think the motivation is good for the project.
- [x] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08855fc1ec91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.