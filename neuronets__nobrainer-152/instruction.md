# Issue

**Title:** enh: change standardize in dataset creation to a callable

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [X] New feature (non-breaking change which adds functionality)
- [X] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
changes standardize from a bool to a callable called normalizer. this allows different kinds of standardization to be done.

## Checklist
<!--- Please, let us know if you need help-->
- [ ] I have added tests to cover my changes
- [ ] I have updated documentation (if necessary)

## Acknowledgment
- [X] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42620da877b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.