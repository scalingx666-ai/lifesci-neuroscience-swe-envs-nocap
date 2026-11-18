# Issue

**Title:** Task 1: ensemble v3 metric player (~14.00 +- 0.02)

## Description

- Player file: `braincraft/env1_player_ensemble_v3_metric.py`
- Assumed performance: `13.9990 +- 0.0202 (100s train, 10 eval runs, fixed seed)`
- Brief description: Sparse Ensemble-style controller with stabilized self-branch arbitration and reactive wall geometry.
- Constraint note: 1000 neurons, standard Task 1 interface and 100s training budget.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `290c9fd6d5ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.