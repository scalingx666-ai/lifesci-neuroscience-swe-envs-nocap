# Issue

**Title:** Robust op-bench/serving harness + honest "absent backend" reporting

## Description

# Robust op-bench/serving harness + honest "absent backend" reporting

## Summary
Hardens the GEAK e2e optimization harness against three recurring failure
modes observed across a 9-case PerfSkills review, and makes the run honest
about levers it could not exercise. All changes are additive and
backward-compatible: non-overlay serving runs, dense/attention op-bench,
and standalone (no-orchestrator) runs are byte-identical to before.

## Motivation
A multi-case review surfaced systemic issues:
- Dominant **MoE / packed-quant GEMM heads** were forced through the dense
  torch-BLAS bake-off, which cannot represent packed-int4 / per-group-scale /
  grouped `[E,N,K]` weights. The harness crashed (`ValueError: no
  a_shape/b_shape`, or `.t()` on a 3D weight) and the dominant head was
  mislabeled a *harness self-fault*.
- A **wedged overlay candidate** (process alive, `/health` 503 forever)
  spun the full health window while holding the serving-GPU lock, starving
  the box until an external hard-kill.
- An **authored kernel with a persistent dequant/shuffle cache** inflated
  resident VRAM and only failed (OOM) after a full A/B, wasting a launch.
- **PerfSkills-E2E vs Hyperloom-E2E** numbers diverged with no machine-
  readable signal of *why* (different measurement protocol / baseline).
- A **mandated lever (flydsl/ck) absent on the image** was silently dropped
  instead of surfaced as a provisioning action.

## Changes

### Op-bench harness (`e2e_workflow/scripts/op_bench.py`)
- New `_is_grouped_or_quant_gemm(meta)` classifier: matches
  `kernel_class` ∈ {moe, grouped, experts}, `dtype` ∈
  {int4, int8, uint4, awq, gptq, w4a16, w8a16}, `quant_scheme` ∈
  {awq, gptq, int4, compressed_tensors}, a 3D `b_shape`, or a structured
  `shape:{E,...}` block.
- `bench_gemm` routes such ops to a non-raising skip record
  (`backend="grouped_quant_gemm"`, `raised=False`) **after** the existing
  blockscale guard. Because the record does not raise, `main()`'s
  `harness_suspect` heuristic stays False — the head is reported as
  "needs a Tier-C authored grouped GEMM", not a harness fault.
- No change to the dense / attention / blockscale paths.

### Serving bench (`e2e_workflow/scripts/bench_e2e.sh`)
- **Health-wait**: when an overlay is active (`OVERLAY_PYTHONPATH` set) the
  budget tightens to `OVERLAY_HEALTH_TRIES` (default 72 ≈ 6 min) vs the
  unchanged 180×5 s for stock runs; a fatal server-log marker
  (`CUDA/HIP out of memory`, `watchdog timeout`, `Capturing cuda graph
  failed`, `FATAL`) aborts the wait immediately so a wedged candidate
  releases the serving-GPU lock fast.
- **Memory-parity guard** (pre-timed, overlay-only): when both
  `OVERLAY_PYTHONPATH` and `MEM_HEADROOM_MIN_MB` are set, reject a
  candidate whose minimum free VRAM (`rocm-smi --showmeminfo vram --json`)
  is below the baseline-cleared floor *before* the timed legs. Fail-OPEN on
  any parse error (missing rocm-smi / unexpected schema), so non-AMD or
  partial rigs are unaffected — it only ever rejects on positive proof.

### Result emit (`interface/run_e2e.py`)
- `normalize_result` now emits a self-describing `baseline_basis` block:
  `geak_measured_baseline_tok_s`, `orchestrator_baseline_tok_s` (from the
  handoff's existing `raw_baseline_tput`), `baseline_divergence_pct`,
  `gain_vs_orchestrator_baseline`, plus measurement-protocol provenance
  (`bench_client`, `bench_protocol`, `baseline_config`). Purely additive;
  gating/throughput/speedup logic unchanged. Degrades to `None` when the
  orchestrator baseline is absent.

### Absent-backend provisioning (roles + knowledge)
End-to-end so a mandated-but-missing lever is never a silent drop:
- `knowledge/preflight.md`: preflight writes
  `env_report.json.absent_backends[<name>] = {probe, remedy, mandated_by}`;
  documents flydsl's two independent layers (top-level `flydsl` pip pkg vs
  aiter's `aiter/ops/flydsl/` wrapper) — `pip install flydsl` alone is
  insufficient.
- `roles/director.md`: Director emits `absent_backends` for every absent
  optional backend with an actionable remedy.
- `roles/op_benchmarker.md`: `author_plan` is gated on
  `env_report.available_backends`; an absent mandated lever is emitted as a
  `backend_absent[]` advisory and falls back to the next available author
  language.
- `roles/system_architect.md`: new mandatory **BACKEND ABSENT** report
  section rendered from `absent_backends` / `backend_absent[]`.
- `knowledge/gemm_tuning/fp8_gemm_tuning_sglang_aiter.md`,
  `knowledge/learned/fp8-a8w8-blockscale-overlay-gfx942.md`: document the
  flydsl/ck two-part remedy and that availability is a provisioning gate,
  not a measured no-win.

### Repo hygiene & cleanup
- `.gitignore`: ignore `.torch_ext/` (torch JIT build cache) and
  `e2e_bench_out/` (bench_e2e default `OUT_DIR`).
- Converted pre-existing CJK comments/strings in `bench_e2e.sh` and
  `run_e2e.py` to English (no logic change).

## Behavior / backward compatibility
- Stock (non-overlay) serving runs, dense/attn op-bench, and standalone
  (no-orchestrator) runs are unchanged.
- New env knobs (`OVERLAY_HEALTH_TRIES`, `MEM_HEADROOM_MIN_MB`) are opt-in
  with safe defaults; the memory guard is dormant until a caller sets the
  floor.

## Cross-repo dependencies
- **None on un-merged Hyperloom changes.** `run_e2e.py` reads the handoff
  field `raw_baseline_tput`, which already exists in Hyperloom main; if it
  is absent, `baseline_basis` simply reports `None`.
- To *activate* the memory-parity guard, the GEAK e2e Integrator must
  record the baseline's free-VRAM floor and pass `MEM_HEADROOM_MIN_MB` to
  the candidate leg (GEAK-internal follow-up; the guard is a no-op until
  then).

## Risk
Low. The op-bench change is a new branch ahead of the dense path; the
serving changes only fail *earlier* (never mark a healthy server failed)
and fail-open on memory probing; the result change is additive; the rest
is docs/role-prompt + gitignore.

## Test plan
- [x] `_is_grouped_or_quant_gemm` validated on real metas: MoE int4 → skip,
      dense bf16 → False, 3D weight → skip, fp8 blockscale → blockscale path.
- [x] `bash -n bench_e2e.sh`, `python -m py_compile` / ast-parse op_bench.py
      & run_e2e.py.
- [x] No CJK remaining in changed GEAK code files.
- [x] `git check-ignore` confirms `.torch_ext/` and `e2e_bench_out/` ignored.
- [ ] One overlay e2e run to exercise the health fast-fail + memory guard.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `209089e12743`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.