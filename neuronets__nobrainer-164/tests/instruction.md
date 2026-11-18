# Issue

**Title:** Correction of G_dice and multi_class dice_calculation

## Description

Correction to g_dice and addition of multiscale dice

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? -->
Correction of G_dice (no more penality with respect to classes not present in a batch/sample) and addition of multi_scale dice loss

## Checklist
<!--- Please, let us know if you need help-->
- [] I have added tests to cover my changes
- [ ] I have updated documentation (if necessary)

## Acknowledgment
- [ x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b789303c6854`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.