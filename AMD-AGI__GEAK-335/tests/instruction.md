# Issue

**Title:** Fix/geak v4 baseline and resume

## Description

PR for #326 and #327 
## Summary

Makes the GEAK/PerfSkills e2e result **credibly comparable** to the Hyperloom
(Magpie) orchestrator that delegates to it, and makes GEAK launch the **identical
serving engine** Hyperloom measured. Three themes:

1. **Serving-launch fidelity** — forward + actually apply the `max-model-len` /
   `gpu-memory-utilization` the orchestrator's baseline served with, so GEAK's
   baseline is the same vLLM/sglang engine (not a slower default stack that
   silently eats the kernel win e2e, cf. #805).
2. **Cross-harness measurement alignment** — surface a *clean* measurement
   residue (identical config on both harnesses) separate from the explore/config
   gain, plus top-level bench-protocol pinning for sweep/validate reuse.
3. **Disk-recovery correctness** — a recovered intermediate win no longer loses
   its server flags/env.

Plus additive learned-KB entries from recent runs. No behavior change when a
handoff omits the new fields (older handoffs / standalone runs stay
byte-identical).

## Changes

### `interface/run_e2e.py`

- **Serving-fidelity fold (generic, backend-pluggable).** New
  `_SERVING_FIDELITY_FLAGS` map + `_flag_present` + `_fold_serving_fidelity_flags`.
  `map_args` folds the handoff's `max_model_len` / `mem_fraction` into
  `initial_extra_server_args`, translated to the **current backend's** flag names
  (`vllm`: `--max-model-len` / `--gpu-memory-utilization`; `sglang`:
  `--context-length` / `--mem-fraction-static`). The workflow already applies
  `initial_extra_server_args` (`INIT_FLAGS → curFlags`) to **every** serving
  launch (baseline / sweep / integrate / validate), so this closes the loop with
  no JS/adapter/role changes.
  - Non-destructive: never overrides a flag the caller already set; appends
    nothing when a knob is unset; an unmapped backend is returned untouched
    (never guesses a flag name). A new backend is a **one-line map entry**, not a
    case-by-case patch.
  - The advisory `ps_args["max_model_len"]` / `["mem_fraction"]` keys are kept.
- **Measurement-divergence isolation.** `baseline_basis` now emits
  `measurement_divergence_pct` = GEAK baseline vs the orchestrator's tput on the
  **same accepted config** (`orchestrator_best_tput_same_config` from the
  handoff), the clean cross-harness residue that promote-side gating should use.
  The existing `baseline_divergence_pct` (vs the RAW baseline, which conflates the
  config gain) is kept for continuity and re-documented.
- **Bench-protocol pinning.** `bench_protocol` (num_prompts / random_range_ratio
  / num_warmups / seed) is surfaced at the **top level** of the result so a
  sweep/validated reuse pins the same protocol the headline number was measured
  with. `{}` when standalone.
- **Disk-recovery fix.** `_recover_best_intermediate_win` reads **both** integrator
  key families — `apply_flags`/`apply_env` and `accepted_flags`/`accepted_env` —
  so a recovered `result.json` never carries an empty `accepted_config` (which
  would relaunch an un-optimized server on every downstream reuse).

### `interface/test_run_e2e_alignment.py` (new)

11 tests covering: measurement-divergence uses same-config not raw baseline (and
is `None` when absent); serving-fidelity forwarding + the fold (vllm/sglang flag
translation, dedup vs explicit caller flag, no-op when absent, unknown-backend
untouched, helper `--flag=value`/`--flag value` forms); and a ground-truth
cross-check that the promoted cold speedup equals Hyperloom's provisional ratio
(and stays below the inflated hot-over-cold ratio).

### `e2e_workflow/knowledge/learned/` (additive playbook)

- **new** `moe-bf16-tune-gfx942.md` — the memory-free per-shape fused-MoE Triton
  config-tune lever extended to **dense bf16** (`dtype=None`), Gemma-4-26B run.
- `fp8-a8w8-blockscale-overlay-gfx942.md` — 17th confirm (Qwen3-14B-FP8 TP=1).
- `paged-attn-nonpow2-gfx942.md` — 6th confirm + vLLM 0.21 `UNIFIED_ATTENTION`
  triton_attn live-seam caution.
- `INDEX.md` — index the above.

## Test plan

- [x] `python3 -m pytest interface/test_run_e2e_alignment.py -q` → 11 passed
- [x] `python3 -m pytest interface/test_run_e2e_recovery.py interface/test_run_e2e_alignment.py -q` → 40 passed
- [x] No linter errors in `interface/run_e2e.py`
- [ ] End-to-end smoke against a real Hyperloom handoff carrying
      `max_model_len` / `mem_fraction` / `orchestrator_best_tput_same_config`
      (confirm the folded flags appear in the launched server command and
      `measurement_divergence_pct` is populated).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91f80cf7df54`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.