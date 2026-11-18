# Issue

**Title:** feat(robustness): PR2 tensor-variant guard + channels_last fix

## Description

## Summary

Wave 2 of the robustness sprint. Centralises detection of tensor variants TorchLens cannot handle (meta / sparse / symbolic shapes / quantized) and fixes a latent bug where `safe_copy` silently converted `channels_last` tensors to channels-first.

### Pre-flight variant guard
New module `torchlens/_robustness.py`:
- `UnsupportedTensorVariantError` with a bullet-listed message + pointer to `docs/LIMITATIONS.md`.
- `check_model_and_input_variants(model, input_args, input_kwargs)` walks params/buffers + the input tensor tree and:
  - **Raises** for **meta tensors** (no backing storage), **sparse tensors** (safe_copy/print paths assume strided dense), **symbolic-shaped tensors** (`torch.SymInt` dims break counter alignment and flops).
  - **Warns** for **quantized modules** (logging works but FLOPs are wrong).
- Wired into all four entry points in `user_funcs.py` right after `_unwrap_data_parallel` so failures surface up front with a clear message, not partway through the 18-step postprocess pipeline.

### channels_last preservation in safe_copy
`torchlens/utils/tensor_utils.py`:
- New `_safe_get_memory_format(t)` probes `channels_last` / `channels_last_3d` via `is_contiguous(memory_format=...)`, falling back to `preserve_format` on exotic layouts.
- `safe_copy` now passes the probed `memory_format` to both `.clone()` and the detach-path `.clone()`. Falls back to a plain clone on `TypeError`/`RuntimeError` for tensor variants that reject the kwarg.
- **Motivation**: Previous behavior silently converted `channels_last` activations to channels-first on copy, which produced silent wrong results for downstream layout-sensitive ops (conv2d with memory_format hints, etc.).

### Tests (`tests/test_robustness_pr2.py`, 16 cases)
- Meta tensor inputs + meta params raise with a clear message
- Sparse COO and CSR inputs raise with a layout-mentioning message
- Quantized models emit exactly one UserWarning; logging keeps going
- `safe_copy` preserves `channels_last` / `channels_last_3d` on both paths, detach and non-detach
- Standard forward pass still logs (golden-path regression)
- CUDA `channels_last` + CUDA forward pass smoke tests (skipped when no GPU)

### Verification
- `pytest tests/ -m smoke` — 32/32 ✅ (up from 30)
- `pytest tests/test_decoration.py tests/test_internals.py tests/test_defaults.py tests/test_api_renames.py tests/test_cross_file_refactor.py tests/test_robustness_pr2.py tests/test_toy_models.py` — 475/475 ✅ (3m44s)
- `ruff check .` ✅ / `ruff format` ✅
- `mypy torchlens/` — 67 source files clean ✅

## Test plan
- [x] Meta tensor in input — raises
- [x] Meta-initialized model — raises
- [x] Sparse COO / CSR inputs — raise
- [x] Quantized model — warns once, keeps going
- [x] `safe_copy` preserves `channels_last` / `channels_last_3d` (detach + non-detach)
- [x] Golden-path forward pass unchanged
- [x] CUDA paths unaffected

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `553cb8567287`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.