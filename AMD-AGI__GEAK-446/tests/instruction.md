# Issue

**Title:** Measure the AgentX trace replay instead of a synthetic ISL/OSL sweep

## Description

## Summary

When an external orchestrator hands GEAK an agentic workload, the handoff's
`isl`/`osl` describe a *replay of real traces*, not a benchmark GEAK can
reproduce. GEAK had no way to know that, so it measured a fixed 1024/1024
synthetic sweep and divided the result into an agentic denominator.

This PR adds an AgentX bench client, teaches GEAK to recognise the workload
identity in the handoff, and gates every cross-harness ratio on the two harnesses
having actually measured the same workload.

## Why this matters

A cross-harness ratio is only defined when both sides measured the same workload,
and the way that assumption breaks is completely silent:

| Measurement | Value |
| --- | --- |
| Orchestrator's agentic baseline | 168.998 tok/s |
| GEAK synthetic client at ISL/OSL = 1024 | 465.676 tok/s |
| Ratio an ungated GEAK publishes | **2.76x "win" with no kernel changed** |

The corpus spans roughly 89k input tokens at p50 and past 500k at p99, so there is
no single ISL that stands in for it. Left ungated this produces a confident,
reviewable, entirely fictional speedup.

## What changed

### 1. AgentX bench client — `adapters/clients/agentx.sh` (new)

Replays the trace corpus for a measured duration instead of issuing a fixed prompt
count. Duration is purpose-aware: canonical `parity` and `validation` legs get the
full window, while the inner search loop uses a shorter one and is marked
non-submittable, so a fast A/B probe can never be mistaken for a canonical result.

### 2. Workload identity — `interface/run_e2e.py`

`apply_workload_spec()` fires only when `handoff.workload_spec.kind` is
`agentx_trace_replay`. It exports the replay identity (scenario, dataset,
duration, warmup depth/grace, failed-request threshold, concurrency, metric basis)
and sets `GEAK_ISL_OSL_INACTIVE=1` so adapters refuse to treat fixed ISL/OSL as
the served load. Absence of the field preserves today's synthetic path exactly.

`_targeting_shape()` separates the shape agents *optimize for* from the shape
anything is *measured at* — kernel and GEMM synthesis still need concrete
dimensions, they just must not be mistaken for a reproducible benchmark.

`agentx_preflight()` reports missing AgentX prerequisites before the run burns a
server launch.

### 3. Comparability gate — `interface/run_e2e.py`

Three classifiers (`_baseline_workload_kind`, `_geak_workload_kind`,
`_workload_comparability`) decide whether a cross-harness ratio is meaningful:

```python
comparable = (not both_known) or baseline_kind == geak_kind
```

The rule is deliberately **asymmetric**. Suppression fires only on a *positive*
mismatch between two *known* kinds, so handoffs that predate any workload signal
classify as `unknown` and keep every field they have today. On a real mismatch
each GEAK-over-orchestrator quantity becomes `None` with a recorded
`suppressed_reason` — publishing nothing forces a reviewer to look, where
publishing a number invites them to trust it. Every **within-GEAK** ratio survives
untouched, since both of its legs were measured by the same client on the same
workload.

### 4. Protocol alignment is synthetic-only — `apply_bench_protocol()`

The knobs this block aligns (`NUM_PROMPTS_ADAPTIVE`, `NUM_WARMUPS`, `SEED`,
`RANDOM_RANGE_RATIO`) all shape a *synthetic prompt sweep*, and only mean anything
when both sides measured one. AgentX replays a fixed trace corpus with its own
seed and warmup contract, so fabricating a prompt count or a range ratio for it
would describe a workload nobody ran. They are now gated on the baseline workload
kind.

Note for reviewers: this places `NUM_PROMPTS_ADAPTIVE` — added on `main` after this
work started — inside that guard. The cache-cold parity settings above it
(`GEAK_REPEAT_MODE`, `REPLICA_RETRIES`) stay ungated, since those concern the
server lifecycle and hold for either workload kind.

### 5. Client plumbing

- `bench_e2e.sh` — `NUM_PROMPTS=1` for agentx; the client is duration-based and the
  trace corpus owns the prompt count.
- `bench_replica.sh` — `REPEATS=1` and `GEAK_ISL_OSL_INACTIVE=1` for agentx; the
  replay owns warmup and duration, one measured window per replica.
- `e2e_workflow.js` — carries `shape_provenance` on `WORKLOAD` so roles can tell a
  measured shape from an optimize-for shape.

### 6. Unrelated fix worth calling out — `adapters/clients/inferencex.sh`

The InferenceX client loads the model's tokenizer itself, so it must trust the same
remote code as the server it measures. `bench_e2e.sh` already resolved this and
exported `BENCH_TRUST_REMOTE_CODE`; only the flag passthrough was missing. Without
it a custom-tokenizer model (Kimi-K3, DeepSeek) died in the client at
transformers' `resolve_trust_remote_code` while the server ran fine. Passes the
bare `--trust-remote-code` spelling, since the client rejects the
`=true/false` form.

## Test plan

Full suite: **1697 passed, 4 skipped, 90 subtests passed**
(`PYTHONPATH=<repo root> pytest interface e2e_workflow/scripts/tests`).

New coverage:
- `interface/test_run_e2e_workload_comparability.py` — pins both contracts, and
  reproduces the exact 465.676 / 168.998 false claim as its fixture rather than an
  invented one. Covers the INVARIANT (synthetic and unknown handoffs keep every
  cross-harness field) and the GUARD (a real mismatch suppresses cross-harness
  fields while within-GEAK ratios survive).
- `e2e_workflow/scripts/tests/test_agentx_client_canonicality.py` — search legs
  cannot be promoted to canonical results.
- `interface/test_run_e2e_dispatch.py` — client-selection dispatch.

## Compatibility

Additive and gated on a positive signal. Handoffs without `workload_spec` take the
existing synthetic path unchanged, `BENCH_CLIENT` selection is unchanged for every
existing client, and suppression never fires on an absent or unknown workload kind.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `267a7594d847`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.