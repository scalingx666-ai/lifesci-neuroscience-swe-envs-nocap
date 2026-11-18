# Issue

**Title:** [FIX] NaN-safe FDR correction, and a one-tailed z for BrainMap forward inference

## Description

Two independent defects found while investigating the `neurosynth_decode` NaN report
(https://neurostars.org/t/negative-chi-square-values-in-neurosynth-decode-forward-inference/36387,
fixed in #1138). Neither is caused by that bug and neither is fixed by it, so they are split out here.

## 1. One NaN erases an entire FDR correction

`nlogp_fdr` sorts with `argsort`, which places NaN last, then runs `minimum.accumulate` over the reversed array. `np.minimum` propagates NaN, so the NaN is the first value the running minimum sees and everything behind it becomes NaN:

```python
>>> nlogp_fdr(np.array([-20.0, -10.0, -1.0, np.nan, -5.0]))
array([nan, nan, nan, nan, nan])
```

One unevaluated test discards the whole family. This is how 343 NaN labels became 3228 NaN labels in the linked report, but the defect is in a shared utility used by `FDRCorrector`, `MKDAChi2`, and both discrete decoders, so it outlives that particular caller.

**Fix:** NaN entries are held out of the step-up procedure and returned as NaN, while still counting toward the number of tests. That is the more conservative of the two readings and the one R's `p.adjust` takes — it drops NAs from the procedure while leaving `n` at the full length of the input:

```r
if(all(nna <- !is.na(p))) nna <- TRUE
p <- p[nna]; lp <- length(p)
BH = { i <- lp:1L; ...; pmin(1, cummin(n/i * p[o]))[ro] }   # n is the full length
```

With no NaN present, `lp == n` and the arithmetic is identical to before. A test pins that path byte-for-byte so the NaN handling cannot perturb ordinary use, and another checks the NaN case against the `n/i` factor computed longhand.

`nlogp_bonferroni` adds a scalar per entry and never compares across them, so it was already NaN-safe. It gains a test rather than a change.

## 2. BrainMap forward inference converted a one-sided p-value with a two-tailed rule

`brainmap_decode` computes forward inference as the upper tail of a binomial:

```python
nlogp_fi = binom.logsf(k=n_selected_term, n=n_term_foci, p=p_selected)
sign_fi = np.sign(n_selected_term - np.mean(n_selected_term))
...
z_corr_fi = nlogp_to_z(nlogp_corr_fi, "two") * sign_fi
```

`logsf` is the upper tail alone, so a small p-value can only mean *more* selected studies carry the label than the selection rate predicts. Converting it with the two-tailed rule and then multiplying by a sign taken from the mean label count meant a label could be reported as significantly **depleted** on the strength of a p-value that only ever tested enrichment — and the sign came from a comparison against the average label, which is not the quantity the binomial tested either.

**Fix:** `zForward` is now one-tailed and unsigned. `zReverse` comes from a two-way chi-squared and remains two-tailed and signed.

**This changes `zForward` values from `brainmap_decode`.** `pForward`, `zReverse`, and all effect sizes are unaffected. The docstring now states that forward inference here cannot report depletion.

## 3. The upper tail excluded the observation itself

Caught in review. `binom.logsf(k)` is `P(X > k)`, but the one-sided p-value for an observed count `k` is `P(X >= k)`, so the argument has to be `k - 1`. I had originally flagged this as out of scope; that was the wrong call, because it interacts directly with the change above — dropping the sign turns what used to surface as a large *negative* z into a large *positive* one.

Two reachable cases:

- **A label whose every focus falls inside the selection** gets `P(X > n) == 0` exactly, so `pForward` underflowed to `4.94e-324` and `zForward` came out as `inf`. The `n_selected_term < 5` guard does not catch this, since such a label can carry any number of studies. On a 40-study synthetic where all 8 carriers of a label are selected and `p_selected` is 0.5, `zForward` was `inf` and is now `2.66`, with `pForward` exactly `0.5 ** 8`.
- **A label observed zero times** gets `P(X > 0)`, which is small whenever the label is rare, so it reads as enrichment on the strength of never having been observed (z of 3.09 at `p_selected = 0.001`). The `< 5` guard does mask this one in the current code, but it is the same defect.

`logsf(-1)` is `log(1)`, so a zero count needs no special handling.

**This changes every `pForward` from `brainmap_decode`**: the previous values were anti-conservative by one term of the pmf.

## Tests

Six new tests: NaN non-propagation for both `bh` and `by`, agreement with the `p.adjust` factor under a NaN, an exact-equality pin on the no-NaN path, the all-NaN case, Bonferroni pass-through, and a check that BrainMap's `zForward` is non-negative and matches a one-tailed conversion. 118 passed across `test_stats`, `test_decode_discrete`, `test_transforms`, and `test_correct`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Make FDR correction robust to unevaluated tests and align BrainMap forward inference with its one-sided enrichment test.

Bug Fixes:
- Prevent NaN values from propagating through and invalidating an entire FDR correction while preserving conservative multiple-testing counts.
- Correct BrainMap forward-inference p-values to use the inclusive binomial upper tail and report one-tailed, non-negative z-values limited to enrichment.

Enhancements:
- Document the distinct directional interpretation of BrainMap forward and reverse inference.

Tests:
- Add regression coverage for NaN-safe BH and BY corrections, unchanged no-NaN behavior, all-NaN inputs, and Bonferroni NaN pass-through.
- Add BrainMap tests covering one-tailed unsigned z-values, inclusive upper-tail probabilities, saturated and unobserved labels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3ce72e5faef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.