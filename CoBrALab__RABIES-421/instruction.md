# Issue

**Title:** fix: pin traits < 7.0, change urls for mouse templates

## Description

`docker build` successful on a DNP workstation.

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->
## Summary by CodeRabbit

- **Chores**
  - Added a version constraint for the `traits` package (<7.0) in environment and dependency files.
  - Corrected indentation for a pip dependency in environment configurations.
  - Streamlined installation by directly downloading pre-converted NIfTI files, removing local conversion steps.
  - Introduced a new GitHub Actions workflow to automate Docker image builds for pull requests.
<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1764266c916b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.