# Issue

**Title:** GitHub Actions: node: [16.x, 18.x, 20.x]

## Description

Let's try to get brain.js tests **passing** on current versions of Node.js.  https://github.com/nodejs/release#readme
* Had to disable macOS on Node.js v20 -- TODO: Fix this _after_ this pull request lands.
* Had to install `libxi-dev` and friends on Ubuntu -- https://github.com/BrainJS/brain.js#installation-note
* Had to `rm package-lock.json` because it was using an out-of-date version of `node-gyp`
* Had to disable nine test files to get the tests to pass -- TODO: Fix this _after_ this pull request lands.
    * Related to  ?
* Had to fix up `npm clean` for Windows, etc. 

https://github.com/BrainJS/brain.js/blob/226819334d9ce32c1bd16414ce7235b807facafb/package-lock.json#L11483-L11484 vs. **v9.4.0** at https://github.com/nodejs/node-gyp/releases

<!--- Provide a general summary of your changes in the Title above -->

<!-- If you don't mind add a fun gif or meme, but no pressure -->
![A GIF or MEME to give some spice of the internet](url)

## Description
<!--- Describe your changes in detail -->

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
- [ ] I have updated the documentation as needed.

## Reviewer's Checklist:
- [ ] I kept my comments to the author positive, specific, and productive.
- [ ] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfy the motivation.

@robertleeplummerjr Your review, please.
@kul-sudo FYI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `226819334d9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.