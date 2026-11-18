# Issue

**Title:** feat(decoration)!: lazy wrapping — import has no side effects

## Description

## Summary

- **Lazy decoration**: `import torchlens` no longer wraps torch functions. Wrapping happens on first `log_forward_pass()` call and persists afterward.
- **Public wrap/unwrap API**: `wrap_torch()`, `unwrap_torch()`, `wrapped()` context manager, `log_forward_pass(unwrap_when_done=True)`.
- **torch.identity fix**: Decorated identity stored on `_state._decorated_identity` instead of monkey-patching `torch.identity`. Eliminates 2 mypy `attr-defined` errors.

### Breaking change

Torch functions are clean after `import torchlens`. Code that inspected `tl_is_decorated_function` on torch callables immediately after import (without calling any torchlens API) will see `False` until the first logging call. All public API entry points auto-wrap.

## Test plan

- [x] 75 decoration tests pass (12 new lifecycle tests)
- [x] 20 smoke tests pass
- [x] ruff check clean
- [x] mypy clean (0 errors, was 2)
- [ ] Full test suite (Tier 3) — pending

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcb912c54f59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.