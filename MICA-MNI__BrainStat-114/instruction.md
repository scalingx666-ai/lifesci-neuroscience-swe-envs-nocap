# Issue

**Title:** [FIX] Temporary fix for removal of black stable

## Description

The stable branch has gone missing for black - the black team is working on it (see ).

This PR provides a temporary workaround.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7144507224ac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.