# Issue

**Title:** Fix one-tailed Wilcoxon p-values in compute_pvals_wilcoxon

## Description

#### What was wrong

`compute_pvals_wilcoxon` built the one-tailed p-value from SciPy's two-sided signed-rank p-value: halve it, then put it on the "pipe1 > pipe2" side if the mean paired difference is positive, else on the other side (`1 - p/2`). The signed-rank test does not test the mean; its direction comes from the rank sums `W+`/`W-`, which disagree with the sign of the mean whenever a few large differences point one way and many small ones the other.

Example, 7 subjects, pipeline 1 wins on 6 by 0.02 and loses on one by 0.20 (SciPy 1.15.3):

| | current `develop` | `scipy.stats.wilcoxon(x, y, alternative=...)` |
|---|---|---|
| `pvals[pipeline_1, pipeline_2]` | 0.8203 | `"greater"`: 0.1797 |
| `pvals[pipeline_2, pipeline_1]` | 0.1797 | `"less"`: 0.9453 |

So the matrix said pipeline 2 was better (p = 0.18) when the signed-rank test says the opposite (p = 0.18 for pipeline 1). The values feed `compute_dataset_statistics` (every dataset with `>= perm_cutoff` subjects), `find_significant_differences` and the summary / meta-analysis plots. When mean and rank sums agree, the halved value still differs from the exact one-sided p by the point mass at the observed statistic (0.82 vs 0.95 above).

#### The fix

Ask SciPy for the one-sided test directly:

```python
p = stats.wilcoxon(df.loc[:, pipe1], df.loc[:, pipe2], alternative="greater")[1]
```

`alternative` exists since SciPy 1.5; moabb requires `scipy>=1.9.3`. The all-zero-differences guard (0.5) and the `(0, 1)` clipping from #1134 are unchanged. In the common case where mean and rank sums agree and the exact method is used, results change only by the point-mass term; with the normal approximation used for larger `n`, the two agree whenever the rank sums and the mean point the same way.

#### Verification (CPU only, Python 3.12, macOS arm64)

```
python -m pytest moabb/tests/test_analysis.py -k "TestStats or Corrected"   # 36 passed
# the new test test_wilcoxon_tail_follows_rank_sums_not_mean fails on develop:
#   assert np.isclose(pvals[0, 1], expected_greater)  ->  0.8203 vs 0.1797
ruff check / ruff format --check on the two changed files                  # clean
```

Also added a "Bugs" entry to `docs/source/whats_new.rst`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18e7d4c03aee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.