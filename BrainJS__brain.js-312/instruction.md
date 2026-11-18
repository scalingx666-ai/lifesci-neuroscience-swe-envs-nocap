# Issue

**Title:** fix: toJSON & toFunction for NeuralNetworkGPU class

## Description

and adds tests

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![A GIF or MEME to give some spice of the internet](https://media3.giphy.com/media/DPJ44qfWqUnKw/giphy.gif)

## Description
I woke up in a haze on Sunday morning to this issue, and at first sight thought "oh yea, that was not completed", and then with nearly this exact expression:

![](https://media1.giphy.com/media/Hz6WKZkKkLOE0/giphy.gif)

I believed I could resolve it fairly easily.  AND because this issue is the backbone of `.toFunction()` is resolved that issue as well.  I tested in both cpu mode for gpu.js and gpu mode.

Great job in finding, suggesting, and motivating.

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->


## How Has This Been Tested?
Direct unit tests.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4358b04c265a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.