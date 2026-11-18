# Issue

**Title:** Sessions fix

## Description

Fmridenoise works for datasets without sessions.
base workflows rewritten as a class that allows inheritance.
minor changes in almost all interfaces:
- more precise traits specification
- fixed cases where session variable is undefined
- minor fixes in output paths

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6a1a01b0dcc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.