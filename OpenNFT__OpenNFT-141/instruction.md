# Issue

**Title:** GUI and requirements fix

## Description

Changes:

1. GUI minimum size changed (problem was in autoRTQA parameters layer -> their positions changed)
2. Special requirements for openCV packages for Ubuntu (and few missing packages added)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef2efdee9298`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.