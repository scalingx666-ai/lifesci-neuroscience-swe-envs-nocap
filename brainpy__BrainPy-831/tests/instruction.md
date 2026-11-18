# Issue

**Title:** Fix CI: replace remove_vmap with brainstate.transform.unvmap

## Description

## Summary

Fixes both failing CI workflows on jax `0.10.2` + brainstate `0.5.1`:
- **Continuous Integration with Models** (`pytest tests/`) — broken by the `remove_vmap` `batching.not_mapped` removal.
- **Continuous Integration** (`pytest brainpy/`) — 9 additional pre-existing failures from brainstate 0.5.1 API drift.

## 1. remove_vmap → brainstate.transform.unvmap

`brainpy/math/remove_vmap.py` defined a custom batching primitive whose batching rule returned `jax.interpreters.batching.not_mapped`, which jax `>= 0.10.2` removed:

```
AttributeError: module 'jax.interpreters.batching' has no attribute 'not_mapped'
```

`brainstate.transform.unvmap` (fixed in **brainstate 0.5.1**, resolves the sentinel via `getattr(batching, 'not_mapped', None)`) is the maintained equivalent with identical global-reduction semantics.

- `check.py`: both call sites use `brainstate.transform.unvmap` directly.
- `math/remove_vmap.py`: thin backward-compatible alias delegating to `unvmap` (unwraps `Array`); removes the broken in-tree primitive. Existing `test_remove_vmap_*` regression suite stays green.
- `requirements.txt` / `pyproject.toml`: require `brainstate>=0.5.1`.

Fixes `test_math_core_fixes.py::test_remove_vmap_under_vmap_is_global` and `test_net_rate_FHN.py::TestFHN.test1`.

## 2. brainstate 0.5.1 API-drift failures in `pytest brainpy/` (9 tests)

- **`while_loop` (`controls.py`)** — brainstate's `while_loop` is driven by tracked State, so the canonical brainpy idiom (body mutates `Variable` state in place and returns `None`, often with empty operands, e.g. `SpikeTimeGroup.update`) is valid. When `body_fun` returns `None`, thread operands through unchanged instead of raising. Fixes `test_SpikeTimeGroup` (input/input_groups), `TestAlpha::test_v1`, `TestDualExpon::test_dual_expon[_v2]`, `TestWhile::test3`.
- **`test_autograd.py::TestDebug::test_debug1`** — `RandomState.value` is now a typed PRNG key (`key<fry>`) that rejects arithmetic; differentiate through the random draw + input only.
- **`test_random.py`** — `chisquare` now supports array-valued `df` (assert shape instead of expecting `NotImplementedError`); `triangular` signature is `(left, mode, right, size, ...)` so pass shape via `size=`.

## Verification

- All 11 originally-failing tests pass.
- `pytest tests/` (audit + simulation): 1026 passed.
- Affected `brainpy/` files: 167 passed. Full `pytest brainpy/` sweep in progress.
- No `batching.not_mapped` usage remains in `brainpy/`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb09982b6002`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.