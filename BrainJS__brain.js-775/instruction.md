# Issue

**Title:** fix: Remove to barebones importable

## Description

Move stream work out of brain.js

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![A GIF or MEME to give some spice of the internet](https://media4.giphy.com/media/l0MYAY18Pxyxwu2xa/giphy.gif)

## Description

This lightens the export to use standard commonjs module, which is needed by GPU.js.
This should fix:
* #752 - Tested
* #757 - Tested
* #669 - Not fully tested, but should work

Import like `import * from 'brain.js'` or `import { NeuralNetwork } from 'brain.js'`

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->


## How Has This Been Tested?
<!--- Please describe in detail how you tested your changes. -->
<!--- Include details of your testing environment, tests ran to see how -->
<!--- your change affects other areas of the code, etc. -->

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b763d4dd935`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.