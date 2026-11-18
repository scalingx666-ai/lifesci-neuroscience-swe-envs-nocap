# Issue

**Title:** TVB-3134. GitHub action for releasing tvb packages on Pypi.

## Description

This GitHub action is intended to be triggered manually from within the Actions tab. The packages we want to release for a version can be selected by checkboxes at start-time. In the final steps, the current version is read from the package name and a tag is created for that version.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `148b977e0402`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.