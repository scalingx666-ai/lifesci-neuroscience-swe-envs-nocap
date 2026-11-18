# Issue

**Title:** [GIT] Automatic MATLAB Packaging

## Description

This PR builds MATLAB toolbox packaging into the `tagged_release` workflow. This will allow us to sync our Github to Mathworks' file exchange and allow users to be notified, inside their MATLAB, when we release a new version.

As with all release workflows, I can't truly bug-test this until it's merged into master. So once this is merged I'll have to do some testing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c1739647221`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.