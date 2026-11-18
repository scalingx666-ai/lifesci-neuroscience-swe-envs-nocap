# Issue

**Title:** Multi-GPU support

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [x] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
Resolve #241. For segmentation, this is merely to check that the batch size is a multiple of the number of GPUs. For generation, key parts of model creation and compilation are now included in the strategy scope. 

## Checklist
Tests and documentation will be in a separate PR in the nobrainer-book repo
- [ ] I have added tests to cover my changes
- [ ] I have updated documentation (if necessary)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e76aeb30f9de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.