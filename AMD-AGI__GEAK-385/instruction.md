# Issue

**Title:** Feat/roofline guided routing

## Description

## Roofline-guided kernel routing

  pct_gpu_time shows where time is spent but not whether it's recoverable — a kernel already at its hardware ceiling can't benefit from optimization budget.
  This PR adds roofline analysis so routing can account for headroom, not just cost.

## Key components

  - New skill slot — a pluggable analysis-skill slot at knowledge/analysis_skills/, with its first skill roofline, which estimates per-kernel roofline
  percentage, attainable speedup, and expected end-to-end gain. The Architect reports two orderings (by %GPU and by expected gain) rather than silently
  combining them.
  - Calibration — tested on a real run (Qwen3.5-35B-A3B-FP8, gfx950, vLLM TP1, 1k/1k, conc 64). fused_moe_kernel used 26.45% GPU at 88% of roofline (essentially
  no recoverable gain), while attention used 8.86% GPU at only 18% of roofline (a real ~1.56× win). Ranking by %GPU misdirects budget to MoE; ranking by
  headroom correctly targets attention.
  - Doctrine — a saturated kernel is rerouted, not dropped: it moves to a byte-reduction track (fusing adjacent ops, skipping unrouted experts, layout/packing,
  lower precision). The measurement contract is fixed — user-supplied isl/osl/conc/batch stays constant, and speculative decoding doesn't count as optimization.
  - Safety — advisory only: the skill never prunes a candidate or overrides measured pct_gpu_time. Staged confidence plus a five-level degradation ladder ending
  in "emit nothing, behave as before." With analysis_skill=none, behavior is byte-identical to before the feature. Analysis is head-scoped; a dispatch-bound
  launch and an infeasible byte model both yield no verdict rather than a false "saturated."
  - Tests — test_roofline_skill.py: 26 stdlib-only tests (no GPU) covering calibration, ranking inversion, and non-fatal degradation.
  test_analysis_skill_off_identical.js verifies the OFF path injects nothing.

 ## End-to-end verification
 validated end-to-end on the calibration config above (Qwen3.5-35B-A3B-FP8 / gfx950 / vLLM TP1 / 1k-1k / conc 64). The skill ran  every round, degraded non-fatally, and the predicted-vs-actual calibration confirmed the routing behaves as designed. No issues.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b6b9f5b750eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.