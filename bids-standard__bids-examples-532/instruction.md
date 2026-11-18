# Issue

**Title:** check contents of schema being built in actions

## Description

This really should be failing, adding upload artifact check. Will try debugging tomorrow with Tmate.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3803cf74b45e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.