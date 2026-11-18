# Issue

**Title:** Enh/notebooks

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [X] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
This updates every notebook in the guide:
- to be standalone and be executable without executing others. 
- It removes the TPU notebook as that needs work on perhaps the nobrainer side as well as the notebook side. 
- adds inference to almost every notebook together with some brain displays
- updates the transfer learning notebook to use nobrainer-models via datalad

## Acknowledgment
- [X] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d9820b76299`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.