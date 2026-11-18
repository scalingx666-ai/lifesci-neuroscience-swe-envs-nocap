# Issue

**Title:** Enhance security of actions

## Description

This is a mini PR to increase security of github actions. When using third party actions, using a tag such as `v3` is not good practice, as an attacker to redirect this tag to a potentially malicious commit. Instead, using a SHA of that particular tag is better, since it will link to one particular well-defined commit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `471bf0f1b04e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.