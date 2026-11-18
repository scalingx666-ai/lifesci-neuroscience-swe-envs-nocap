# Issue

**Title:** feat(multi-trace): bundle visualization (Phase 2)

## Description

## Summary

Phase 2 polish: refactor the bundle renderer to share rendering primitives with `show_model_graph` and bring module-cluster aesthetics into parity. The previous Phase 2 PR (#171) was closed because (1) the bundle renderer reimplemented node/edge/cluster styling instead of routing through shared utilities and (2) bundle clusters lacked penwidth-by-depth and pass-suffix labels. This branch addresses both.

### Three rendering modes (unchanged from 79c57c3)

* `divergence` -- per-node mean pairwise distance, sequential `Reds` colormap.
* `swarm` -- per-node coverage fraction, sequential `viridis` colormap.
* `group_color` -- categorical colouring by trace-group membership, `tab10` palette.
* `auto` -- picks divergence for shared-topology bundles, swarm for divergent.

### Refactor scope

`torchlens/visualization/_render_utils.py` is now the single source of truth for the Graphviz primitives shared between single- and multi-trace rendering:

* `direction_to_rankdir`, `compute_module_penwidth`, `make_module_cluster_attrs`
* `html_escape`, `format_node_html`
* `MAX_MODULE_PENWIDTH` / `MIN_MODULE_PENWIDTH` / `PENWIDTH_RANGE` constants
* The pre-existing `strip_known_extension` and `render_dot_to_file` helpers

`rendering.py` and `elk_layout.py` switched to these helpers; output is byte-equivalent for ModelLog renderings.

The bundle renderer was split into focused modules:

* `multi_trace/_bundle_clusters.py` -- supergraph -> cluster-hierarchy conversion (pass-aware module addresses, parent/child cluster map, rolled-style `(xN)` and `:N` pass-suffix titles).
* `multi_trace/_bundle_styling.py` -- colormap tables, per-node aggregation (divergence / coverage / group), per-mode fill+font dispatch, edge colouring.
* `multi_trace/visualization.py` -- orchestrator (354 lines, down from 779).

### Module cluster aesthetic parity

* Per-depth penwidth scaling via shared `compute_module_penwidth` (5.0 outermost, 2.0 deepest).
* Pass-aware titles: single-pass modules drop `:N`; supergraph clusters spanning distinct call-site occurrences keep `:N`; rolled-mode multi-pass LayerLogs append `(xN)`.
* Nested cluster hierarchy derived from each canonical supergraph node's `containing_modules` chain, matching ModelLog's nesting.
* Bundle clusters omit the `(ModuleType)` label line (the supergraph doesn't preserve module class) -- the only intentional difference from ModelLog.

### Two deferred items added to `.project-context/todos.md`

* `vis_opt='rolled'` for `show_bundle_graph` (currently advisory).
* `direction='backward'` for `show_bundle_graph` (currently raises `ValueError`).

### Quality gates

* `ruff check .` -- clean.
* `mypy torchlens/` -- clean.
* All 21 tests in `test_multi_trace_visualization.py` pass (17 original + 4 new cluster-parity tests).
* All 28 tests in `test_multi_trace.py` (Phase 1 regression) pass.
* All 12 `test_output_aesthetics.py` tests pass (single-trace `show_model_graph` regression).
* All 8 `test_backward_visualization.py` tests pass.
* All 3 `test_dagua_theme.py` tests pass.
* Full non-slow suite (1499 tests) passes.

## Test plan

- [x] Render a small ModelLog and a single-trace bundle from the same trace; cluster penwidths match at the shallowest depth and both renderers produce monotonically non-increasing penwidths.
- [x] Render a recurrent model bundle; cluster titles include `(x3)` suffix.
- [x] Render `NestedModules` bundle; per-pass clusters carry `:1`, `:2`, `:3` labels.
- [x] Render a single-pass model bundle; cluster titles drop the `:N` suffix.
- [x] Confirm `show_model_graph(model_log)` regression tests still pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6377cda930d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.