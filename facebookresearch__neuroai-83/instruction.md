# Issue

**Title:** Add probe_layer field to DownstreamWrapper for layer-wise linear probing

## Description

## Summary
- Adds `probe_layer: str | None = None` to `DownstreamWrapper` — when set, a forward hook taps that submodule's output and feeds it (instead of the model's final output) through the existing aggregation + probe chain.
- 2 files, +71 LoC. No new dependencies, no CLI changes, no YAML preset.
- `probe_layer=None` (default) preserves the existing behaviour exactly.

## Why
Probing intermediate representations at depth-N for foundation models (BENDR, LaBraM, …) without modifying the backbone or adding a parallel evaluation path. Enables Alain & Bengio (2016) accuracy-vs-depth analyses.

## Usage
```python
wrapper = DownstreamWrapper(
    probe_layer="encoder.encoder.Encoder_3",
    aggregation="flatten",
    layers_to_unfreeze=[""],
)
# or via grid override on any existing wrapper:
#   downstream_model_wrapper.probe_layer: [encoder.encoder.Encoder_0, ...]
```

## Test plan
- [x] `pytest neuralbench/test_utils.py -k downstream_wrapper -v` — 7/7 pass (5 existing + 2 new)
- [x] `pre-commit run --files ...` — ruff + ruff-format + codespell pass
- [x] `mypy neuralbench` — 0 new errors (pre-existing `transforms.py:139` only)
- [x] Live demo on real BENDR: probe sized correctly from `encoder.encoder.Encoder_0` (in_features=175,104), forward returns `(B, n_outputs)`; typo errors propagate as `AttributeError` from PyTorch's `get_submodule` naming the failed path component.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c6dd14b4237`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.