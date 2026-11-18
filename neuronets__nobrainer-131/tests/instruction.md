# Issue

**Title:** move CI to github actions

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [x] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [x] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
Remove Travis CI test and add github actions workflow to test the package. 

## Checklist
<!--- Please, let us know if you need help-->
- [x] All tests passing
- [ ] I have added tests to cover my changes
- [ ] I have updated documentation (if necessary)
- [ ] My code follows the code style of this project
(we are using `black`: you can `pip install pre-commit`,
run `pre-commit install` in the `pydra` directory
and `black` will be run automatically with each commit)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be89dd2e6059`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.