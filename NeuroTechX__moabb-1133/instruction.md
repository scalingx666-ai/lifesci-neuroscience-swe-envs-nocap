# Issue

**Title:** Add a score on the lowest performing subjects

## Description

This adds `moabb.analysis.meta_analysis.compute_lowest_subject_scores`, the metric requested in #733.

The helper now requires an explicit `reference_pipeline`. For each dataset it macro-averages the supplied session scores per subject, selects the lowest `percentile` cohort once from that reference pipeline, and evaluates every pipeline on those exact same subject identities. It returns one row per observed `(dataset, pipeline)` with the resulting `score` and common `n_subjects`.

Using a shared reference cohort is the scientifically important part: selecting the worst subjects independently for each pipeline can compare different populations and even reverse a conclusion. The fixed-reference construction follows the hardest-subject comparison described by Gnassounou, Collas, Flamary, and Gramfort in *PSDNorm: Test-Time Temporal Normalization for Deep Learning in Sleep Staging* (arXiv:2503.04582). This helper operates on supplied scores; it does not recompute subject-level F1 from predictions.

The retained count is `ceil(n_subjects * percentile / 100)` and never below one. Score ties use stable input order, so heterogeneous subject identifiers do not need to be compared. Every pipeline must have exactly the reference subject set in each dataset. Empty input, raw NaN/infinity, null cohort identifiers, incomplete subject coverage, a missing reference, and percentiles outside `(0, 100]` fail closed. Filtered categorical frames use observed levels only, and coercible numeric score arrays are handled on a copy without mutating the caller.

Coverage includes the conclusion-reversal counterexample, per-dataset reference selection, session macro-aggregation, counts and 100% identity, categorical/null/nonfinite/object inputs, mixed subject-ID types, coverage mismatches, and caller non-mutation. Focused tests pass at 23 cases; the shared analysis/plotting consumers pass at 163 tests with 2 skips. The five remaining full-module CodeCarbon setup errors reproduce unchanged on the exact integrated baseline.

The function is listed in the Statistics API section and the existing benchmark output is unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd0543b1eab9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.