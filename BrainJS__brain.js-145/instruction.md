# Issue

**Title:** Make training methods DRY

## Description

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![source](https://user-images.githubusercontent.com/4624648/35660151-ab3d5028-06c7-11e8-9fe3-741577d78cc8.gif)


## Description
<!--- Describe your changes in detail -->
Added a new function `_prepTraining` which will do the basic things for initializing a training run, as well as provide a function for a training tick. Both `train` and `trainAsync` will use this tick function, either wrapped in thaw.js and a promise for `trainAsync` or simply run in a `while` loop for `train`. 

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->
No issue, just making this a little more manageable.

## How Has This Been Tested?
<!--- Please describe in detail how you tested your changes. -->
<!--- Include details of your testing environment, tests ran to see how -->
<!--- your change affects other areas of the code, etc. -->
`yarn test` passed

## Screenshots (if appropriate):

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [x] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)

## Author's Checklist:
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [x] My code focuses on the main motivation and avoids scope creep.
- [x] My code passes current tests and adds new tests where possible.
- [x] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
- [x] I have updated the documentation as needed.

## Reviewer's Checklist:
- [x] I kept my comments to the author positive, specific, and productive.
- [x] I tested the code and didn't find any new problems.
- [x] I think the motivation is good for the project.
- [x] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7cb31e044a45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.