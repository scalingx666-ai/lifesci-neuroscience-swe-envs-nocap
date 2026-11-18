# Issue

**Title:** Fix delay and group-delay estimates: NaN bins, reverse pairs, and units

## Description

Four fixes to `group_delay` / `delay`, one commit each, all reproduced before fixing and covered by a test that failed first:

1. **Undefined bins no longer invalidate later ones.** `np.unwrap` ran before the significance mask, and its cumulative correction carried one NaN bin (e.g. a zero-power DC bin) into every later frequency: two signals 1 ms apart with zeroed DC gave `group_delay` NaN and no finite `delay()` candidate. The unwrapping now holds each undefined phase at the last defined one and restores it to NaN, so defined phases unwrap as if the undefined ones were absent (NaN-free phases unwrap exactly as before). Unwrapping each contiguous run separately was avoided because it gives each run an arbitrary 2π offset, breaking the regression across runs.
2. **Reverse-pair `r_value` has the slope's sign.** `[..., j, i]` took `-slope` but the forward `r_value`; a decreasing phase reported `r = +1`. The scipy-linregress reference test encoded the old sign and is corrected. The three group-delay notebook snapshots change only in those reverse `r` entries (delays, slopes, and forward `r` are bit-identical to master).
3. **Reverse-pair delay candidates follow the documented formula.** They were the negated forward candidates in the same order, so reverse candidate `k` held the value for `-k`.
4. **Delay units follow the frequency coordinate.** On `fourier_connectivity`'s default normalized grid (cycles/sample), `delay` and `group_delay` are in samples and the slope in `rad/(cycles/sample)`; they were labeled `s` and `rad/Hz`.

Fixes 1–3 also affect 2.x and are in the CHANGELOG under Fixed; fix 4 concerns `fourier_connectivity`, which is new in 3.0.

Validation: full suite, doctests, ruff, and mypy pass locally.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef97024035fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.