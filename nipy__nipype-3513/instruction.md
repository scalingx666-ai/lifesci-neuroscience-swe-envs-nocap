# Issue

**Title:** CI: Set up build-test-deploy workflow on GHA

## Description

While futzing with the CI in the release branch, I realized we're currently doing things I no longer would recommend.

This moves us to a build-test-deploy workflow. The tests are broken into full tests across the supported Python range from the repository and an install-package-and-pytest test that will be more typical of downstream users or OS packagers. Finally, we upload if all tests pass.

I created an environment that allows us to manually review releases before pushing the package to PyPI, as this is the nibabel workflow, but given that we haven't been doing that so far I'm happy to revert to the "go on green" approach.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e5be0083d9f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.