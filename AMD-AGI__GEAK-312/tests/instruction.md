# Issue

**Title:** wire upstream TraceLens prior into the GEAK e2e optimization pipeline

## Description

## Summary

Make the GEAK e2e workflow consume the upstream **TraceLens / kernel-agent**
analysis that the orchestrator already produced for the same baseline workload,
instead of re-discovering everything from scratch. The four artifacts are
auto-discovered beside the handoff's `perfskills` dir, forwarded into the
workflow, and used as a prior by the Profile / Strategize / Extract phases.

The change is **entirely additive and null-safe**: when no TraceLens artifacts
are found (or for any post-config reprofile, where the baseline prior is stale)
the workflow profiles/strategizes exactly as before — a tracelens-less run is
byte-identical.

## Motivation

`run_e2e.py` already surfaced a `tracelens_report` block in the driver prompt,
but those paths were **never threaded into the workflow args**, so the JS
phases and role agents could not use them. TraceLens already provides hot-kernel
names, source files, launcher seams, categories, bound types, and shapes — and a
full roofline torch-trace — which overlaps with GEAK's own Profile/Strategize/
Extract work. Reusing it lets GEAK skip an expensive warm-server profiling pass
and start optimization from a richer prior.

## What changed

**`interface/run_e2e.py`**
- `resolve_tracelens_report()` + helpers: glob-discover the four artifacts under
  the experiment root (parent of `perfskills`), with a fallback to the on-disk
  grandparent of the handoff when `exp_root` is not present on the box.
- `map_args()` now injects the **non-null** resolved paths as `args.tracelens`
  (bridge into the JS workflow); the key is omitted entirely when none are found.
- `build_prompt()` still renders a human-readable `tracelens_report` block.

**`e2e_workflow.js`**
- Parse `args.tracelens` into `TRACELENS_INPUTS` and thread it into the
  **baseline Profile** and **first Strategize** role inputs only (post-config
  reprofile/re-strategize are intentionally excluded — the baseline prior is
  stale once config changes). Empty when absent ⇒ byte-identical.

**`roles/profiler.md`**
- New "Step 0 — TraceLens fast-path" (PHASE=baseline / ROUND 0 only):
  - If `analysis_md` exists → **skip internal trace collection** and build the
    canonical `profile_topN.json` from `kernel_candidates.json`/`tracelens_report.json`.
  - If `trace_file` also exists → run an **additional `parse_profile.py` pass**
    on the top-level **rank0** serving trace (ignoring `capture_traces/` graph
    warmups) and reconcile: prefer the parser's per-launch shapes (the mandatory
    shape double-check, since analysis.md shapes are unreliable).
  - Missing/empty, or any reprofile → unchanged collection.

**`roles/system_architect.md`**
- New advisory step 1b: read `kernel_candidates.json` as a routing prior;
  cross-check measured heads and enrich `head_candidates`/`kernel_candidates`
  with `source_hint` / `launcher_hint` / `bound_type`. Never overrides the
  on-box measured `pct_gpu_time`.

**`roles/kernel_extractor.md`**
- Use `KERNEL.source_hint`/`launcher_hint` as the first place to locate the
  source/seam (still confirmed by import+grep, never trusted blindly).
- Mandatory TraceLens shape double-check against a live capture before freezing
  the unittest.

**`interface/run_e2e.md`**
- Document the new `args.tracelens` mapping row + a "TraceLens prior
  auto-discovery" section (discovery globs, resolution order, and how the
  workflow consumes it). `handoff.json` contract is unchanged (`schema_version`
  stays `1`); `tracelens` is derived from the existing `exp_root`.

## Compatibility

- No new required handoff field; `tracelens` is derived from `exp_root`.
- Absent artifacts ⇒ key omitted ⇒ unchanged behavior. Reprofile rounds ignore
  the (stale) baseline prior.
- New candidate fields ride on `additionalProperties: true` schemas, so existing
  StructuredOutput validation is unaffected.

## Validation

- `develop_geak/tracelens_integration_check.py`: 11/11 local cases inject the
  correct non-null `args.tracelens`; bogus `exp_root` omits the key (null-safe)
  — ALL PASS.
- `develop_geak/dump_full_prompt.py`: full `build_prompt()` output regenerated
  for all 11 cases.
- Ran `parse_profile.py` on a real roofline trace: it recovers the **real**
  kernel symbol `fused_moe_kernel_gptq_awq` (71.5% GPU, editable) + concrete
  per-launch shapes, vs TraceLens's pseudo-op `pseudo_op::moe_gptq_awq_up` +
  launcher path — confirming the value of the extra analysis + shape double-check.
- `python -c ast.parse` clean on `run_e2e.py`; rank0 trace-selection verified on
  real data.

## Test plan

- [ ] End-to-end dry run: `python interface/run_e2e.py <handoff.json> <result.json> --dry-run`
      and confirm `args.tracelens` appears when artifacts exist.
- [ ] One full e2e run on a case WITH tracelens (skip-collection path) and one
      WITHOUT (legacy path) to confirm parity.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78b7b6478017`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.