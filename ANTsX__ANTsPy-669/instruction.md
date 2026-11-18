# Issue

**Title:** ENH: crop vector images

## Description

This PR supports cropping vector images and does some small clean up / expansion of support for the "channels_first" property of vector images which is relevant for converting to numpy.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `342603f96744`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.