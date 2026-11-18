# Issue

**Title:** add dockerfile with all dependencies, including jupyter

## Description

This dockerfile inherits from an official tensorflow image, which is quite large. Though it is large, using the official image makes deployment much easier, because we are sure tensorflow has been installed in the right way and many of the layers already exist on dockerhub.

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [x] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? -->

Adds a dockerfile for use on dockerhub

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad708eeb3064`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.