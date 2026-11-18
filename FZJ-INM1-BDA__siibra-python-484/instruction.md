# Issue

**Title:** use 'channel' kwarg to get a neuroglancer color channel

## Description

Usage: when fetching a ng volume with several color channels, instead of fetching the first, this PR allows fetching the desired one via `fetch(channel=2)`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98eadc2f16d4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.