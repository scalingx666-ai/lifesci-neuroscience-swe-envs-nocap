# Issue

**Title:** ADD: `nobrainer.dataset` namespace

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [x] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? -->
Adds `nobrainer.dataset` namespace that includes methods for creating `tf.data.Dataset` objects. The methods in `nobrainer.volume` are for dealing with volumetric data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `305d804684d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.