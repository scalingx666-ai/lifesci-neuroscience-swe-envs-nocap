# Issue

**Title:** feat(robustness): PR3 parallel-wrapper unwrap + framework I/O guards

## Description

## Summary

Wave 3 of the robustness sprint. Extends parallel-wrapper handling beyond `nn.DataParallel` and locks in HuggingFace-style I/O regression coverage.

### DistributedDataParallel unwrap
Previously `_unwrap_data_parallel` only handled `nn.DataParallel`. DDP and DataParallel share the same `.module` attribute, but the isinstance check excluded DDP — so users of the far more common DDP got **silently wrong** layer addressing (parameter barcodes pointing at the wrapper's module hierarchy instead of the real model tree).

Fix: isinstance check extended to `DistributedDataParallel`. Import guarded so torch installs without `torch.distributed` still work.

### FullyShardedDataParallel clear-error
FSDP parameters are sharded across ranks — there is no single unsharded module to log. Silently unwrapping via `.module` would yield a model whose parameters are `FlatParameter` shards, which produces misleading layer metadata and breaks loop detection's parameter-sharing heuristic.

Fix: raise `RuntimeError` at unwrap time with a message explaining the sharding issue and pointing to "run `log_forward_pass` on a rank-local copy of the underlying module (before FSDP wrapping)".

### Framework I/O regression tests (new)
No code changes — these tests lock in the current behavior so future refactors don't silently break HuggingFace use cases:
- Dict-subclass inputs (`BatchEncoding`-shaped `UserDict`) flow through `_move_tensors_to_device` correctly and logging completes.
- Dataclass-style outputs (`ModelOutput`-shaped dataclass) don't crash the output-extraction BFS crawl; at minimum the inner ops are logged.

### Tests (`tests/test_robustness_pr3.py`, 7 cases)
- `DataParallel` unwrap still works (pre-existing behavior guard)
- `DistributedDataParallel` isinstance → unwrap via `.module`
- FSDP isinstance → raise with clear message (helper + `log_forward_pass` entry)
- UserDict-based `BatchEncoding`-like input logs (smoke)
- `ModelOutput`-like dataclass output doesn't crash; Linear is logged
- Standard model still logs (golden-path regression)

### Verification
- `pytest tests/ -m smoke` — 32/32 ✅
- `pytest` targeted regression + PR3 — 466/466 ✅ (3m47s)
- `ruff check .` ✅ / `ruff format` ✅
- `mypy torchlens/` — 66 source files clean ✅

## Test plan
- [x] DataParallel still unwraps (regression guard)
- [x] DistributedDataParallel unwraps via `.module`
- [x] FSDP raises with "FullyShardedDataParallel" in the message
- [x] `log_forward_pass` entry surfaces the FSDP error (not caught internally)
- [x] `BatchEncoding`-like UserDict inputs log
- [x] `ModelOutput`-like dataclass outputs don't crash the extraction path

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6412825edc6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.