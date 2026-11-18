# Issue

**Title:** perf(logging): optimize 5 hot-path bottlenecks in log_forward_pass

## Description

## Summary

Profiling `log_forward_pass()` on 4 models (ResNet-50, CORnet-S, ViT-L-16, FCOS) revealed 58-95% of wall time in 5 bottlenecks — almost all Python stdlib (`inspect`, `tokenize`, `ast`) called by torchlens. This PR targets all 5 root causes:

- **Cache `torch.cuda.is_available()`** (5-14% wall): called per-op at ~2ms each; now cached once per process
- **Fix `get_tensor_memory_amount`** (2-26% wall): replace CPU transfer + numpy + `getsizeof` with `nelement() * element_size()`
- **Batch `warnings.catch_warnings()`** (1-2% wall): hoist context manager out of per-attribute loop in `extend_search_stack_from_item`
- **Cache module metadata by class type** (12-29% wall): `inspect.getsourcelines`/`signature` now cached per class instead of per instance (e.g. 50 `nn.Conv2d` → 1 call)
- **Lazy source context in `FuncCallLocation`** (38-53% wall): replace `inspect.stack()` + `getframeinfo()` with `sys._getframe()` chain; defer source/signature loading to first property access via `linecache`

## Test plan

- [x] `pytest tests/ -v --timeout=300` — 385 passed, 0 failed (excluding slow real-world model tests)
- [x] Verified `get_tensor_memory_amount` still wrapped in `pause_logging()` (tensor methods are decorated)
- [x] Legacy `FuncCallLocation` construction path (direct kwargs) works for `test_repr_source_unavailable`
- [x] Lazy property access triggers `_load_source()` correctly on first access

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad6719b2fe2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.