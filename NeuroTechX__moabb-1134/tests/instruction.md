# Issue

**Title:** Fix NaN and inf in compute_dataset_statistics

## Description

.

The traceback in the report is a hard `ValueError` from `scipy.stats.wilcoxon`. That crash no longer happens on current SciPy, but the underlying defect did not go away, it got quieter and became sample size dependent. Verified on SciPy 1.18.0, NumPy 2.5.1, pandas 3.0.5:

```
n=3   WilcoxonResult(statistic=0.0, pvalue=1.0)  RuntimeWarning: invalid value encountered in scalar divide
n=10  WilcoxonResult(statistic=0.0, pvalue=1.0)  RuntimeWarning: invalid value encountered in scalar divide
n=25  WilcoxonResult(statistic=0.0, pvalue=nan)  RuntimeWarning: invalid value encountered in scalar divide
n=30  WilcoxonResult(statistic=0.0, pvalue=nan)  RuntimeWarning: invalid value encountered in scalar divide
```

SciPy's exact method returns 1.0, and the normal approximation it switches to on larger samples returns NaN. `compute_dataset_statistics` only takes the Wilcoxon branch when there are at least `perm_cutoff` subjects, so in practice this straddles the crossover point and the answer silently depends on the subject count.

Reproducer with two pipelines that score identically, no dataset download needed:

```
  dataset  index pipe1 pipe2             p  smd  nsub
1      D1      1     B     A           NaN  NaN    25
2      D1      2     C     A  2.866516e-07  inf    25
```

and `find_significant_differences` on that table writes a bare `NaN` to stdout twice and leaves the NaN in the matrix.

Three sites, one root cause, all of them degenerate paired differences:

`compute_pvals_wilcoxon` called `stats.wilcoxon` on differences that are all zero, where the test is undefined. The pair is now reported as a one tailed p value of 0.5 in both directions, which is exactly what the exact method already yields, so nothing changes where the function currently works. The branch also keeps p strictly inside `(0, 1)`, which is the invariant `_pairedttest_exact` and `_pairedttest_random` already maintain and which the two existing `cannot_be_zero` tests pin down. It matters because `combine_pvalues` uses Stouffer's method, and I confirmed `combine_pvalues` maps p=0 to z=+inf and p=1 to z=-inf while the adjacent representable values give finite z.

`compute_effect` divided the mean paired difference by its standard deviation with no zero check, giving 0/0 for identical pipelines and c/0 for a constant offset. Identical pipelines now report a zero effect. The constant offset case really is an unbounded effect, so it keeps its sign and becomes an explicit infinity rather than a division accident, and no RuntimeWarning is emitted either way.

`find_significant_differences` logged "NaN p-value found, turned to 1" but the line that would have done so, `P[i, j] = 1.0`, was commented out, with `print("NaN")` standing in for it. The fallback is applied now and the print is gone.

One judgement call worth flagging: I kept the constant offset effect as a signed infinity rather than clamping it, because that is the honest answer and it stays contained to the degenerate pair instead of spreading across the matrix. Happy to change the convention if you would rather see something finite there.

Coverage added to `TestStats`, 8 new tests. Note that `std == 0` is a knife edge condition. `0.9 - 0.7` repeated 10 times gives a std of 2.9e-17 while the same values at n=25 give exactly 0, which matches @toncho11's remark about the non deterministic nature of this. The tests use `0.75 - 0.5`, which is exact in binary.

Reverting `moabb/analysis/meta_analysis.py` to develop makes 7 of the new tests fail. All 14 pass after, and the whole file is green at 23 passed. `ruff check moabb/` reports all checks passed, and `ruff format` is applied. A changelog entry is added under Bugs in `docs/source/whats_new.rst` along with an author link.

Disclosure: this change was prepared with AI assistance. I have reviewed and tested it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd8e9f3859c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.