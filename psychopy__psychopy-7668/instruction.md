# Issue

**Title:** PKG: add uv exception to block libs newer than 7 days old

## Description

This is to prevent the current trend of supply-chain attacks where a lib with many dependencies is hacked and released, affecting all the downstream users

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4480f4f5d7a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.