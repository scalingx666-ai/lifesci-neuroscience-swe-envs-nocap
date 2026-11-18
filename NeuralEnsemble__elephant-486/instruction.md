# Issue

**Title:** ebrains Phase 3: Mirror Elephant to gitlab.ebrains.eu

## Description

This PR is a part of the integration of elephant in ebrains phase 3.
This step  sets up a repository mirrored to gitlab.ebrains.eu. (https://gitlab.ebrains.eu/neuralensemble/elephant/)

The added `ebrains.yml` will sync this repository with the repository at ebrains GitLab on a push to master.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ed3cb308978`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.