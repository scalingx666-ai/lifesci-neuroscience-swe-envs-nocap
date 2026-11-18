# Issue

**Title:** PERF: Chunk permutation evaluation in permutation_t_test

## Description

### description

.

in `mne.stats.permutation_t_test`, when testing large input matrices (such as source-space estimates with thousands of vertices and time points) across many permutations, `_extreme_stat` computed all permutations in a single large dot product and matrix expressions (`mus`, `stds`, etc.), allocating dozens of gigabytes of temporary memory and leading to severe memory pressure and swapping.

this pr evaluates permutations in `_extreme_stat` in chunks (`step=1000` by default).

### benchmark

tested on `n_samples=20`, `n_tests=50,000`, `n_perms=10,000`:
- **peak ram:** 15,258.9 mb → 1,526.0 mb (**10.0x reduction**)
- **execution time:** 50.45 s → 8.58 s (**~5.9x faster**)
- **results:** byte-identical across all tail configurations (`tail=0`, `tail=1`, `tail=-1`).

#### ai assistance disclosure

i used antigravity (gemini) to profile memory usage on large inputs, draft the initial chunking in `_extreme_stat`, and write the boundary test, then verified and benchmarked everything locally before submitting.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e67c5482ff9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.