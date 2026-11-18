# Issue

**Title:** use output throughput as default metric

## Description

# Align GEAK e2e throughput metric basis with Hyperloom (output-only)

Fixes AMD-AGI/GEAK#370

## Problem

The GEAK e2e harness (`bench_e2e.sh`) reported **total** token throughput
`(input+output)/s` by default, while the Hyperloom orchestrator's baseline and
explore phases report **output-only** throughput `output/s`. Both pipelines
consume the same underlying benchmark
(`InferenceX/utils/bench_serving/benchmark_serving.py`, which emits both
`output_throughput` and `total_token_throughput`), so the two harnesses were
silently comparing numbers on two different metric bases.

With a symmetric workload (`ISL == OSL`, `RANDOM_RANGE_RATIO=1.0`), total is
exactly 2× output, so GEAK's baseline came out ~2× higher than the
orchestrator's baseline for the identical server/config. This surfaced as a
bogus ~93% "baseline divergence" and a fictitious ~2.2× cross-pipeline
speedup ratio, making every cross-harness comparison meaningless and making the
orchestrator baseline look like a phantom regression.

Additionally, `result.json` hardcoded `metric_basis: "aggregate_output_tok_s"`
even though the aggregated `bench_summary.json` files all recorded
`aggregate_total_token_tok_s` — a mislabel that hid the mismatch.

## Root cause

- `e2e_workflow/scripts/bench_e2e.sh`: `_metric` defaulted to `"total"`, so
  `throughput_tok_s_median` / `metric_basis` were total-based.
- `interface/run_e2e.py`: `metric_basis` in the emitted `result.json` was a hard
  coded string, decoupled from what the summaries actually measured.
- Hyperloom only ever reads `output_throughput`
  (`breakdown/collectors/_common.py`, `breakdown/collectors/explore.py`), so it
  cannot produce a total-based number — the two sides could never match while
  GEAK defaulted to total.

## Changes

1. **`bench_e2e.sh` — default metric basis `total` → `output`.**
   Aligns GEAK's default with Hyperloom's baseline/explore basis
   (`output_throughput`). `E2E_METRIC=total` remains available as an explicit
   opt-in. Header comment updated accordingly.

2. **`run_e2e.py` — read `metric_basis` back from `bench_summary.json`.**
   The emitted `result.json` now reflects the basis that actually produced the
   numbers (`final_summary` → `baseline_summary` → `"aggregate_output_tok_s"`
   fallback), so the label can no longer lie about the basis.

## Effect

- `baseline_divergence_pct` and `gain_vs_orchestrator_baseline` are now computed
  between same-basis numbers, so the ~2× artifact disappears (residual reflects
  only real box drift / config differences).
- Cross-pipeline comparisons are valid again; the orchestrator baseline no
  longer looks like a phantom regression.
- `result.json.metric_basis` is now consistent with the underlying
  `bench_summary.json`.
- Bonus (no Hyperloom change needed): in output mode the
  `output_throughput_tok_s_median` field is populated (it was `None` in total
  mode), which fixes `_geak_sweep.py` reading `None` and GEAK's own
  `recovered_no_gain` path.

## Scope / compatibility

- No Hyperloom-side changes. The environment never sets `E2E_METRIC` explicitly,
  so the new default takes effect everywhere; `E2E_METRIC=total` still works for
  callers that want total-token throughput.
- The GEAK accept ratio (baseline vs candidate) is unaffected — both legs use
  the same key, so the ratio was already basis-consistent within a run.

## Testing

- [ ] `pytest GEAK/interface/test_run_e2e_alignment.py`
- [ ] Manual: run one e2e bench, confirm `bench_summary.json.metric_basis ==
      result.json.metric_basis == "aggregate_output_tok_s"` and that
      `baseline_divergence_pct` is small (single digits) on a symmetric workload.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `090d04643b1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.