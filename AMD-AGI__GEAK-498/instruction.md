# Issue

**Title:** fix(e2e_workflow): adopt a head's entity_kind from its profiled row

## Description

## Summary

- `admitHeads` refused every head when the Architect restated `entity_kind` as the profiled row's classification (`library_gemm`, `triton_kernel`). A head whose `device_kernel` matches a profiled `gpu_kernel` row now takes that row's `entity_kind` (exact name first, then the canonical match). A match that reaches a non-kernel row, or rows of different kinds, promotes nothing, and the refusal is unchanged for those heads.
- `parse_profile.py`'s `annotate_rows` records the matched profiled symbol as `device_kernel` on a `gpu_kernel` row, so the gate has an identity to match against; a `gpu_kernel` row without one is logged as a profile-contract warning.
- `PROFILE_SCHEMA.top_kernels` and `STRATEGY_SCHEMA.head_candidates` are typed so `entity_kind` / `device_kernel` survive the Profiler and Architect answers; `roles/profiler.md` asks for both fields from `profile_topN.json`.

## Test plan

- New `e2e_workflow/scripts/test_head_entity_kind_adoption.js` (added to the L0 Node regression job): a restated `library_gemm` / `triton_kernel` head with a profiled `gpu_kernel` row is admitted; a head with no profiled match or no `device_kernel`, a canonical match that also reaches a non-kernel row, a display alias standing in for a concrete symbol, and a `gpu_kernel` row without `device_kernel` (reported) are still refused. It fails on `main` and passes with this change.
- `test_parse_profile.py`: new case for the annotated row carrying `device_kernel`; fails on `main`, passes here.
- The L0 pytest list and all L0 Node regressions locally: the same results as `main` plus the new tests (three pre-existing failures in this environment are unchanged on `main`).

## Related issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d16a907be839`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.