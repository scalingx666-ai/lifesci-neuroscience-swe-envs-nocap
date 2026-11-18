# Issue

**Title:** [FIX] ASR: apply online recency weights on the euclid path (weighted geometric median)

## Description

Two coupled fixes to the online covariance weighting in `ASR.transform()`:

- **The euclid path discarded its recency weights.** `transform()` builds an exponential recency weight vector and passes it to `asr_process(sample_weight=...)`, but on the default `method="euclid"` path `asr_process` called `geometric_median()` with no weights (and the function had no weight parameter), so the weights were computed and silently dropped — only the riemann branch ever used them. Generalize `geometric_median()` to an optional `sample_weight` using the weighted Vardi-Zhang iteration; with `sample_weight=None` (or all ones) it reduces exactly to the previous unweighted algorithm, so `asr_calibrate` (which calls it unweighted) is numerically unchanged. Pass `sample_weight` through the euclid branch of `asr_process`.
- **The recency weight vector used prefix sums instead of suffix sums.** A block's recency is the number of more-recent samples that follow it, i.e. the suffix sum of the per-block sample counts; the previous prefix-sum index mis-weighted interior blocks whenever chunk sizes differed. Add a `_recency_weights` helper that accumulates the suffix sample count newest→oldest.

### Testing
Adds regression tests for the weighted median (uniform == unweighted), the euclid wiring, and the suffix-sum weights. Full `tests/test_asr.py` passes; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e5309113677`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.