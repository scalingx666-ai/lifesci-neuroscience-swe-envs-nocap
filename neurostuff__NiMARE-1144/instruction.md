# Issue

**Title:** [FIX] Build Monte Carlo null bin edges from the bin centres

## Description

Found while cross-checking NiMARE against GingerALE for #998.

`_compute_null_montecarlo` and `_compute_null_montecarlo_permutation` in `nimare/meta/cbma/base.py` both did:

```python
bin_edges = bin_centers - (step_size / 2)
bin_edges = np.append(bin_centers, bin_centers[-1] + step_size)
```

The first line computes the correct edges — half a step either side of each centre — and the second throws it away, rebuilding the edges from the centres themselves. `np.histogram` then floors every summary statistic into the bin below, reproducing on the Monte Carlo path the same half-bin bias the approximate null carries (#1143). That the first line is dead is what marks this as an editing slip rather than a decision.

Both versions produce the same number of edges, so nothing downstream changes shape — only which bin a value lands in:

```
value just below the centre at index 20
  correct edges -> bin 20
  edges from centres -> bin 19
```

Both call sites carried an identical copy of the two lines, so the calculation is extracted into `_histogram_bin_edges` and called twice. That is what makes it testable, and it removes the duplication that let the same mistake live in two places.

Note this is on the path *meant* to be the unbiased alternative to the analytic null, and it is also the path  routes weighted MKDA through, so that PR's weighted Monte Carlo binning benefits from it too. The two merge cleanly.

Adds one regression test. `test_meta_ale.py` passes (49).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Correct Monte Carlo null histogram binning to eliminate the half-bin assignment bias.

Bug Fixes:
- Correct Monte Carlo null histogram bin edges so summary statistics are assigned to the nearest bin centre without the previous half-bin bias.

Enhancements:
- Extract shared histogram edge calculation for permutation and standard Monte Carlo paths to keep binning behavior consistent and testable.

Tests:
- Add regression coverage verifying Monte Carlo histogram edges straddle bin centres and classify near-centre values correctly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f22be2c798f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.