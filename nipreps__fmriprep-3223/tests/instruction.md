# Issue

**Title:** FIX: delete summary from functional report when separated by sessions

## Description

To avoid repeating the same summary many times when the reports are separated by sessions, remove the summary from the functional report template.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9ff1cbf0c89`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.