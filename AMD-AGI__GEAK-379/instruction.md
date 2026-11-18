# Issue

**Title:** fix(interface): backfill dropped attribution on a Director-validated win

## Description

## Summary

A GEAK run can return a real, Director-`validated_win` throughput gain while shipping **empty `accepted_kernels` AND `accepted_heads`** in `result.json` — a validated win credited to *nothing*. Consumers that read `result.json` then undercount which optimization actually won.

This PR adds a minimal, do-no-harm reconciliation in the interface layer (`normalize_result`) so `result.json` never drops the attribution of a validated win.

.

## Root cause

Two subsystems disagree and the disagreement is never reconciled:

1. The **System Architect's** Amdahl plausibility guard scored the winning direction against a *single head's* GPU share and marked it `verdict: dead_end` ("implausible_speedup"), so it was never promoted into `accepted_heads`.
2. The **Director** independently re-measured and returned `validation_status: validated_win`, but that override only updates the throughput number + status — it never writes the winner back into the accepted lists.

Result: `throughput_speedup > 1` + `validated_win`, yet `accepted_kernels == [] and accepted_heads == []`.

Observed on **Qwen3.5-27B-FP8** (`20260714T102310Z`): `throughput_speedup=1.5948`, `validation_status=validated_win`, both accepted lists empty, while `state.history.ledger` records the winning direction (`fp8 a8w8 blockscale GEMM — up/gate`, `e2e_delta_pct=58.99`, `verdict=dead_end`).

## What this PR changes

`interface/run_e2e.py` — in `normalize_result`, after `result_source` is resolved:

- When a **live `workflow_return`** carries a **positive, `validated_win`** speedup but **both** accepted lists are empty, recover the winner's identity from the in-run ledger (`state.history.ledger`, the direction the run actually measured) and route it to `accepted_heads` / `accepted_kernels` by which queue it came from (`state.headQueue` / `state.kernelQueue`).
- Each recovered entry is tagged `accepted_via: "director_override"` for auditable provenance.
- Two small pure helpers added: `_best_ledger_win`, `_state_op_names`.

**Do-no-harm guarantees:**
- Fires *only* on `result_source == "workflow_return"` + `speedup > 1` + `validated_win` + both lists empty.
- **Never overrides** a populated accepted list.
- **Never fabricates** — if there is no positive-delta ledger winner, nothing changes.
- Does not mutate the caller's return object (works on a copy), so `workflow_return.json` and `kernel_journey.json` are unchanged.

## Test plan

- [x] `python3 -m pytest interface/test_run_e2e_recovery.py interface/test_run_e2e_alignment.py` → **42 passed, 1 skipped** (pre-existing skip).
- [x] New unit tests added:
  - `test_normalize_backfills_validated_win_attribution_head` — the Qwen3.5-27B case → head recovered into `accepted_heads`, `accepted_kernels` stays `[]`.
  - `test_normalize_backfill_routes_kernel_from_kernelqueue` — a kernelQueue winner routes to `accepted_kernels`.
  - `test_normalize_backfill_noop_without_validated_win` — no `validated_win` ⇒ no backfill (empty stays empty).
- [x] Smoke-tested the **actual** patched `normalize_result` against the **real** Qwen3.5-27B `workflow_return.json` + `director_e2e_validation.json`: recovers `accepted_heads=[{fp8 a8w8 blockscale GEMM …, accepted_via: director_override, e2e_delta_pct: 58.99}]`, `accepted_kernels=[]`.
- [x] Verified **no false positives**: the guard does not fire on the 5 other real wins (GPT-OSS-120B, Qwen3-14B, DS-R1, Kimi-K2.6, MiniMax-M3) — each already has a populated accepted list.

## Scope / follow-ups (tracked in #377)

This is the interface-layer safety net (the last gate before `result.json`), chosen because it is minimal and fully testable. Complementary upstream hardening remains in #377:
- producer-side reconciliation in `e2e_workflow.js` (make the Director override authoritative for attribution at the source);
- the Architect's Amdahl guard aggregating mass over a shared `live_call_seam` and downgrading "implausible" from a hard veto to a deep-validation flag;
- a stronger Director accuracy/output-length gate for outlier wins.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0c595edb39d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.