# Issue

**Title:** Add AgentX interactivity measurement support (align inferencex and HL)

## Description

## Summary

`E2E_METRIC` in GEAK could name output or total token throughput. Neither is what Hyperloom grades an
AgentX session on. This adds the two interactivity axes:

- `E2E_METRIC=intvty` reads `e2e_norm_intvty_p90` — the axis Hyperloom grades AgentX on
today.
- `E2E_METRIC=p90_intvty_inferencex` derives `1000 / P90(ITL)` — the axis the InferenceX
public pareto plots as *"P90 Interactivity (tok/s/user)"*.

These are **different numbers**: 84.455 and 116.585 on the same GLM-5.2-MXFP4 baseline rows. They
carry different `metric_basis` strings so one can never be read as the other. See "Two
interactivity axes" below.

The measurements were already reaching us. GEAK's AgentX client adapter shells out to Hyperloom's
`map_aiperf.py`, which has always written both `e2e_norm_intvty_p90` and `p90_tpot_ms` into the
canonical `bench_runs.jsonl` line that `bench_e2e.sh` aggregates. `bench_summarize.py` selected
one key out of `TOTAL_KEYS` or `OUTPUT_KEYS` and dropped the rest. From a real session's baseline
row:

```json
{"e2e_norm_intvty_p90": 84.45, "p90_tpot_ms": 8.577,
 "total_token_throughput": 59226.66, "output_throughput": 444.33}
```

So this is a selector gaining cases, not new plumbing. Neither axis costs an extra measurement.

## Why it matters

Hyperloom grades AgentX on a 2-D verdict: `e2e_norm_intvty_p90` is the objective, total token
throughput is a don't-regress guard. Because `E2E_METRIC` could not name the objective, the
orchestrator pointed GEAK at the guard as the only comparable axis it could name.

On a trace replay that guard cannot move. Under a ~97% prefix cache it is ~99% input tokens that
were never computed — the KV comes out of the radix cache — so it measures the trace's own feed
rate, not the GPU.

Evidence from a 13-hour GLM-5.2-MXFP4 session:


| observation                                     | value                                            |
| ----------------------------------------------- | ------------------------------------------------ |
| restart-to-restart spread, 4 runs of one config | **0.0011%** (65486.003 / .679 / .717 / .499)     |
| A/B legs, wall clock for the same trace slice   | 920.96 s vs 921.07 s                             |
| tuning phase isolated kernel wins               | 1.061–1.196×                                     |
| ...their effect on the graded axis              | **+0.0007%**                                     |
| final stack                                     | empty — 0 kernels, 0 config changes, 0 artifacts |


A metric that reproducible across restarts is not measuring the GPU. The phase's own conclusion,
verbatim: *"a 10% cut on a 9.83% kernel family cannot surface."*

## What changed

`e2e_workflow/scripts/bench_summarize.py`

- `INTVTY_KEYS = ("e2e_norm_intvty_p90",)`, `P90_INTVTY_KEYS = ("p90_tpot_ms", "tpot_p90_ms")`,
and a `_BASES` table mapping each accepted `E2E_METRIC` spelling to
`(keys, metric_basis, transform)`.
- `_is_total()` becomes `_basis()`, returning that triple. `_axis_num()` applies the transform.
- `_recip_ms_to_rate()` turns P90 ITL in ms into the per-user rate, exactly as InferenceX's own
ingestion does it (`infx/results/fixed_sequence.py` maps `p90_tpot_ms` through
`1000.0 / p90_tpot_ms`). A non-positive latency is *no reading* rather than an infinite rate.
- The transform runs **per row, before the median**. The median is identical either way — the
transform is monotone — but this keeps `_spread_pct` expressed in the units the accept gate
compares.
- On either interactivity axis (`_INTVTY_BASES`) the summary also carries
`guard_total_tok_s_median` / `guard_total_tok_s_spread_pct` / `guard_basis`, so a candidate
that buys tail latency by shedding throughput can be caught. The throughput bases keep their
exact field set — there the objective *is* the guard, and a second copy would only invite
drift.
- The `output_throughput_tok_s_*` aliases are nulled off the output axis, same rule and same
reason as the existing `total` behaviour.

**An unrecognised** `E2E_METRIC` **is now fatal** rather than falling back to output. That fallback is
the expensive failure: an orchestrator asking for an axis this build cannot measure would receive
a summary labelled with an axis it never requested, and accept candidates against a reference read
on another one.

**Nothing outside this one file needs to change for the rest of the run to follow.** The tuning
specialist measures through the run's harness — `bash "$EVAL_DIR/bench_e2e.sh"`, which calls
`bench_summarize.py` — so it lands on whichever axis `E2E_METRIC` names without having to know
that it did. No role prompt learns a new axis.

## Two interactivity axes

InferenceX emits two fields that both mean "tok/s/user" and are **not** interchangeable. Both
appear side by side in the same results JSON, built by one helper from different latency
populations (`infx/results/agentic/request_metrics.py`):


|                         | formula             | window                     | InferenceX field  | on this trace |
| ----------------------- | ------------------- | -------------------------- | ----------------- | ------------- |
| `intvty`                | `1 / P90(E2EL/OSL)` | includes TTFT + queue wait | `e2e_norm_intvty` | 84.455        |
| `p90_intvty_inferencex` | `1000 / P90(ITL)`   | decode only                | `intvty`          | 116.585       |


A factor of ~1.4 apart, and the gap is TTFT plus queueing. The InferenceX public pareto plots the
**decode-only** one on its x-axis; the GLM c10 CI job reports 122.249 there, which our clean
reproduction tracks at 119.670 and this session at 116.585.

Hyperloom currently grades the TTFT-inclusive one, and is expected to move onto the InferenceX
definition. Until that lands, `intvty` **keeps naming the axis Hyperloom actually grades**, so
GEAK's accept gate and Hyperloom's KEEP gate cannot drift apart in the interim. When it lands the
handoff selects the new token and nothing in this file changes.

The naming is deliberately asymmetric. `intvty` is a name InferenceX already owns *for the other
metric*, so the decode-only axis is spelled `p90_intvty_inferencex` in full rather than allowed to
shorten into a collision. The two basis strings differ for the same reason: a summary read on one
axis is then structurally incapable of being mistaken for the other downstream.

## Direction and compatibility

Both axes are **higher-is-better**, like both throughput axes, so the accept ratio keeps its
direction and no gate learns a new one. This is worth stating for `e2e_norm_intvty_p90` in
particular: despite the `p90` in the name it is aiperf's **P10** of the per-request rate
`OSL/E2EL_s`, the slow-tail request's own token rate. The `p90` is the 90th-percentile-*worst*
convention applied to a rate.

`throughput_tok_s_median` still carries whichever axis was selected. Renaming it would ripple
through every downstream consumer, so it is left alone; the docstring now says plainly that on
either interactivity axis it is not a tok/s figure and must be read with `metric_basis`.

Default behaviour is unchanged. `E2E_METRIC` unset still means `output`, the `total` path is
untouched, and `intvty` resolves exactly as before, so no existing caller moves.

## Ordering

This change is opt-in and backward compatible; the Hyperloom side is what activates it. **Land and
deploy this first.** A GEAK that predates it, handed `E2E_METRIC=intvty`, falls through to the
output default and labels the summary `aggregate_output_tok_s` — silently grading the wrong axis.
That is exactly why the unknown-value case raises here instead of defaulting.

## Testing

`python3 -m unittest discover -s e2e_workflow/scripts/tests` — **1208 tests, all passing.**
(The suite reports one error loading `test_e2e_store`, `ModuleNotFoundError: pytest`; it
reproduces identically on clean `main` and is an environment gap, not a regression.)

`node e2e_workflow/scripts/test_tuning_skillset_phase.js` — passing. No role prompt is touched,
so `tuning_specialist.md` stays byte-identical to `main` at 1560/1600 method words and
2091/2100 total.

`test_bench_summarize.py` goes 18 → 29 tests. New coverage:

- `test_intvty_metric_selects_the_interactivity_axis`
- `test_intvty_metric_carries_the_throughput_guard`
- `test_throughput_axes_do_not_grow_a_guard_field`
- `test_an_unknown_axis_is_fatal_rather_than_silently_output`
- `test_intvty_leg_aggregates_the_guard_across_replicas`
- `test_inferencex_intvty_axis_is_the_reciprocal_of_p90_itl`
- `test_the_two_interactivity_axes_are_not_the_same_number` — identical rows through both
tokens; asserts the values *and* the basis strings differ. The fixture's `p90_tpot_ms` is
deliberately unrelated to its `e2e_norm_intvty_p90`, so a test reading one axis cannot pass on
the other's number.
- `test_inferencex_intvty_carries_the_throughput_guard`
- `test_spread_is_expressed_in_the_graded_units`
- `test_a_nonpositive_p90_itl_is_no_reading_not_an_infinite_rate`
- `test_inferencex_intvty_leg_also_aggregates_the_guard`

Checked end-to-end against a real session's baseline rows:

```
E2E_SUMMARY e2e_norm_intvty_p90=84.455
E2E_SUMMARY p90_intvty_inferencex=116.585        # 1000 / 8.577406 = 116.585
E2E_SUMMARY aggregate_total_token_tok_s=59226.658
```


## What this does *not* claim

Making an axis expressible does not prove it is movable. Interactivity is dominated by decode
ITL, and on the session above decode ITL was already 6 ms p50 with 96.5% of prefill
cache-served. That run's only head-kernel attempt captured **five prefill cases and zero decode
cases**, leaving the decode seam — the 74%-weighted side of the regime — unmeasured. Fixing that
capture coverage may matter as much as fixing the axis.

The two axes are not equally sensitive to a kernel. A decode win moves `P90(ITL)` and therefore
moves `p90_intvty_inferencex` one-for-one, but reaches `e2e_norm_intvty_p90` diluted by the
TTFT/queue fraction — and the dilution is worst exactly where that axis samples, since
`P90(E2EL/OSL)` selects the queue-bound slow tail. Which axis Hyperloom grades on is its call;
this change only makes both measurable.

**The accept band is not axis-aware, and this PR does not make it so.** `NOISE_BAND_DEFAULT` is
`0.5`, and `E2E_METRIC` does not reach `e2e_workflow.js` at all, so a tuning win is judged
against the same 0.5% band whichever axis is selected. Hyperloom grades the interactivity axis
with a 5% band and publishes `intvty_p90_veto_pct`, which does not currently reach GEAK's
`noise_band_pct`. On the interactivity axes GEAK would therefore accept at 0.5% where Hyperloom
calls anything under 5% noise. The caller-supplied path already exists
(`A.noise_band_pct` / `setup.noise_band_pct`), so wiring Hyperloom's figure into it is a small
change — deliberately not bundled here, because it is an accept-gate change rather than a
measurement one.

## Commits

- `d1e3a717` feat(bench): measure the AgentX interactivity axis
- `66ea0f4e` feat(bench): add the InferenceX decode-only interactivity axis

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `161cbf0b433c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.