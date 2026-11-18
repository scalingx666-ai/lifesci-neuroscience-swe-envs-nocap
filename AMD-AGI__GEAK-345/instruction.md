# Issue

**Title:** [geak v4] Feat/e2e integration autocorrect & fix planning

## Description

Fixes
  - Fix: the head loop now auto-corrects two reject classes instead of dropping the head — correctness/corruption (passes the isolated unittest but wrong live, e.g. a data_ptr-keyed cache that goes stale across MoE decode steps) and
  wrong-seam / no-engagement (bound at the dead fused_experts_impl while the live path dispatches TritonExperts.apply).
  - Fix (#347): planning now optimizes the op the live kernel actually is — a fused/asm MoE (e.g. aiter fmoe_bf16_blockscaleFp8_g1u1_vs_silu) is optimized AS the fused op via fused levers (fused-op-tune-hook /
  author-fused-replacement) bound at its live dispatcher seam, never decomposed into a standalone GEMM (no live call site → 0 engagement). An engagement_check is verified before the timed A/B, so an unreachable lever dies in
  minutes, not after a ~4.7 h A/B. Non-editable is no longer a reason to skip.
  - Root cause: the old retries only re-ran incomplete A/Bs; the corrective + single-snapshot oracle never covered these classes; fused ops were modeled as dense GEMMs with no seam check.

  Changes

  - e2e_workflow.js — rejectClass (correctness | integration | terminal); parity-aware implausible-speedup guard (amdahlCeilingPct / integAccepted); two-tier tryCorrectiveReauthor (kernel_surgeon → kernel_workflow) + structured
  stop; op-identity guard (_isFusedOp → op_kind=moe, gemmSynthFor off dense synth, bind at live seam); no_rebind_seam/no_engagement → integration corrective; parity_kind/engagement_check in the integrate schema.
  - roles/system_architect.md — seam-reachability contract (is_fused_kernel/live_call_seam/integration_lever/engagement_check).
  - roles/kernel_extractor.md — fused op → extract the fused op at its live dispatcher, never a dense proxy.
  - roles/op_benchmarker.md — fused op → try other fused backends first; non-editable is still backend-swappable.
  - roles/e2e_integrator.md — report parity_kind; verify ENGAGEMENT_CHECK before the A/B.
  - roles/kernel_surgeon.md (new) — lightweight surgical-fix agent (minimal patch, self-verified on the immutable unittest; escalates if insufficient).

  Impact

  - Correctness / corruption / wrong-seam rejects are auto-corrected (bounded by head_corrective_max, not charged to head_budget) instead of dropped.
  - Generic — no backend name hardcoded; keys on the profile class + Architect flags.
  - Backward-compatible — a clean run / non-fused head / absent field behaves byte-identically.

  Testing

  - #347 (DeepSeek-R1-0528, sglang, TP=4, gfx942): the fused-MoE head fmoe_bf16_blockscaleFp8_g1u1_vs_silu (49.4 % GPU) is planned as a fused op, not a standalone GEMM. Before: a CK-tuned standalone-GEMM candidate was 3.58× isolated
  but engaged 0×, rejected only after a ~4.7 h A/B. After: the fused candidate engages live (is tuned on cu_num>0, 172 markers / 4 ranks) at +1.168 % e2e.
  - Wrong-seam class (Mixtral-8x7B): fp8 author bound at fused_experts_impl → 0 engagement → before: dropped; after: corrective rebinds at the live TritonExperts.apply.

  Reproduce:
  Workflow({ scriptPath: "<repo>/e2e_workflow/e2e_workflow.js",
    args: { model_path, workflow_dir, backend: "sglang", tp: 4, gpu_ids: "0,1,2,3",
            isl: 1024, osl: 1024, conc: 64, exp_root } })
  // fused/asm MoE → optimized as the fused op at its live seam; engagement verified before the A/B;
  // a wrong-seam / corrupt candidate → corrective, not dropped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `412f90c457f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.