# Issue

**Title:** fix: update dockerfiles to tensorflow 2.5.0

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [X] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
the latest nobrainer runs only in 3.7+ this updates the base docker image

## Checklist
<!--- Please, let us know if you need help-->
- [ ] All tests passing
- [ ] I have added tests to cover my changes
- [ ] I have updated documentation (if necessary)
- [ ] My code follows the code style of this project
(we are using `black`: you can `pip install pre-commit`,
run `pre-commit install` in the `pydra` directory
and `black` will be run automatically with each commit)

## Acknowledgment
- [X] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a17f91f8d5b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.