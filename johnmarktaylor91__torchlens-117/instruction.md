# Issue

**Title:** fix(validation): use call nesting depth not address depth in invariant Q

## Description

## Summary
- **Invariant Q fix**: The module containment check incorrectly used address depth (dot count in `nn.Module` tree path) as a proxy for call nesting depth (position on the `forward()` call stack). These are independent concepts — a module at a shallow address can be deeply call-nested when invoked from a deeply-addressed module's `forward()` (e.g., FunnelTransformer's `encoder.attention_structure.sin_dropout` called from `encoder.blocks.1.1.attention`). Replaced the bogus address-depth monotonicity check with known-address and no-duplicate-address validation.
- **test_blip2**: Added required `input_ids` arg and `image_token_id` config for newer transformers API.
- **test_layoutlm**: Generate valid bbox coordinates with `x1 >= x0`, `y1 >= y0` to avoid embedding index-out-of-range.

## Test plan
- [x] All 3 previously failing tests pass (`test_funnel_transformer`, `test_blip2`, `test_layoutlm`)
- [x] All 59 validation tests pass
- [x] All 18 smoke tests pass

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f599a8b7a7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.