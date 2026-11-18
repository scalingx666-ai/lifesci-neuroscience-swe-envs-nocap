# Issue

**Title:** Options update

## Description

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![A GIF or MEME to give some spice of the internet](https://media1.tenor.com/images/85a5071f751d6b7cac5490e5d109836c/tenor.gif?itemid=4272648)

## Description
<!--- Describe your changes in detail -->
1) I updated the training options to be a property of the neural network.  You can now pass in any of the training options into the constructor and they will be recognized, set them to the network or pass them into the training and the property will get adjusted and trained appropriately.

2) I prepended underscores to neural network methods that are intended for private use

3) I did some general cleanup up with the new properties being on the class, and not passed into the methods.

4) I updated the tests to reflect changes. I also moved the logs test into their own file.

5) I included the training options in the saving of JSON so when the network is restored it's training options is restored as well.  If a log method is chosen it will restore to simply console.log.  The callback method is not restored.  This interaction is mentioned in the readme.

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->
 will be helped but I don't think this finishes it
finishes  for the neural-network class

The main focus is maintaining code.  This shouldn't change functionality other then extending it where logical.  It should help the library be simpler to implement as well as more robust and more maintainable in the future.

## How Has This Been Tested?
<!--- Please describe in detail how you tested your changes. -->
<!--- Include details of your testing environment, tests ran to see how -->
<!--- your change affects other areas of the code, etc. -->
I added tests to mirror the functional changes.  I added in a test for passing things into the constructors.  I added tests for the training objects JSONification.

## ~~Screenshots (if appropriate):~~

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] ~~Bug fix (non-breaking change which fixes an issue)~~
- [ ] ~~New feature (non-breaking change which adds functionality)~~
- [ ] ~~Breaking change (fix or feature that would cause existing functionality to not work as expected)~~
- [x] Maintenance and simplification

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69ff0bec59dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.