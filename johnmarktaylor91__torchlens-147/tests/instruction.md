# Issue

**Title:** feat(visualization): NodeSpec callback + collapse_fn + skip_fn

## Description

## Summary

Phase 1 of the visualization sprint. Adds a callable-based per-node customization API and three new predicate-based hooks, replacing the old static-dict overrides.

### New API

- ``NodeSpec`` dataclass + ``render_lines_to_html`` helper (users never write HTML).
- ``node_spec_fn(layer_log, default_spec) -> NodeSpec | None`` callback.
- ``collapsed_node_spec_fn(module_log, default_spec) -> NodeSpec | None`` for collapsed-module summaries.
- ``collapse_fn(module_log) -> bool`` predicate; coexists with ``nesting_depth`` (collapse_fn wins if both are set).
- ``skip_fn(layer_log) -> bool`` predicate that elides nodes; edges chain through transitively. Cannot be applied to input/output layers.
- Default node lines now include compact important-args summary for conv/linear/pool/norm/attention/dropout/embedding ops (e.g. "k=3 s=2 p=1", "in=512 out=2048", "heads=8 embed=512").

### Breaking changes

- ``vis_node_overrides`` removed. Migration: ``node_spec_fn=lambda l, s: s.replace(fillcolor="red")``.
- ``vis_nested_node_overrides`` removed. Migration: same pattern with ``collapsed_node_spec_fn``.
- Tests using these kwargs were updated.

### Visual notes

- Aesthetic report generation passes. Expected visual delta: default labels can include compact important-args lines, so some nodes are taller and more informative by default.

### Test plan

- [x] ``ruff check . --fix``
- [x] ``ruff format .``
- [x] ``mypy torchlens/``
- [x] ``pytest tests/ -m smoke -x --tb=short``
- [x] ``pytest tests/test_node_spec_api.py tests/test_collapse_fn.py tests/test_skip_fn.py tests/test_api_renames.py -v``
- [x] ``pytest tests/test_output_aesthetics.py -v``
- [x] ``pytest tests/ -m "not slow" --ignore=tests/test_real_world_models.py -x --tb=short``
- [ ] ``pytest tests/ -m "not slow" -x --tb=short``: stopped in unrelated timm validation tests. ``test_timm_gluon_resnext101_32x4d`` and then ``test_timm_ecaresnet101d`` both failed with saved activation mismatches around ``conv2d_104`` from ``relu_99``; these are real-world-model validation failures, not visualization/NodeSpec/collapse/skip paths.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd70a4a2aa61`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.