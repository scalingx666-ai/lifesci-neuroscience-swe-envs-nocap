# Issue

**Title:** [GIT] Repair tagged release publication and add recovery

## Description

The v0.7.0 release built its Python archives and MATLAB toolbox, then the legacy automatic-release action crashed during changelog generation before creating the GitHub release or uploading to PyPI.

Use GitHub CLI publication with the existing workflow token and explicit release permissions. Generate release notes from the checked-out changelog and validate the tag against the package version. Add manual recovery for an existing tag, retaining its source commit, and allow retries after a partial publication. Read the MATLAB version from the validated package version instead of a single-digit regular expression.

Validation: workflow YAML parsed; all shell steps passed syntax validation; version matching and mismatch rejection were executed; mocked GitHub CLI creation and recovery paths verified the intended Python/MATLAB assets. Package sources are identical to the six-platform-job-tested v0.7.0 tag. The repaired workflow will be run against that tag after merge.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d898802f1ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.