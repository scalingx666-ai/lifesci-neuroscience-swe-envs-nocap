# Issue

**Title:** ENH: Allow multichannel input

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [x] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? -->
This PR adds support for multichannel input in `get_dataset` and all necessary supporting functions. It also adds support for remote storage using `fsspec`.

I wrote this mainly for my own use but I think it might be more broadly useful upstream as well, provided we can align it with the vision of the main nobrainer devs.

## Checklist
<!--- Please, let us know if you need help-->
- [x] I have added tests to cover my changes
- [ ] I have updated documentation (if necessary)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31037a4cee53`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.