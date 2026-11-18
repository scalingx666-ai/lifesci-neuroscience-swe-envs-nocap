# Issue

**Title:** [FIX] Correct KDA's approximate-null binning

## Description

Found for #998, while checking whether the two binning faults in the ALE and Monte Carlo nulls (, ) had siblings elsewhere. One did.

`KDA._compute_null_approximate` in `nimare/meta/cbma/mkda.py` carries both:

```python
bin_edges = bin_centers - (step_size / 2)          # dead
bin_edges = np.append(bin_centers, bin_centers[-1] + step_size)
...
score_idx = np.floor(stat_scores * inv_step_size).astype(int)
```

The first line is overwritten by the second, which builds edges from the centres themselves, and the convolved scores are floored rather than rounded — despite the comment two lines above stating *"The histogram bins are bin \*centers\*, not edges."*

**Latent with the default kernel, severe otherwise.** KDA's default kernel gives each focus a value of 1, so the statistic is an integer count on a grid of step 1.0, where flooring and rounding agree; p-values on the NIDM pain coordinates are identical before and after, to every printed digit.

Scaling the kernel value breaks that. Multiplying every kernel value by a constant scales the statistic and the null identically, so p must not move:

| `kernel__value` | as shipped | with this fix |
|---|---|---|
| 1 | 3.283075e-12 | 3.283075e-12 |
| 0.7 | **6.037268e-27** | 3.283075e-12 |

Fifteen orders of magnitude, because a bin width other than 1.0 misplaces the whole null. The corrected version is scale-invariant, which is what the new regression test asserts (verified to fail without the change).

`test_meta_mkda.py` passes (22), KDA included.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Fix KDA approximate-null score binning to preserve scale-invariant p-values.

Bug Fixes:
- Correct KDA approximate-null histogram binning so scaled kernel values produce consistent p-values.

Tests:
- Add a regression test verifying that KDA approximate-null p-values are invariant to kernel-value scaling.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f22be2c798f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.