# Issue

**Title:** Fix #246: Transforms now return labels if passed

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [x] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? -->
Fixes the spatial and intensity transforms to return labels alongside transformed features, even if the labels aren't transformed.



## Checklist
<!--- Please, let us know if you need help-->
- [x] I have added tests to cover my changes
- [ ] I have updated documentation (if necessary)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32ee388cd668`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.