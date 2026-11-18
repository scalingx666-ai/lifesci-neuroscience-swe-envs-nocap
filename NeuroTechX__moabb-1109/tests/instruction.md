# Issue

**Title:** feat(preprocessing): add EuclideanAlignment trial-level transformer

## Description

.

## What

Adds `moabb.datasets.preprocessing.EuclideanAlignment`, a generic, inductive, robust **trial-level** alignment transformer. Euclidean Alignment (He & Wu, 2020) whitens each trial by the inverse square root of the **Euclidean (arithmetic) mean** of the per-trial covariances, removing per-domain (subject/session/recording) covariance shift before a trial-input model sees the data.

```python
from moabb.datasets.preprocessing import EuclideanAlignment

# inductive, leakage-free: learns the whitener on train, re-applies on test
EuclideanAlignment().fit(X_train).transform(X_test)

# transductive per-recording form (what people usually hand-roll)
EuclideanAlignment().fit_transform(X)
```

## Why this shape

- **Inductive & leakage-free** — `fit` stores `inv_sqrt_ref_` from train only; `transform` reuses it on test. The transductive form is just `fit_transform` on one recording — same object, no second class.
- **Robust** — shrinkage covariance (`estimator="lwf"`) + `pyriemann.utils.base.invsqrtm` + `check_is_fitted`. The Euclidean mean is the arithmetic mean of the per-trial covariances, so no `mean_covariance` call is needed.
- **Generic input** — accepts an `mne.Epochs` (via `get_data`) or an `(n_trials, n_channels, n_times)` ndarray; returns an ndarray of the same shape.
- **No new dependency** — `pyriemann >= 0.11` is already a hard moabb requirement (imported lazily inside `fit` so the deprecation-warning paths are only paid by users of this class).
- Distinct from `pyriemann.transfer.TLCenter`, which recenters covariance *matrices* for Riemannian pipelines rather than the raw trials a (deep) network ingests.

Scoped to **Euclidean** alignment specifically (rather than a generic `metric=` selector) so the name matches the behaviour; Riemannian/log-Euclidean siblings can be added later if needed.

## Tests

`moabb/tests/test_preprocessing.py` (all pass): exact whitening with the linear `cov` estimator; covariance-shift reduction across `lwf`/`scm`/`oas`; SPD whitener; inductive no-leakage; `fit_transform == fit().transform()`; Epochs ≡ ndarray; not-fitted + bad-ndim raises; sklearn `clone`/`get_params` contract.

## Docs

- API reference: new **Preprocessing** subsection in `docs/source/api.rst` (`preprocessing.EuclideanAlignment`).
- `docs/source/whats_new.rst` enhancement entry.
- New gallery example `examples/advanced_examples/plot_euclidean_alignment.py`: a leave-one-subject-out cross-subject demo on BNCI2014_001 / LeftRightImagery showing (1) the between-subject covariance dispersion collapsing after EA and (2) CSP+LDA transfer improving with per-subject EA, grounded in [Junqueira, Aristimunha, Chevallier & de Camargo (2024)](https://doi.org/10.1088/1741-2552/ad4f18).

## References

- He, H., & Wu, D. (2020). Transfer learning for BCIs: A Euclidean space data alignment approach. *IEEE TBME*, 67(2), 399-410.
- Junqueira, B., Aristimunha, B., Chevallier, S., & de Camargo, R. Y. (2024). A systematic evaluation of Euclidean alignment with deep learning for EEG decoding. *J. Neural Eng.*, 21(3), 036038.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0738017331e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.