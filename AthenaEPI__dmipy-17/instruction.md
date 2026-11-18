# Issue

**Title:** Dhollander RF estimation

## Description

Includes:
- Introduction of tissue_response_models.
- Dhollander16 three tissue response estimation
- Includes classic Tournier07 wm-tissue response estimation based on FA.

Will not include / for next pull request:
- Allowing models to have non-unity S0 response during fitting.
- Tournier12 wm-tissue response estimation

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f635d70d08fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.