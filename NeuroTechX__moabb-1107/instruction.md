# Issue

**Title:** Fix WithinSession/WithinSubjectSplitter overwriting explicit n_splits in cv_kwargs

## Description

`WithinSessionSplitter` and `WithinSubjectSplitter` unconditionally injected `n_folds`/`shuffle`/`random_state` into the inner CV kwargs, clobbering values the caller explicitly passed via `cv_kwargs`. This made it impossible to request, e.g., a single stratified holdout split without an inner-CV wrapper that hides `n_splits`.

```python
from sklearn.model_selection import StratifiedShuffleSplit
from moabb.evaluations.splitters import WithinSessionSplitter

# Previously gave 5 folds (n_splits clobbered by n_folds); now yields one 75/25 split per session
sp = WithinSessionSplitter(cv_class=StratifiedShuffleSplit, n_splits=1,
                           test_size=0.25, shuffle=True, random_state=42)
```

### Changes
- **`moabb/evaluations/splitters.py`** — In both splitters, only inject the `n_folds`/`shuffle`/`random_state` defaults when the key is absent from `cv_kwargs` (`if p in params and p not in cv_kwargs`). Caller-provided values now take precedence; defaults are unchanged when not supplied.
- **Docstrings** — Note that explicit `n_splits`/`shuffle`/`random_state` in `cv_kwargs` override the corresponding constructor arguments.
- **`moabb/tests/test_splits.py`** — Parametrized regression test asserting an explicit `n_splits=1` survives and produces one split per group for both splitters.
- **`docs/source/whats_new.rst`** — Changelog entry.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24800f97443b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.