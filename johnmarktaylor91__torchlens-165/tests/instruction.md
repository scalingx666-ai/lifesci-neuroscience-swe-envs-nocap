# Issue

**Title:** feat(capture): add autograd_saved_bytes field tracking per-op autograd memory

## Description

## Summary

- Add pass-level `LayerPassLog.autograd_saved_bytes` and `LayerPassLog.autograd_saved_tensor_count` fields populated from live autograd `grad_fn` introspection.
- Add aggregate `LayerLog.autograd_saved_bytes` and `LayerLog.autograd_saved_tensor_count` rollups across passes.
- Add `ModelLog.total_autograd_saved_bytes` as the model-level sum across layers.

## Design Notes

This is introspection-only: TorchLens reads `grad_fn.saved_tensors` and accessible `_saved_*` attributes at forward logging time, without static op tables or formula-based estimates. When no `grad_fn` exists, including `torch.no_grad()` and inference-mode style execution, the autograd fields stay `None`; a real grad_fn that saves nothing reports `0`.

The new fields are placed near existing tensor-memory fields in `MODEL_LOG_FIELD_ORDER`, `LAYER_PASS_LOG_FIELD_ORDER`, and `LAYER_LOG_FIELD_ORDER` so display and serialization order keeps memory metrics together.

This metric is a companion to, but distinct from, `saved_activation_memory`. `saved_activation_memory` measures tensors TorchLens saves for user inspection, while `autograd_saved_bytes` measures tensors PyTorch autograd saves internally for backward.

Future work: add a formula-based `estimated_autograd_saved_bytes` companion from the `.project-context/todos.md` improvements list in a separate sprint.

## Validation

- `ruff format .`
- `ruff check . --fix`
- `mypy torchlens/`
- `pytest tests/ -m smoke -x --tb=short`
- `pytest tests/test_autograd_saved_bytes.py -v`
- `pytest tests/ -m "not slow" -x --tb=short`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `444269d60045`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.