# Issue

**Title:** Fix #139 - Train data to textures

## Description

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![](https://media3.giphy.com/media/U0lQ7lOs3AtNu/giphy.gif)

## Description
This represents a bunch of work to both synchronize gpu.js to webgl 2 and faster training, and as well better practices of using textures directory for training, rather than the value sent in, then converted, then trained on, every time.

## Motivation and Context


## How Has This Been Tested?
The majority of this is tested in gpu.js.  How tests are currently written makes this ~~impossible~~ challenging to test on node.

## Screenshots (if appropriate):

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)

## Author's Checklist:
<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
- [ ] My code focuses on the main motivation and avoids scope creep.
- [ ] My code passes current tests and adds new tests where possible.
- [ ] My code is [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).
- [ ] I have updated the documentation as needed.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6900d93e28f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.