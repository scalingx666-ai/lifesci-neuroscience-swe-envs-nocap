# Issue

**Title:** Move to chaste/base image for devcontainer

## Description

When GitHub creates a new codespace, there is an intermediate (undocumented) provisioning step, with less space available than the resulting codespace machine.

As a result, using the larger pre-built image doesn't allow users to create a default Chaste codespace.

This PR changes the default to chaste/base which allows creation of codespaces.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fd4e48e3990`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.