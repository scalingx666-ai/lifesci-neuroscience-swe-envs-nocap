# Issue

**Title:** Always run dual estimation in Model.dual_estimation

## Description

### Summary

This PR simplifies `Model.dual_estimation` so that it **always performs dual estimation**
and always returns session-specific parameters.

Previously, `Model.dual_estimation` behaved as follows:

- It only called `hmm_dual_estimation` when `config.learn_covariances == True`.
- If `config.learn_covariances == False`, it returned **group-level covariances** via `self.get_covariances()`.
- If `config.learn_means == False`, it overwrote the dual-estimated means with the group-level means via `self.get_means()`.

In addition, in the configuration `learn_means=True, learn_covariances=False`,
`means` was never set before being returned, which could raise an `UnboundLocalError`.

### What has been changed

The previous conditional behaviour:

```python
# Dual estimation
if self.config.learn_covariances:
    means, covariances = hmm_dual_estimation(...)
    if not self.config.learn_means:
        means = self.get_means()
else:
    covariances = self.get_covariances()
```

has been replaced with a single, unconditional dual-estimation call:

```python
# Dual estimation: always obtain session-specific parameters
means, covariances = hmm_dual_estimation(
    data,
    alpha,
    zero_mean=(not self.config.learn_means),
    eps=self.config.covariances_epsilon,
    n_jobs=n_jobs,
)
```

So `Model.dual_estimation` now always returns **session-specific** means and covariances
as computed by `hmm_dual_estimation`, and no longer falls back to group-level parameters.

### Rationale

Dual estimation is a post-hoc step intended to estimate **subject/session-specific**
state statistics given a fixed posterior (`alpha`). Its outputs should therefore
always be session-specific, and should not silently revert to group-level means
or covariances based on the training-time configuration flags.

This change:

- Fixes the `UnboundLocalError` in the `learn_means=True, learn_covariances=False` case.
- Removes the group-level fallback and makes `dual_estimation`’s behaviour simpler and easier to reason about.
- Ensures the returned arrays match the documented shapes:
  - `(n_sessions, n_states, n_channels)`
  - `(n_sessions, n_states, n_channels, n_channels)`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cea91517a7f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.