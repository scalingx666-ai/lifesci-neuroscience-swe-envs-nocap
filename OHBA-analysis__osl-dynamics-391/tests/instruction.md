# Issue

**Title:** Add diagonal covariance option for dual estimation + hmm_features

## Description

## Summary

This PR adds support for diagonal covariance matrices in the HMM dual estimation pipeline, matching the existing capability in the main HMM model (`config.diagonal_covariances`). This enables session-specific re-estimation of variance-only observation models, useful for parcellations or analyses where cross-channel covariance structure is not required or not identifiable.

## Key changes

- Extend `hmm_dual_estimation` (in `analysis/post_hoc.py`) with a new argument `diagonal_covariances=False`.
- Implement efficient diagonal-only covariance estimation (weighted per-channel variances).
- Ensure returned matrices remain full (`n_channels × n_channels`) with off-diagonals zeroed.
- Update `hmm_features` to:
  - pass through the new option,
  - extract diagonal terms when `diagonal_covariances=True`,
  - maintain consistency with optional partial correlation transforms.
- Update `Model.dual_estimation` to respect `config.diagonal_covariances`.
- Update and expand relevant docstrings.

## Motivation

Enable dual-estimation workflows where only state-specific variances are needed (e.g., amplitude/power-driven dynamics), consistent with the diagonal-covariance option already available during HMM training. This brings feature parity to post-hoc analysis functions.

## Notes

- Full-covariance behaviour is unchanged.
- The diagonal option is opt-in and affects only explicit uses.
- Tested on synthetic data to ensure off-diagonal entries remain zero and behaviour is correct.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b5eb009133f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.