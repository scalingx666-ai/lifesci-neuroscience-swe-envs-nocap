# Issue

**Title:** Small changes to support long, preemptable training runs

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [x] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? -->
- Add a `last_epoch` member var to the checkpoint tracker so we can track how many epochs have been run so far on warm start
- Allow passing through tf options when reading tf records. This is useful, for example, set set the sharding policy

## Checklist
<!--- Please, let us know if you need help-->
- [ ] I have added tests to cover my changes
- [ ] I have updated documentation (if necessary)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f926fba3030b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.