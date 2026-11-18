# Issue

**Title:** fix: Ensure property is own when iterating over nodes object

## Description

This ensures when iterating over `nodes` within `fromJSON()` with `for..in` that it will only iterate over properties the object owns and not other unintended properties on the prototype.

![A GIF or MEME to give some spice of the internet](https://media.giphy.com/media/3oEdvdHf6n0US87Tri/giphy.gif)

## Motivation and Context
By default, Ember.js extends all kinds of native prototypes. So when using `fromJSON()` within a default Ember app, it tries to iterate over the prototype properties Ember adds. Such as `_super`.

Without this change, Ember apps get the error `Uncaught TypeError: Cannot read property 'bias' of undefined` because eventually it hits the Ember prototype property: `this.biases[i][j] = layer['_super'].bias;` which doesn't have the `bias` property.

## How Has This Been Tested?
I modified the `node_modules/` in my app.

## Screenshots (if appropriate):
<img width="807" alt="screen shot 2019-01-22 at 5 40 25 pm" src="https://user-images.githubusercontent.com/99604/51576940-e80d5580-1e6c-11e9-961a-f2b00393be72.png">

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [x] Bug fix (non-breaking change which fixes an issue)
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1939421c02d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.