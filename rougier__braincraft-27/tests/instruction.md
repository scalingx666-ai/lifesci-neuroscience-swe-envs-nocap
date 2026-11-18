# Issue

**Title:** Task 3: SPRT probe-commit player (~15.14 +- 0.13)

## Description

- Player file: `braincraft/env3_player_ensemble_sprt_commit.py`
- Assumed performance: `15.1440 +- 0.1308 (100s train, 10 eval runs, fixed seed)`
- Brief description: Probe-then-commit sparse ESN controller with endogenous evidence accumulation and deterministic commit.
- Constraint note: 1000 neurons, standard Task 3 interface and 100s training budget.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `290c9fd6d5ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.