# Issue

**Title:** Refactor utilities/cast to Typescript

## Description

<!--- Provide a general summary of your changes in the Title above -->

Update the `utilities/cast.js` file to use typescript -> `utilities/cast.ts`

## Description
<!--- Describe your changes in detail -->

The change does the following:

- Convert `module.exports` to an `export` on each function
- Adds type annotations to functions and 

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![A GIF or MEME to give some spice of the internet](url)

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->


Partially addresses #551 

## How Has This Been Tested?
<!--- Please describe in detail how you tested your changes. -->
<!--- Include details of your testing environment, tests ran to see how -->
<!--- your change affects other areas of the code, etc. -->

Only additions of type annotations to existing code, issue with tests was prevalent before making changes

Typescript check is fine without any issues

## Screenshots (if appropriate):

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [x] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)

## Author's Checklist:
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [x] My code focuses on the main motivation and avoids scope creep.
- [ ] My code passes current tests and adds new tests where possible.
- [ ] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
- [ ] I have updated the documentation as needed.

All existing logic has been retained, just the type annotations added

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c2faa1aac1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.