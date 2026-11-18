# Issue

**Title:** chore: Upgrade/switch back to ubuntu-latest for github CI and use generalized neurodebian-ci-setup script (over https now)

## Description

now that we should have neurodebian usable for it again, and have recent git-annex standalone

[skip appveyor]

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74da3a008f5e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.