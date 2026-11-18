# Issue

**Title:** Nudge to v3.2.2

## Description

This nudge will importantly shift ngc-learn support/basis on JAX >=0.11.1 and Python >3.12 (for cuda12 as currently tested)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `187f12721c73`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.