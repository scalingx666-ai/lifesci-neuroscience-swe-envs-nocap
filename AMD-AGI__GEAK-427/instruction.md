# Issue

**Title:** Publish the throughput pair an e2e delta is a ratio of

## Description

.

## The defect

A journey e2e block publishes `e2e_gain_pct` and nothing else. A percentage is
a ratio; two ratios with different denominators cannot be added. So a consumer
holding only percentages is forced into a unit error.

GEAK **already measures** both numbers — `ref_med` and `cand_med` in
`integrate_result.json`, from the same A/B that produced the delta — and drops
them before publishing.

## Evidence

`/shared_nfs/hyperloom-claw`, measured 2026-08-20, Hyperloom CI only.

**Every KEEP block is missing the pair, and the naive sum is meaningless:**

| | n |
|---|---:|
| KEEP journey e2e blocks on disk | **36** |
| ...carrying a throughput pair | **0** |
| naive sum of their percentages | **348.6 pp** / 15 sessions |

**The denominator was measured and thrown away:**

| | n |
|---|---:|
| `accepted`/`stack` overlays | 26 |
| ...carrying `ref_med` **and** `cand_med` | **25 (96.2%)** |
| ...whose pair reproduces its own delta | **25 / 25** |
| worst deviation | **4.74e-03 pp** |

**What the consumer can do once it has the pair** — all 36 KEEP blocks replayed
through Hyperloom's real recorder and real `collect_recorded_optimizations`,
counting the arithmetic branch each credited step takes:

| `gain_method` | before | after |
|---|---:|---:|
| `baseline_chain` — composable, points of one baseline | **0** | **23** |
| `local_gain_projected` — sums percentages | **34** | **12** |
| `missing` | 1 | 1 |

The composable arithmetic is already fully implemented on the Hyperloom side.
It never fires because its input is not published. The 12 remaining are
live-path KEEPs from runs predating this change.

## The change

One rule, three places:

> Publish the two numbers the percentage is a ratio of, taken off the same A/B
> that produced it.

| file | change |
|---|---|
| `interface/run_e2e.py` — `_journey_overlay_entry` | read `ref_med`/`cand_med` from the same `integrate_result.json` the delta comes from, through the existing `_ir_get` so both flat and nested integrator shapes work |
| `interface/run_e2e.py` — `_journey_return_entry` | carry the pair off the accepted-kernel record |
| `e2e_workflow/e2e_workflow.js` | one `e2eFrom(integ)` helper on each accepted head/kernel push, so the live path carries it too |

Field names are `base_tput` / `new_tput` — the names the consumer already
reads. One name end to end, no rename in the middle.

A run with no measured pair emits `null`. It never fabricates a denominator.

## Tests

`interface/test_run_e2e_dispatch.py::TestE2EDenominatorIsPublished`, 4 tests:

| test | asserts |
|---|---|
| `..._publishes_the_pair_and_it_reproduces_the_delta` | pair present, and `new/base` reproduces `e2e_gain_pct` |
| `..._reads_the_pair_from_the_nested_shape_too` | nested integrator output is not silently dropped |
| `..._return_path_carries_the_pair...` | live path carries it |
| `..._a_missing_pair_is_null_not_fabricated` | no invented denominator |

| | result |
|---|---|
| new tests **without** this change | **4 / 4 fail** |
| new tests **with** this change | **4 / 4 pass** |
| `test_run_e2e_dispatch.py` + `test_run_e2e_recovery.py` | **205 passed** |

## Scope and limits

- **The JS change is reviewed by reading only.** There is no JS runtime on the
  analysis host, so `e2e_workflow.js` was not executed. The edit is 11
  mechanical call-site substitutions plus one helper; the diff is deliberately
  uniform so it reads at a glance. `history.ledger` sites were deliberately
  left alone.
- **This does not make per-session totals correct on the replayed data.** 10
  alias twins across 9 of the 15 sessions still double-count. That is the
  producer bug #407/#408 fixed (merged 2026-08-19); every replayed session
  predates it. Not reintroduced or worsened here.
- **One variant shape is left alone.** `Llama-3.1-8B-Instruct/20260816T114410Z`
  → `cand_pa_ll4mi_c0_hip` publishes `e2e_delta_pct_all_repeats` (1.330) and
  `e2e_delta_pct_equal_count` (4.298) and no plain delta, so `e2e_gain_pct` is
  already `None` there today. Choosing a canonical variant is not something the
  data settles. Noted in #426 as its own follow-up.
- **Visible, not yet sized.** Hyperloom must also stop discarding these records
  (AMD-AGI/Hyperloom#1252). Both are needed before the dashboard's
  `Kernel Agent Gain (GEAK)` column is both non-zero and correct.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1aa29b9e1d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.