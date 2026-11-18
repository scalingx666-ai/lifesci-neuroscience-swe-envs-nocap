# Issue

**Title:** feat(multi-trace): TraceBundle + supergraph (Phase 1)

## Description

## Summary

Phase 1 of the multi-trace sprint. Adds the `torchlens.multi_trace`
subpackage: a `TraceBundle` container for N `ModelLog` instances with
a union supergraph and per-node accessors. One class handles both
shared-topology bundles (every trace traverses every node) and
divergent-topology bundles (dynamic networks, conditional branches,
MoE routing) -- the shared case is just a degenerate overlay where
every node is universal.

Public surface (re-exported as `tl.TraceBundle`, `tl.bundle`,
`tl.NodeView`):

- `TraceBundle(traces, names=None, groups=None)` -- holds N ModelLogs
  by reference; never copies tensors. Builds the union supergraph at
  construction.
- `bundle(...)` -- thin factory wrapper.
- `NodeView` -- per-node accessor returned by `bundle[node_name]`.
  Both list-form (`.activations` / `.gradients`, always works) and
  stacked-form (`.activation` / `.gradient`, strict, raises on partial
  coverage or shape disagreement) accessors. Plus `diff(...)`,
  `aggregate(...)`, `shape`, `op_type`, `module_path`.
- `compare_topology` + `TopologyDiff` -- pairwise structural diff
  between two `ModelLog` graphs.
- `Supergraph` / `SupergraphNode` / `build_supergraph` -- the union
  graph data structure.
- Metric primitives + `METRIC_REGISTRY` and `resolve_metric` helper.
  Scalar inputs auto-fall-back to relative L1 in `NodeView.diff`.

Topology matching is intentionally simple: a greedy linear scan in
topological order with `(containing_module, func_name)` as the
fingerprint. Catches the common cases without graph-isomorphism
machinery; documented limitations live in the docstring.

## Out of scope (deferred)

Per `.project-context/todos.md`:

- **Visualization** (swarm / divergence views) -- Phase 2 dispatch.
- **Counterfactual branch enumeration** (forced-branch execution).
- **Intervention APIs** (`tl.zero`, `tl.steer`, `tl.compare`,
  `tl.sweep`).
- **Streaming aggregate over a dataloader** for large sweeps.
- **Interactive viewer** for bundles/overlays.
- **Custom node visualizations** (PCA-RGB, MDS, histograms).
- **Branch-divergence detection** primitive.
- **`ModelLog -> Trace` rename** -- one-way door, separate migration.

No version bump. No edits to `pyproject.toml`, release config, CI/CD,
or `.project-context/*.md`. No modifications to existing data classes,
capture pipeline, postprocess, or visualization.

## Usage example

```python
import torchlens as tl

ml1 = tl.log_forward_pass(model, x1)
ml2 = tl.log_forward_pass(model, x2)
ml3 = tl.log_forward_pass(model, x3)

# Bundle them
bundle = tl.bundle([ml1, ml2, ml3])
# Or with names + groups
bundle = tl.bundle(
    [ml1, ml2, ml3],
    names=["cat_01", "cat_02", "dog_01"],
    groups={"cats": ["cat_01", "cat_02"], "dogs": ["dog_01"]},
)

bundle.is_shared_topology         # True iff every trace traversed every node
bundle.universal_nodes            # nodes traversed by ALL traces
bundle.selective_nodes("cats")    # nodes only the 'cats' group hit

# Per-node access
view = bundle["relu_1_2"]
view.activations                  # list of per-trace activations
view.activation                   # stacked tensor (strict)
view.diff(metric="cosine")        # NxN pairwise distance matrix
view.diff(other="cat_01")         # 1xN row vs cat_01
view.aggregate("mean")            # mean across traversing traces

# Aggregate analysis
bundle.most_changed(top_k=10)     # ranked by mean pairwise cosine
bundle.coverage("dog_01")         # fraction of supergraph nodes hit
```

## Test plan

- [x] All 28 tests in `tests/test_multi_trace.py` pass (`pytest tests/test_multi_trace.py -v`).
- [x] Smoke suite green: `pytest tests/ -m smoke -x --tb=short` (89 passed).
- [x] `ruff check .` green.
- [x] `ruff format` -- no diff.
- [x] `mypy torchlens/` green (103 source files, no issues).
- [ ] Reviewer to scan public-API surface for naming / ergonomics.
- [ ] Reviewer to confirm topology fingerprint approach is acceptable
      (vs. building a graph-isomorphism solver).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70111e6ad935`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.