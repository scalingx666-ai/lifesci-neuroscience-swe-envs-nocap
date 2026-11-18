# Issue

**Title:** ENH: support channels first for vector images

## Description

We need a good way to specify whether to put the channels first or last when converting a vector image to numpy. This is a basic step in that direction by adding the `channels_first` property to ants images. It defaults to False, which is the current behavior of putting the channels last.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de706a8c9653`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.