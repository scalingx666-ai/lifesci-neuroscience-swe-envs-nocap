# Issue

**Title:** Remove maximum version restriction for nilearn

## Description

Closes none. To make the initial change, I did the following:

1. Remove the maximum version for nilearn from `pyproject.toml`.
2. Run `uv lock --upgrade` to update the lock file. Fortunately, it only updated nilearn.

@effigies does that process make sense?

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Remove upper limit on nilearn version from pyproject.toml.
- Update tested nilearn version from 0.11.1 to 0.12.1 and mapca from 0.0.5 to 0.0.6.
- Address resulting bugs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efdfaa89f2c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.