# Issue

**Title:** Add a seed to sd_ratio's noise draw

## Description

`compute_sd_ratio` divides each unit's amplitude SD by a noise SD drawn using `get_noise_levels(recording, method="std")`, which samples 20 random chunks per segment with `seed=None`. The result gets cached on the recording. This means `sd_ratio` changes between processes. Sometimes by a lot. And then anything that thresholds `sd_ratio`, or feeds it to a classifier (my case), can see different inputs from one run to the next.

Once you can seed `compute_sd_ratio`, a noise SD already cached on the recording overrules over the seed, because the cache key ignores it (#4928). `compute_quality_metrics(seed=...)` doesn't help either, since nothing has read it since #4183 (#4927), as far as I can tell.

This PR adds `seed` to `compute_sd_ratio` and `SDRatio.metric_params`. With a seed, `sd_ratio` passes `random_slices_kwargs=dict(seed=seed)` to `get_noise_levels`, plus `force_recompute=True` so that a cached draw can't override the seed. That replaces the cached value for later callers.

In the future, if #4928 is fixed by storing the relevant draw parameters with the cached value, `force_recompute` will be redundant, and I will remove it. But I didn't want to block on that decision. Without a seed, nothing changes, cache included.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7be675c89d9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.