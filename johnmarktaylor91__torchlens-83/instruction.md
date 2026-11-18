# Issue

**Title:** feat(data_classes): add BufferLog subclass and BufferAccessor

## Description

## Summary

- **BufferLog(TensorLog)** subclass gives buffers a focused `__repr__`, `name` and `module_address` properties, while remaining full graph nodes (`isinstance(buf, TensorLog)` still True)
- **BufferAccessor** provides ergonomic access via `mh.buffers["addr"]`, `mh.buffers[0]`, `mh.buffers["running_mean"]` — modeled on ParamAccessor
- **Scoped access** via `mh.modules["layer1.0.bn1"].buffers` returns only that module's buffers
- Fixes brittle `type(node) == TensorLog` checks in vis.py to use `isinstance`
- Fixes `TensorLog.copy()` to preserve subclass type
- Fixes `cleanup.py` property-before-callable check order

## Test plan

- [x] All 385 tests pass (excluding real-world model tests)
- [x] `isinstance(buffer, BufferLog)` and `isinstance(buffer, TensorLog)` both True
- [x] BufferAccessor supports address, short name, and integer indexing
- [x] Scoped `mh.modules[addr].buffers` returns correct subset
- [x] Merged buffers (multi-pass BN) remain BufferLog instances
- [x] Graph participation preserved (parent_layers, child_layers)
- [x] Buffer repr sections added to aesthetic test reports (text + PDF)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94ec2e00a675`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.