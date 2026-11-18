# Issue

**Title:** feat(core): bug blitz — in-place ops, loop grouping, validation hardening

## Description

## Summary

- **Generalized in-place op tracking**: replaced hardcoded function name list with identity-based `was_inplace` detection; label propagation now works for all in-place ops
- **Fixed loop grouping**: isomorphic nodes left ungrouped after pairwise pass are now swept into their correct layer group (fixes last-iteration subgraphs without shared params)
- **Deduplicated ground truth outputs**: `validate_saved_activations` now deduplicates output tensors by address, matching `trace_model.py` extraction behavior
- **Hardened validation**: added exemptions for `bernoulli_`/`full` in-place RNG arg mismatches, `meshgrid`/`broadcast_tensors` multi-output perturbation, `*_like` shape-only ops; graceful handling of invalid perturbed args (e.g. `pack_padded_sequence`)
- **Vis fix**: guard for empty `arg_labels` in edge label rendering
- **Test stability**: reduced s3d batch size (16→1), added eval mode + bool mask dtype for StyleTTS
- **Test hygiene**: moved `visualization_outputs/` into `tests/` directory via `VIS_OUTPUT_DIR` constant
- **Prior commit**: codebase-wide bug blitz across all 16 source files — in-place op label propagation, scalar setitem exemption, ruff lint config, loop detection fix, and more

## Test plan
- [x] `test_fasterrcnn_mobilenet_train` — PASSED
- [x] `test_timm_beit_base_patch16_224` — PASSED
- [x] `test_clip` — PASSED
- [x] `test_ssd300_vgg16_eval` — PASSED
- [x] `test_model_simple_ff` — PASSED (vis output path verification)
- [x] All pre-commit hooks (ruff-format, ruff lint, trailing whitespace) — PASSED

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d872703d80a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.