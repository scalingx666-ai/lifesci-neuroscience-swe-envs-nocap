# Issue

**Title:** Composable Data Augmentations

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [x] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? -->
The goal of this PR is to enable sequence of on-the-fly augmentation by giving multiple transforms as list for argument 'augment' . This is open to suggestions and modifications to make it better and robust for different transform functionalities available in spatial_transform, intensity_transform and volume. 
## Checklist
<!--- Please, let us know if you need help-->
- [x] I have added tests to cover my changes
- [x] I have updated documentation (if necessary)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `780c249ed9bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.