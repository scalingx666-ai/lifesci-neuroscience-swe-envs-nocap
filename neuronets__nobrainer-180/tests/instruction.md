# Issue

**Title:** Added Clipping constraint and KLD loss with CD

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [x] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? --> 
This code improves the concrete dropout code by adding the KL loss approximation and also adds a clipping constraint for the value of p, so that it doesn't fall to 0. 

## Checklist
<!--- Please, let us know if you need help-->
- [x] I have added tests to cover my changes
- [x] I have updated documentation (if necessary)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e97c4c2c0dd0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.