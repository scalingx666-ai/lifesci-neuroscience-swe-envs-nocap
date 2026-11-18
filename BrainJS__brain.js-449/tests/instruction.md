# Issue

**Title:** Fixes SVG generation

## Description

<!--- Provide a general summary of your changes in the Title above -->
brain.utilities.toSVG fails to generate SVG

## Description
If all else fails try sizes to get the vector for sizes.

## Motivation and Context
I wanted to see an SVG of my networks.


## How Has This Been Tested?
I ran it with all types of networks and it works.

## Screenshots (if appropriate):
<img width="734" alt="Screen Shot 2019-09-16 at 1 04 44 AM" src="https://user-images.githubusercontent.com/20133884/64935232-08d05400-d81e-11e9-8a02-61a79a8848ff.png">

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
- [] I kept my comments to the author positive, specific, and productive.
- [] I tested the code and didn't find any new problems.
- [ ] I think the motivation is good for the project.
- [ ] I think the code works to satisfies the motivation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48ef1d2621c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.