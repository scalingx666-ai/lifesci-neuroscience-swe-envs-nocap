# Issue

**Title:** feat(vis): scale ELK rendering to 250k+ nodes, add detect_loops option

## Description

## Summary
- Auto-switch from ELK layered (O(n²) memory) to stress algorithm (O(n)) above 150k nodes, with topological position seeding for directional flow
- Increase Node.js heap allocation (16GB floor, 48x JSON size) and improve OOM error messages
- Add `detect_loops` parameter to `log_forward_pass`/`show_model_graph` to skip expensive isomorphic subgraph expansion while keeping same-param grouping — much faster for very large graphs
- 8 loop comparison tests rendering with/without loop detection for visual inspection

## Test plan
- [x] Smoke test: `detect_loops=False` produces correct labels (param-free loops get separate labels, param-sharing layers still grouped)
- [x] Smoke test: `detect_loops=True` unchanged from existing behavior
- [x] 250k-node ELK render completes in ~19 min (previously impossible — std::bad_alloc)
- [x] Loop comparison test passes: `pytest tests/test_toy_models.py::test_loop_compare_simple_loop_no_param -v`
- [ ] 1M-node render (in progress)
- [ ] Full test suite

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c0b57cf0520`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.