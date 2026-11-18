# Issue

**Title:** feat(capture): add func_config field for lightweight hyperparameter extraction

## Description

## Summary
- Adds `func_config` dict to every LayerPassLog/LayerLog with computation-defining hyperparameters (kernel_size, stride, channels, dropout p, etc.)
- Always captured with zero tensor cloning — no flag needed. Empty `{}` for source tensors, output nodes, and unregistered ops
- ~30 extractors covering conv, linear, norm, dropout, pooling, attention, embedding, interpolate, reductions, cat/stack, transpose, pad, clamp
- Displayed in `str()` output as `Config: key=val, ...` when non-empty

Also fixes pre-existing test failures (read-only property assignments in test_validation.py) and adds missing `detect_loops` to MODEL_LOG_FIELD_ORDER.

## Test plan
- [x] 20 unit tests for `extract_salient_args` covering all op categories
- [x] 2 unit tests for `_build_arg_name_map` helper
- [x] 14 integration tests through full `log_forward_pass` pipeline
- [x] Verify source/output/buffer nodes have empty func_config
- [x] Verify fast path (`save_new_activations`) preserves func_config
- [x] Verify default values suppressed (stride=1, dilation=1 hidden for conv)
- [x] Verify str display shows/hides Config line appropriately
- [x] All 730+ existing tests pass

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d02233bc0506`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.