# Issue

**Title:** fix(tests): rename model_kwargs to input_kwargs and fix test configs

## Description

## Summary
- Rename `model_kwargs=` to `input_kwargs=` in 17 test call sites to match the actual API parameter name
- Skip `test_gpt_bigcode` — GPTBigCode JIT-compiles attention internally, incompatible with TorchLens wrappers
- Fix `test_deformable_detr` backbone `out_features` from `["stage2", "stage3"]` to `["stage1", "stage2"]` (2-layer ResNet only has `stem`/`stage1`/`stage2`)
- Add 3 missing ArgSpec entries (`index`, `symint`, `checkkeypaddingmask`) to `_UNARY_FUNCS`

## Test plan
- [x] 13 previously-failing tests now pass
- [x] 1 test skipped (gpt_bigcode)
- [x] 3 tests (funnel_transformer, blip2, layoutlm) now progress past the kwarg TypeError but hit separate pre-existing bugs (validation invariant, missing arg, index OOB)
- [x] Smoke tests pass (18/18)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `272d558a4aff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.