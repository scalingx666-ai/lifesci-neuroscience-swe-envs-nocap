# Issue

**Title:** Fix border index for selecting features

## Description

This PR fixes an off-by-one indexing error in select_features.py that can cause the algorithm to select a different set of wavelet coefficients from the intended `nFeatures` coefficients with the smallest KS p-values.

**Problem**
The current implementation uses:
```
sorted_scores = np.sort(scores)
border = sorted_scores[num_features_out]
ret = (scores <= border).nonzero()[0]
ret = ret[:num_features_out]
```

Because Python uses zero-based indexing, `sorted_scores[num_features_out]` corresponds to the (`nFeatures` + 1)-th smallest p-value.

When p-values are distinct, this results in `nFeatures` + 1 candidate coefficients. The subsequent slicing operation retains the first `nFeatures` candidates according to their original coefficient indices, rather than their KS p-value ranking. Consequently, the algorithm can discard one of the intended coefficients and replace it with the (`nFeatures` + 1)-th ranked coefficient.

**Fix**
This fix changes:

`border = sorted_scores[num_features_out]`

to:

`border = sorted_scores[num_features_out - 1]`

This ensures that the threshold corresponds to the `nFeatures`-th smallest p-value. The correction preserves the existing KS-based feature-selection methodology and the original ordering of the returned coefficient indices.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91bbf02c8eeb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.