# Issue

**Title:** refactor: split postprocess.py into thematic package

## Description

## Summary

- Breaks the 2,115-line monolithic `postprocess.py` into a `postprocess/` package with 5 focused modules
- No behavioral changes — pure file reorganization

## Module breakdown

| File | Steps | Responsibility | ~Lines |
|------|-------|---------------|--------|
| `graph_traversal.py` | 1-4 | Output nodes, ancestry, orphans, distances | 290 |
| `control_flow.py` | 5-7 | Conditional branches, module fixes, buffers | 260 |
| `loop_detection.py` | 8 | Loop detection, isomorphic subgraph expansion | 510 |
| `labeling.py` | 9-12 | Label mapping, final info, renaming, cleanup | 420 |
| `finalization.py` | 13-18 | Undecoration, timing, params, modules, finish | 310 |

## Test plan

- [x] 315 tests pass, 0 failures (toy models, metadata, module log, param log)
- [x] Import paths verified (`from ..postprocess import postprocess`, `from .postprocess import _roll_graph`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b2e5b48f10e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.