# Issue

**Title:** update missing python3 shebangs.

## Description

A couple of files were still shipping with a plain python shebang.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `56e3b06beb4d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.