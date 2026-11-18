# Issue

**Title:** [FIX] Correct the Neurosynth decoder's uniformity test

## Description

## Summary

Closes the NaN / negative chi-squared report at
https://neurostars.org/t/negative-chi-square-values-in-neurosynth-decode-forward-inference/36387

`neurosynth_decode` called `one_way(n_selected_term, n_term)`. `one_way(data, n)` takes `n` to be the number of trials each count in `data` is drawn from, and every other caller passes a scalar — `MKDAChi2` passes `n_selected` (`nimare/meta/cbma/mkda.py:516`, `:648`), as does Neurosynth's own `MetaAnalysis`. Passing the per-label database count made the expected count `mean(n_selected_term)` exceed `n` for any label rarer than average, so `n - expected` went negative, the statistic went negative, and `chi2_to_nlogp` returned NaN out of `sqrt`.

Decoding a 12 mm sphere at `[-36, 18, 0]` against Neurosynth v7: **343 NaN labels of 3228**. With the default BH correction those NaNs then propagate through `nlogp_fdr`'s `minimum.accumulate` and erase **all 3228** corrected p-values.

The bug dates to `745b26cd` (2018), the commit that added the discrete decoders — the same commit that moved `one_way` out of `mkda.py` into `stats.py`, introducing the correct scalar usage and this incorrect vector usage side by side. It was invisible until #1099: `special.chdtrc(1, negative)` returns `1.0`, so a negative statistic used to become a silent p-value of 1 instead of a NaN.

## What the fix rests on

Four independent sources agree that `n` should be `n_selected`:

| Source | Forward statistic | `n` |
|---|---|---|
| `docs/decoding.rst` step 10 | mean count across labels | "the mean number of studies selected across labels" |
| tsalo, [NeuroStars 18148](https://neurostars.org/t/nimare-decoding-results/18148) | "the NeurosynthDecoder is just a reformulation of the MKDA Chi2 approach" | `MKDAChi2` passes `n_selected` |
| upstream `neurosynth` `MetaAnalysis` | `one_way(n_selected_active_voxels, n_selected)` | scalar |
| NiMARE `MKDAChi2` | `one_way(n_selected_active_voxels, n_selected)` | scalar |

`neurosynth_decode` was the only caller passing a vector. Note the docs already specified the correct algorithm; the code just never matched them.

## Changes

1. **`one_way(n_selected_term, n_selected)`.** Since every `n_selected_term <= n_selected`, the expected count cannot exceed `n`, so `n - expected` can no longer go negative. NaN goes 343 → 0, and 3228 → 0 after BH.

2. **`one_way` returns zero where it has no variance to measure.** Caught in review. The argument fix guarantees `n - expected >= 0`, not `> 0`. The expected count is the mean, so for counts bounded by `n` it hits 0 only when every count is 0 and hits `n` only when every count is `n` — both zero the `expected * (n - expected)` term. The numerator is zero in those cases too, so the statistic came back as 0/0 and every label decoded to NaN. Reachable from `neurosynth_decode` when no retained label appears in any selected study, or every retained label appears in all of them.

   The statistic is now zero there, which is what the arithmetic is reaching for: no cell deviates from uniformity, so there is nothing to report. This sits in `one_way` rather than in the caller because that is where the division is, and because `MKDAChi2` shares it — a meta-analysis in which no voxel is active in any selected study previously produced NaN maps.

3. **New `min_studies` parameter**, mirroring the argument of the same name on upstream's `MetaAnalysis`: an integer is a count of studies, a float in (0, 1) a proportion of the database. Yarkoni et al. (2011) excluded voxels active in fewer than 3% of studies "to stabilize results and ensure all cells had sufficient observations for the parametric Chi-Square test"; NiMARE had no equivalent floor.

   Two deliberate choices worth review:
   - **Default is 1**, matching upstream. It only drops labels appearing in no studies, which currently produce a silent divide-by-zero in `probForward`. No existing result changes unless a user opts in.
   - **Filters labels before the test, not after.** Upstream masks output images post hoc, but the uniformity test's expected count is the mean of `n_selected_term` across labels, so a sub-threshold label perturbs every *other* label's statistic, not just its own. On the reporter's ROI, 2644 of 3228 labels sit below the 3% floor and the expected count moves from 81.2 to 262.6 — a 3.2× shift in the number every retained label is compared against. Masking afterward would leave that contamination in place.

4. **Documents what the Forward columns are.** They are Neurosynth's uniformity test, a name Neurosynth adopted after concluding that "forward inference" was misleading. Because the test compares each label against the average label and never looks at the unselected studies, its ranking tracks literature frequency rather than the selection. Measured across three unrelated ROIs on Neurosynth v7:

   | ROI | top labels (uniformity / Forward) |
   |---|---|
   | L anterior insula `[-36,18,0]` | task, magnetic, resonance, magnetic resonance, functional magnetic |
   | Occipital `[0,-88,4]` | magnetic, task, resonance, magnetic resonance, functional magnetic |
   | L motor `[-40,-22,54]` | task, magnetic, resonance, magnetic resonance, functional magnetic |

   6 of the top 8 are identical across all three, and the ranking correlates 0.90–0.94 (Spearman) with raw label document frequency. This is the label-wise counterpart of the caveat Neurosynth gives for the voxel-wise map. The docstrings and `docs/decoding.rst` now say so and point users at the Reverse (association) columns or `CorrelationDecoder`.

   This also resolves the confusion raised on NeuroStars in 2021 (#436), where a user asked why NiMARE reports `probForward`/`probReverse` when Neurosynth had renamed the maps.

## Not in scope

- `nlogp_fdr`'s NaN propagation is unreachable from `neurosynth_decode` after this fix but remains a latent defect in a shared utility — separate PR.
- Renaming the `pForward`/`zForward` columns outright would be a breaking API change; this PR only documents them.
- Replacing the uniformity test with a per-label base-rate test (BrainMap style, as `brainmap_decode` does) is a methods change, not a bug fix, and would need its own citation rather than `yarkoni2011large`.

## Tests

Eight new tests across `test_decode_discrete.py` and `test_stats.py`: a rare-label regression test that would have caught the original bug, a BH-correction test, an equality check against the longhand two-cell chi-squared on `n_selected` trials, coverage of `min_studies` as both count and proportion plus its error path, both degenerate-variance cases for `one_way`, a pin that the ordinary `one_way` path is unmoved, and an end-to-end check that a degenerate selection decodes to p=1 / z=0. 75 passed across `test_stats`, `test_decode_discrete`, `test_correct`, and `test_meta_mkda`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Fix Neurosynth decoding's uniformity statistics and improve the handling and interpretation of sparse labels.

New Features:
- Add configurable minimum-study filtering for Neurosynth decoding, accepting absolute counts or proportions of the analysis universe.

Bug Fixes:
- Correct the Neurosynth uniformity test to use the selected-study count as its trial total, preventing negative or NaN chi-squared results and preserving multiple-comparison corrections.
- Return zero for degenerate uniformity tests with no measurable variance.

Enhancements:
- Clarify that Forward results represent Neurosynth's label-frequency uniformity test and recommend Reverse results or correlation decoding for selection-dependent interpretation.

Documentation:
- Document the uniformity and association tests, their interpretation, and the new minimum-study filtering option.

Tests:
- Add regression and boundary tests covering finite uniformity statistics, corrected p-values, reference statistics, study thresholds, degenerate selections, and analysis-universe handling.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ec2213ef6d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.