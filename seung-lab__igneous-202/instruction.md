# Issue

**Title:** feat(clahe): Add Contrast Limited Adaptive Histogram Equalization

## Description

Adds support for CLAHETask with CLI support.

New dependency: opencv-python

opencv-python is a little heavy, maybe it should be optional?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `408c7c1257d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.