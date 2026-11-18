# Issue

**Title:** Nobrainer book guide examples run on AWS EC2 as a form of regression testing

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [x] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? -->
Adds a github action workflow to:
- spin up an ec2 instance with a couple GPUs attached
- run all guide notebooks (actually their linked python scripts) from the `nobrainer-book` repo
- spin down the ec2 instance

## Checklist
<!--- Please, let us know if you need help-->
- [ ] I have added tests to cover my changes
- [ ] I have updated documentation (if necessary)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b9bf99555d7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.