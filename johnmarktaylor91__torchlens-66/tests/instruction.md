# Issue

**Title:** feat(flops): add per-layer FLOPs computation

## Description

## Summary

- Add per-layer forward and backward FLOPs computation at logging time
- New `torchlens/flops.py` with category-based dispatch covering 500+ PyTorch ops
- `ModelHistory` gains `total_flops_forward`, `total_flops_backward`, `total_flops` properties and `flops_by_type()` method
- `TensorLogEntry` and `RolledTensorLogEntry` gain `flops_forward` / `flops_backward` fields
- 28 new tests (unit formulas + integration with real models)
- `scripts/check_flops_coverage.py` dev utility for auditing op coverage
- Move `test_video_r2plus1_18` to slow test file (memory-heavy)

Based on whisperLiang's contribution in PR #53.

## Test plan

- [x] All 74 test_metadata.py tests pass (28 new FLOPs tests + 46 existing)
- [x] All 96 test_toy_models.py tests pass (no regressions)
- [x] Sampled real-world model tests pass (alexnet, vgg16, vit, cornet_z)
- [x] Scalar edge case (`shape=()`) handled correctly
- [x] Unknown ops return `None` (no crash, no guess)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34a15a99e293`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.