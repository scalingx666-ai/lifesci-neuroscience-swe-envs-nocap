# Issue

**Title:** fix(e2e): rank head candidates by weighted speedup + e2e-test every candidate (shared reference)

## Description

Problem

  In the e2e_workflow head-kernel track:
  1. Authored candidates were ranked by unweighted geomean while the env candidate used the workload-weighted speedup — not comparable, and geomean buries the decode bucket that
  governs throughput.
  2. Only the top-ranked candidate was e2e-tested; the rest were dropped untested. So a better candidate could be ranked out by geomean and never measured on the live server.

  Fixes

  1. Rank by weighted speedup (default + fast paths), consistent with the env candidate.
  2. E2E-test every candidate, accept the best measured e2e. The reference leg is identical for all of a head's candidates, so it is measured once and reused
  (REUSE_REF/SHARED_REF_MED); CAND_TAG isolates each candidate's dir. Corrective/pending/reject fall back to the top candidate only if none clears.
  3. Persist every candidate's measured e2e (one ledger row per backend) for the report.

  Testing

  Verified end-to-end on Hy3-FP8 (Hunyuan-V3 MoE, static fp8) with the real pipeline: vLLM, TP=2, MI300X gfx942, ISL/OSL 1024, conc 64. The dominant fused_moe_kernel head
  e2e-tested multiple candidates in one pass (vs only the top one before), all against a single shared reference (identical ref_med, ref server launched once), and accepted the
  highest measured e2e — candidates that used to be skipped are now measured and adjudicated on their real result. Parity byte-exact; Director validation validated_win. Bug
  resolved.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9bf65f0acfe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.