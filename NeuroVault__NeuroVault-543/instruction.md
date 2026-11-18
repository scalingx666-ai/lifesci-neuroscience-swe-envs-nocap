# Issue

**Title:** Fix cognitive atlas properties update

## Description

This fixes the `"Invalid hyperlink - No URL match"` error when updating Cognitive Paradigm or Cognitive Atlas Contrast properties of statistical maps via API.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e80f01530758`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.