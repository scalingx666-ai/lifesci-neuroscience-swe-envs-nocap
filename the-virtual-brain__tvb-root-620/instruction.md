# Issue

**Title:** TVB-3041: Fix equations not showing in PhasePlane page

## Description

- Fix equation not being visible in "Simulator: Phase plane" page;
- Improve tooltip model details by parsing docstrings rst to html.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `36acbce84704`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.