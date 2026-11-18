# Issue

**Title:** Correct off-by-one indexing in GCLDA log-likelihood calculation and replace LAPACK matrix inversion

## Description

<!---
This is a suggested pull request template for NiMARE.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
https://github.com/neurostuff/NiMARE/blob/main/CONTRIBUTING.md#pull-requests
-->

<!-- Please indicate after the # which issue you're closing with this PR.
This is helpful for the maintainers AND will magically close the issue when this
pull request is merged!
https://help.github.com/articles/closing-issues-using-keywords -->
Closes none, but addresses two minor issues identified by Claude when I was porting GCLDA to Rust.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Replace mistaken "1-indexing" with actual 0-indexing in GCLDA log-likelihood estimation.
- Replace LAPACK matrix inversion with closed-form adjugate inverse.

Notes from Claude:

### log-likelihood off-by-one (correctness bug)

`compute_log_likelihood` contains, at `gclda.py:984`, `:1020`, and `:1022`:

```python
doc = self.data["ptoken_doc_idx"][i_ptoken] - 1   # "convert didx from 1-idx to 0-idx"
word_token = self.data["wtoken_word_idx"][i_wtoken] - 1
doc = self.data["wtoken_doc_idx"][i_wtoken] - 1
```

These indices are built by `docidx_mapper = {id_: i for (i, id_) in enumerate(ids)}` and are
**already 0-indexed**. Subtracting 1 maps document 0 to index -1, which wraps to the last
document. Every reported log-likelihood is computed against shifted indices.

This does not corrupt the fitted model — log-likelihood never feeds back into sampling — but
every logged, stored, and plotted likelihood value is wrong.

### LAPACK's 3x3 inverse is NOT reproducible in scalar arithmetic — CONFIRMED PROBLEM

A naive scalar LU with partial pivoting matched `np.linalg.inv` bit-for-bit in only **104 of
3000** trials (worst relative difference 4.0e-13); `slogdet` matched in 2717 of 3000. NumPy
dispatches to OpenBLAS, whose blocked and vectorized kernels depend on build configuration, CPU
features, and threading.

Because these precision matrices feed sampling probabilities directly, a single 1-ulp difference
can flip a sampled index, and the divergence then cascades through every subsequent iteration.

**Resolution — change both sides to a closed-form 3x3 adjugate inverse with a fully specified
operation order.** Peak coordinates are always `(x, y, z)`, so the covariance is always 3x3.
Measured against LAPACK over 3000 random regularized covariances:

| Property | Closed-form adjugate |
|---|---|
| Accuracy vs LAPACK | 4.4e-13 relative (same class as any LU) |
| Self-reproducibility | 3000 / 3000 identical bits |
| Symmetry of result | **Exactly symmetric** (LAPACK's result is not) |
| Speed, 40000 inverse+logdet | **0.064 s vs 0.158 s — 2.5x faster** |

This makes bit-exactness a designed property rather than a coincidence. It also removes 200
LAPACK calls per iteration from the Python hot path and produces the exactly-symmetric inverse
that a covariance inverse mathematically should be. It is a genuine improvement to shipped
NiMARE behavior, not merely a porting convenience.

## Summary by Sourcery

Correct GCLDA likelihood indexing and use deterministic closed-form covariance inversion for reproducible spatial calculations.

Bug Fixes:
- Correct GCLDA log-likelihood calculations to use the already zero-based document and token indices without shifting them.
- Preserve positive-definiteness validation while replacing LAPACK-based covariance inversion with a deterministic closed-form 3x3 inverse and log-determinant calculation.

Enhancements:
- Make GCLDA spatial parameter computation reproducible and ensure inverses of symmetric covariance matrices are exactly symmetric.

Tests:
- Add coverage validating the closed-form inverse against LAPACK, exact symmetry and determinism, and rejection of non-positive-definite matrices.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf1ec671ba4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.