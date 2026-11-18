# Issue

**Title:** Fix deprecated pyriemann.utils.* import paths → pyriemann.geometry.*

## Description

pyriemann 0.12 deprecated `pyriemann.utils.{mean,covariance,base}` in favour of `pyriemann.geometry.*`, with removal scheduled for 0.14.0. Any CI configuration that promotes `DeprecationWarning` to errors will break on import.

## Changes

- **`moabb/pipelines/csp.py`** – `pyriemann.utils.mean` → `pyriemann.geometry.mean`
- **`moabb/pipelines/classification.py`** – `pyriemann.utils.{covariance,mean}` → `pyriemann.geometry.*`
- **`moabb/datasets/preprocessing.py`** – lazy imports in `EuclideanAlignment.fit()` updated; docstring cross-reference corrected
- **`moabb/tests/test_preprocessing.py`** – test helper import updated
- **`examples/advanced_examples/plot_riemannian_artifact_rejection.py`** – `normalize` import and inline comments updated

All sites use a `try/except ImportError` fallback to preserve compatibility with pyriemann < 0.12 (where `pyriemann.geometry` does not exist):

```python
try:
    from pyriemann.geometry.covariance import covariances, normalize
    from pyriemann.geometry.mean import mean_covariance
except ImportError:  # pyriemann < 0.12
    from pyriemann.utils.covariance import covariances, normalize
    from pyriemann.utils.mean import mean_covariance
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78f18a1dc09c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.