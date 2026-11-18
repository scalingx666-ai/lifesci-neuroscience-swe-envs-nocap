# Issue

**Title:** BF: Add block_length param to dataset.interleave

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [x] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? -->
 
This PR adds a `block_length` param to the `dataset.interleave` method. `block_length` should be set to the `examples_per_shard` that were used to write the original TFRecords dataset. Without this, `get_data` inadvertently shuffles its input data.

## Checklist
<!--- Please, let us know if you need help-->
- [x] I have added tests to cover my changes
- [ ] I have updated documentation (if necessary)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0530f539a977`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.