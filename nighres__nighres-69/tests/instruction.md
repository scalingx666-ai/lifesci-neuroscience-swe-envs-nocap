# Issue

**Title:** Fix/deploy

## Description

The urllib3[secure] import fixes the issue of travis not deploying to pypi. Additionally, this PR updates the installation instructions in the readme and docs. It also updates the version so that a new tag can be created and deployed to PyPI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a471a2d6793`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.