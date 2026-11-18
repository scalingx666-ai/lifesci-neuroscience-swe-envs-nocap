# Issue

**Title:** [FIX] Stop CorrelationDecoder.transform from deep-copying the fitted decoder

## Description

No issue filed; found while decoding a map against Neurosynth v7.

`CorrelationDecoder.transform` built its new `MetaResult` with `MetaResult.copy()`, which deep-copies the estimator. A fitted `CorrelationDecoder` holds its input studyset, the cached study-by-voxel MA matrix (`_precomputed_ma_maps_`) and the meta-estimator's last `dataset1`/`dataset2`, so every `transform` duplicated all of it. On Neurosynth v7 (14,371 studies, 6 terms), `fit` peaks at about 10.2 GB and `transform` on the same object was then OOM-killed under an 11 GB limit.

Changes proposed in this pull request:

- Build the new result with the existing `_shell()` helper, sharing the fitted estimator and maps and copying only the tables dict. A previously returned `results_` is still left unmodified.
- Same change in `CorrelationDistributionDecoder.transform`.
- Add tests that `transform` shares the estimator and maps, adds its table, and leaves the old result unchanged, for both decoders.

With this change, `transform` on the same Neurosynth decoder adds about 1 MB and returns the expected ranking.

Not in this PR: `fit` itself still peaks around 10 GB, partly because `MetaResult.__init__` deep-copies the decoder, cache included. Releasing `_precomputed_ma_maps_` and the meta-estimator's datasets at the end of `fit` would reduce that; it could be a separate PR if wanted.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Avoid deep-copying fitted decoder state during continuous decoder transformations to reduce memory usage.

Bug Fixes:
- Prevent decoder transformations from duplicating fitted estimators and cached maps, avoiding excessive memory use and out-of-memory failures.

Enhancements:
- Preserve previously returned results while sharing fitted decoder state across transformed results for both continuous decoders.

Tests:
- Add coverage verifying transformed results share fitted state and maps while leaving the original fitted results unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `171d769a2de5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.