# Issue

**Title:** FIX make adjusted chance thresholds independent of result row order

## Description

## Summary

`chance_by_chance` currently takes `n_classes` and `samples_test` from the first result row for each dataset. With custom CV folds or evaluation groups that have different test sizes, the reported adjusted chance threshold therefore depends on DataFrame row order.

This change makes the dataset-level statistical contract explicit and row-order invariant:

- every row must provide `n_classes` and `samples_test`;
- `n_classes` must be constant within a dataset;
- `samples_test` may vary across folds;
- for each requested alpha, the dataset-level adjusted threshold is the **maximum exact-binomial cutoff across the distinct fold sizes actually present**.

Taking the strictest observed-fold cutoff is important because the exact-binomial threshold is discrete and is **not strictly monotone** in `n_trials`. For example, with two classes at `alpha=0.05`, the adjusted threshold is `0.8` for 5 trials but `5/6 ≈ 0.8333` for 6 trials. Therefore simply choosing the smallest fold is not guaranteed to produce a conservative envelope.

The theoretical chance level remains `1 / n_classes`, and the adjusted result is unchanged for the existing common case where all rows of a dataset have the same test-sample count.

## Regression coverage

- varying fold sizes are aggregated with the strictest exact-binomial envelope;
- an explicit `n=5` vs. `n=6` regression locks the non-monotone discrete edge case;
- valid input is invariant to DataFrame row order;
- inconsistent class counts fail clearly;
- missing `n_classes` or `samples_test` metadata fails clearly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3381c7e79d16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.