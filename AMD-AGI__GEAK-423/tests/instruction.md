# Issue

**Title:** fix(expert-skill): align FlyDSL selectors and validation

## Description

## Summary

Follow-up to  addressing the post-merge review findings :
- Fix expert-skill selector aliases and emitted workflow modes so the
  gfx950 FlyDSL MoE and dense GEMM skills can be reached correctly.
- Clarify that the three submitted skills are validated by isolated
  kernel A/B and parity; this PR does not claim new E2E gains.
- Add L0 CI coverage, static skill validation, and structured dense
  blockscale evidence with per-run latencies.


## Changes

- Make the two FlyDSL MoE skills match both legal operator identities:
  - `grouped_gemm_moe`
  - `fused_moe_grouped_gemm`
- Make the gfx950 blockscale GEMM skill match:
  - `dense_gemm`
  - `scaled_quant_gemm`
- Define scalar-or-list operator matching in the kernel/e2e expert-skill guidance.
- Mark the MoE recipes as FlyDSL in-place optimizations (`flydsl -> flydsl`).
- Fix `--emit-plan`:
  - same-backend recipes use `mode=optimize`
  - cross-backend ports use `mode=author target_language=...`
  - mixed-source skills expose both applicable arms
- Remove unenforced `e2e_delta_min_pct` fields from the three kernel-scope skills. Their `validated` status now clearly represents isolated kernel A/B + parity only.
- Add structured gfx950 dense evidence with three archived on-box CK/FlyDSL latency pairs:
  - median CK: `0.187461 ms`
  - median FlyDSL: `0.128937 ms`
  - ratio-of-medians: `1.4539x`
  - Director-audited pair: `0.187491 -> 0.128937 ms = 1.4541x`
- Correct the down-proj tuning guidance:
  - `tile_n=256/tile_k=128` is the decisive configuration
  - XCD swizzle and fused-promote were non-load-bearing for this shape
  - the 8-wave follow-up was a measured dead-end
- Clarify that `use_expert_skills=false` suppresses the registry fragment, while general target-backend knowledge remains in the base role prompts.
- Add the portability regression test and three static skill validations to L0 CI.
- Preserve `ensure_flydsl` as a non-profile-matched dependency skill after reindexing.
- Remove the non-canonical `ck -> ck_tile` example.

## Validation Scope

The three submitted skills are `scope: kernel`.

Validated isolated results:

- Decode MoE stage-1 segment: `1.1043x` (`-9.45%`)
- Prefill MoE stage-2 segment: `1.2099x` (`-17.35%`)
- Dense blockscale down-proj: `1.4539x` ratio-of-medians; Director pair `1.4541x`

These numbers include parity validation and the complete declared kernel segment.

This PR does not claim a newly validated serving-level throughput, TTFT, or TPOT improvement. E2E acceptance remains the responsibility of the normal serving A/B gate.

## Evidence

- `flydsl_decode_moe_stage1_blkmap/validation_flydsl_0_2_2.yaml`
- `flydsl_prefill_moe_stage2_fp8partial/validation_flydsl_0_2_2.yaml`
- `flydsl_fp8_blockscale_gemm/validation_gfx950.yaml`

The dense YAML was created from existing on-box GEAK measurements. The original raw reports remain external, and the exact FlyDSL/AITER commits were not captured in the original run.

## Validation

No E2E regression in MI355x was observed under prompt setting TP1, ISL/OSL=1024.
Cross-model e2e (baseline = main branch, experiment = flydsl branch):

Model | main branch | experiment | Note
-- | -- | -- | -- 
gpt-oss-120b | 30.22% | 30.56% | use expert skill = true 
Qwen3.5-27B-FP8 | 53.86% | 56.73% |  use expert skill = true 



- 19 selector/emit-plan/evidence regression tests pass.
- Static validation passes for all three skills.
- `index.yaml` regenerates without changes.
- Dense evidence records three archived on-box CK/FlyDSL latency pairs.
- Serving-level throughput, TTFT, and TPOT were not revalidated in this PR.x

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c44529ae26c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.