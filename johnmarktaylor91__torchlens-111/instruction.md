# Issue

**Title:** perf(capture): Phase 5 easy remaining optimizations

## Description

## Summary

- **Lazy `_fsize_nice` properties**: Convert 6 eagerly computed `human_readable_size()` string fields to `@property` methods across LayerPassLog, LayerLog, ModelLog, ModuleLog, and ParamLog. Eliminates ~2700 string formatting calls per Swin-T pass.
- **Remove `_trim_and_reorder` from postprocess**: Skip the cosmetic OrderedDict rebuild of every LayerPassLog `__dict__` (685 calls, ~0.04s on Swin-T). Function kept for opt-in use.
- **Batch `pause_logging` for tensor memory**: Inline `nelement() * element_size()` at the two hottest call sites inside a single `pause_logging()` context, eliminating per-call context manager overhead.
- **Remove `activation_postfunc` deepcopy**: `copy.deepcopy()` on a callable is unnecessary.

## Test plan

- [x] `pytest tests/ -m smoke -x` — 18 smoke tests pass
- [x] `pytest tests/test_metadata.py tests/test_module_log.py tests/test_layer_log.py tests/test_internals.py tests/test_output_aesthetics.py -x` — 239 tests pass
- [x] `pytest tests/test_save_new_activations.py tests/test_validation.py tests/test_toy_models.py -x` — 245 tests pass
- [x] Swin-T warm benchmark: `log_forward_pass` 1.53s (3.9x), metadata-only 1.25s (3.2x), `save_new_activations` 0.70s (1.8x)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efc5229a07c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.