# Issue

**Title:** refactor networkx usage to ensure backwards compatibility

## Description

This PR includes a minor refactor to ensure backwards compatibility with older versions (and hopefully, future releases) of networkx. This should address the  raised in [dyneusr-notebooks](https://github.com/braindynamicslab/dyneusr-notebooks).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `567a8510a8b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.