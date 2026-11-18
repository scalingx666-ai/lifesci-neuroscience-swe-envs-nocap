# Issue

**Title:** Add Nadeau & Bengio corrected resampled t-test

## Description

.

Within-session evaluation scores come from k-fold resamples whose training sets overlap, so the naive paired t-test underestimates the variance of the mean score difference and is overconfident. This PR adds the corrected resampled t-test of Nadeau & Bengio, which inflates the variance by the test/train ratio n2/n1 of each split:

t = ( (1/n) Σ xⱼ ) / sqrt( (1/n + n2/n1) σ̂² ),  with t ~ Student(n−1) under H0.

**What's included**
- `moabb.analysis.meta_analysis.compute_pvals_corrected_ttest(df, n_train, n_test, order=None)`: same interface and one-tailed k×k p-value convention as `compute_pvals_wilcoxon` / `compute_pvals_perm`, so it drops into the existing meta-analysis machinery (p-values kept strictly inside (0, 1) for Stouffer combination).
- Vectorized private core `_corrected_resampled_ttest`, following the `_pairedttest_*` style.
- 3 unit tests (synthetic data): exact agreement with the hand-computed formula and the algebraic shrinkage relation to `scipy.stats.ttest_rel`; conservativeness vs the uncorrected test with monotonicity in n2/n1; matrix properties, degenerate-variance edge cases, and input validation.
- API docs entry and changelog.

**References**: Nadeau & Bengio, *Inference for the Generalization Error*, NeurIPS 1999 / Machine Learning 52:239–281 (2003); Bouckaert & Frank, PAKDD 2004.

**Scope note**: per @bruAristimunha's comment on #1075, the natural follow-up is a splitter/evaluation hook that records `n_train`/`n_test` per fold and calls this test automatically from `compute_dataset_statistics` for within-session results — I kept this PR focused on the statistic itself and am happy to do the splitter integration as a follow-up if that split of work suits you.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69d80d02d430`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.