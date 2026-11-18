# Issue

**Title:** Add a general-purpose autoencoder class `AE` to serve as a building block for other autoencoder models

## Description

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![image](https://media1.tenor.com/m/TmkZTzP5NY0AAAAC/ponyo.gif)

## Description
<!--- Describe your changes in detail -->
Oh. My. Freaking. Goodness! There's somewhat of a "story" behind this, but here's your TL;DR:

*  which had a muddled commit history, as it originates from [my older GitHub account](https://github.com/ashejuniper/auto-encoder). This attempt was futile, because it was a complicated implementation written outside of the brain.js codebase.
* I decided that not only would it be more time efficient to reimplement autoencoders from scratch directly within the brain.js library, but it would also improve readability as well as compatibility. 
* I made sure to add .
* I made sure to replace the temporary  method that I added to `auto-encoder.ts` with  to support multi-dimensional input arrays.
*  (there is no space or hyphen in the word "autoencoder").
* ; feel free to revoke this change if you'd prefer the more-descriptive, yet more-verbose, `Autoencoder` over `AE`
* 

## Motivation and Context
<!--- Why is this change required? What problem does it solve? -->
<!--- If it fixes an open issue, please link to the issue here. -->
<!---  -->
I've been using my own home-rolled autoencoders that utilize brain.js for awhile now, so I wanted to share it with the community that made it possible to begin with :sparkling_heart: 

## How Has This Been Tested?
<!--- Please describe in detail how you tested your changes. -->
<!--- Include details of your testing environment, tests ran to see how -->
<!--- your change affects other areas of the code, etc. -->

I  to test the basic functionality of the class. Further tests should be added in the future, which I'll be glad to contribute to :blush: 

To run the tests, I rebuilt and ran the test script by running the following command:

```sh
npm rebuild && npm run build && npm test
```


## Screenshots (if appropriate):
![image](https://github.com/BrainJS/brain.js/assets/160202125/ec2257ae-7008-4964-8df3-15ec9211867e)


## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [x] New feature (non-breaking change which adds functionality)
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7b4b03c5a53`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.