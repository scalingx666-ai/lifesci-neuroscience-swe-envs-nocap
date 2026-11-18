# Issue

**Title:** Making trainingOption updater/getter less rigid

## Description

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![oil-man](https://user-images.githubusercontent.com/4624648/35590107-139d112c-05c3-11e8-8a57-838928b270f9.gif)

## Description
<!--- Describe your changes in detail -->
I removed a lot of the hardcoded handling in `_updateTrainingOptions`, and instead have it iterate over all the `trainingDefault` options and set them if they exist. I didn't want to use a spread operator, as this keeps it limited to the options we want passed. this isn't a big deal IMO, and it could make this very simple to implement if we don't care about extra options.

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->
This is in response to some comments not being submitted before #137 was merged

## How Has This Been Tested?
<!--- Please describe in detail how you tested your changes. -->
<!--- Include details of your testing environment, tests ran to see how -->
<!--- your change affects other areas of the code, etc. -->
`yarn test` - all passed

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
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bc87b8ef17c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.