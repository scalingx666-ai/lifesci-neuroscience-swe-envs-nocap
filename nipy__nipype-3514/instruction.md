# Issue

**Title:** CI: Allow tutorial test cancellation

## Description

Currently, after the tutorial workflow is dispatched, it runs to completion, regardless of our workflow ending early. This adds a step to cancel the workflow upon failure or cancellation, to avoid overbearing the external runners.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1025526391d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.