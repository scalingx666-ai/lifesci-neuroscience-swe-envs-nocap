# Issue

**Title:** Patch rc3

## Description

# Overview

Updated install to allow bcipy app functions to work outside of local development. Currently, many submodules do work as expected and can be used in other packages as a requirement. However, due to missing assets and inits others will fail to work. This PR addresses these small changes and adds greater clarity when using it as a standalone package outside of root.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `542b190e3d07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.