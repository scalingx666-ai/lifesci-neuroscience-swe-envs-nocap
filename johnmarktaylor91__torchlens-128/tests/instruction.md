# Issue

**Title:** fix(vis): prevent OOM kill on 1M-node ELK render

## Description

## Summary

Fixes the OOM kill (74GB RSS, 125GB system) when running `render_large_graph.py 1000000`.

- **Decouple log from render** in `render_large_graph.py` — free model params (~8-10GB) before ELK subprocess
- **Cap V8 heap at 64GB** — formula was producing 5.6TB for 1M nodes
- **Fix stack floor to 4096MB, cap 8192MB** — was 64MB floor (CHANGELOG said 4096)
- **Temp file IPC** — write JSON to disk, free the ~120MB string before subprocess
- **Module-level RLIMIT_STACK** — removes `preexec_fn` that forced fork+exec (COW-doubled 74GB process)
- **gc.collect()** before subprocess launch

## Test plan

- [x] `pytest tests/test_large_graphs.py::TestEngineSelection` — 6/6 passed
- [x] `pytest tests/test_large_graphs.py::TestRandomGraphModel::test_10k_nodes` — passed
- [x] `pytest tests/test_large_graphs.py::TestRandomGraphModel::test_20k_nodes` — passed
- [ ] `python scripts/render_large_graph.py 500000 --format svg` — verify no regression
- [ ] `python scripts/render_large_graph.py 1000000 --format svg` — verify no OOM

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa8c0eb81443`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.