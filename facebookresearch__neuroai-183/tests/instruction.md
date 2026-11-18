# Issue

**Title:** Fix RegressionBinSampler edge binning to match BinnedMAE

## Description

## What

`RegressionBinSampler` binned targets with `torch.bucketize(..., right=False)` (`(lo, hi]`), but the `BinnedMAE` metric it is meant to mirror bins with `right=True` (`[lo, hi)`). So a target landing exactly on an inner edge was stratified one bin **too low** — disagreeing with the metric and with the sampler's own docstring (`"matches the bin semantics of BinnedMAE"`).

## Repro

| target | sampler (before) | BinnedMAE |
|--------|------------------|-----------|
| 40.0   | `[0,40)`         | `[40,90)` |
| 90.0   | `[40,90)`        | `[90,300)`|
| 300.0  | `[90,300)`       | `[300,600]`|

## Fix

- Add `_assign_bins()` (`right=True`, no redundant clamp) as the single source of truth for the sampler's bin assignment.
- Route both sampler sites (inverse-frequency weights **and** the logged per-bin histogram) through it, so they can't drift from each other or from the metric.
- `BinnedMAE` is unchanged.

## Impact

Training-side only — reported `BinnedMAE` numbers are unaffected. Under the shipped `sleep_onset` config (`stride=5`, edges all multiples of 5), every recording lands one segment on each inner edge: ~1.25% of segments, but because the top bin is dominated by the 600 s cap pile, the 90 s / 300 s targets are up-sampled ~4.2–4.3× relative to the intended stratification.

## Tests

- `test_compute_regression_bin_weights_inner_edge_goes_to_upper_bin` — targets on an edge now land in the upper bin.
- `test_sampler_bins_match_binnedmae_bins` — contract test asserting the sampler and `BinnedMAE` agree on every value including the exact edges (fails under the old `right=False`).

## Follow-up

`BinnedMAE.update` still duplicates this binning logic; unifying it onto `_assign_bins` is a worthwhile separate PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d85b7b5f3c8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.