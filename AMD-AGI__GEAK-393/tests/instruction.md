# Issue

**Title:** Enhanced FlyDSL Integration & Skills on fmoe kernel

## Description

# Integrate FlyDSL int4-W4A16 fused-MoE as a first-class expert skill (build-on-demand) + fix scale-dup KV-OOM

## Description

**New feature.** Integrate the FlyDSL int4-W4A16 fused-MoE optimization into the e2e workflow as a
first-class **expert skill** with **build-on-demand** provisioning, plus a standalone `ensure_flydsl`
bootstrap skill. Strategize routes to the `flydsl` backend **by skill match**, keeping preflight/setup
byte-identical to GEAK_v4 (the flydsl gate is env-scoped and self-disables when unmatched, so unrelated
flows are unchanged).

The apply-back shim additionally carries **per-M-bucket tiles** so the same kernel serves both serving
regimes without a code switch:
- **prefill / large-M (M ≥ 512)** → on-box swept authored tiles (Director-verified authored-winner port);
- **mid (65 ≤ M ≤ 511)** → generic tiles;
- **decode (M ≤ 64)** → CU-fill tiles (`tile_n = 64`), lifting decode CTA occupancy 4× on the correct,
  non-atomic fused-silu path.

The validation gate is **regime-adaptive**: it selects the acceptance metric from the live ISL/OSL
(decode-dominated → TPOT drop; prefill-heavy → TTFT drop / throughput gain; balanced → throughput gain with
no TTFT/TPOT regression), instead of assuming decode. This prevents both (a) accepting a prefill-weighted
isolated win that regresses decode serving and (b) rejecting a real prefill win merely because TPOT did not
move.

**Bug fix.** Fix the scale-duplication KV-OOM in the FlyDSL int4-MoE apply-back. `convert_layer_inplace`
previously re-homed only the **weight** and missed the **scale**, so the original `[E,N,G]` bf16 scale
stayed alive alongside the converted scale → scale duplicated ≈ **+14.5 GiB** → KV pool collapse →
`EngineCore` OOM at `determine_available_memory`. Fix: re-home **both** `w*_weight_packed` **and**
`w*_weight_scale` in place (same-byte), keyed by the new weight `data_ptr()` only.

## Changes

**New files**
- `perf_knowledge/expert_skills/skills/apply_flydsl_moe_to_vllm/flydsl_moe_shim.py`, `skill.md`:
  apply-back shim + recipe mapping int4-W4A16 fused-MoE onto FlyDSL `moe_gemm_2stage`, with the per-M-bucket
  tiles (prefill/mid/decode) and the regime-adaptive validation gate.
- `perf_knowledge/expert_skills/skills/apply_flydsl_moe_to_vllm/flydsl_capture_precompile.py`,
  `validate_shim_offline.py`: precompile-every-capture-M-bucket-before-capture seam (dodges the TP>1
  CUDA-graph-capture deadlock) + offline self-check.
- `perf_knowledge/expert_skills/skills/ensure_flydsl/ensure_flydsl.sh`, `skill.md`: build-on-demand /
  bootstrap skill for FlyDSL — version-gated (reuse if `import flydsl, kernels.moe_gemm_2stage` and
  `__version__ ≥ FLYDSL_MIN_VERSION`, else clone+build the pin), portable in-container build, **blocking
  build via background+poll** to dodge the Bash 600 s ceiling (30-min deadline + failure marker).
- `e2e_workflow/knowledge/learned/flydsl-moe-applyback-gfx942.md`,
  `flydsl-moe-gemm2-tiletune-gfx942.md`: two learned-knowledge cards.

**Modified files**
- `perf_knowledge/expert_skills/index.yaml`: register the new skills.
- `perf_knowledge/expert_skills/skills/flydsl_rewrite_quantized_moe/skill.md`: update.
- `e2e_workflow/e2e_workflow.js`: orchestrator FlyDSL provisioning gate — the moment Strategize routes a
  `flydsl` backend onto any head/kernel candidate, `ensure_flydsl` is run **before** any consumer can select
  it; on build failure `flydsl` is stripped from the candidate backend lists (no silent selection).
- `e2e_workflow/roles/system_architect.md`: Strategize routes flydsl by FlyDSL-skill match + build-on-demand
  (`profile_signature` waived when the profile Top-N is empty, e.g. baseline blocked at strategize time).
- `flydsl_moe_shim.py` → `convert_layer_inplace`: re-home **both** weight **and** scale (the KV-OOM fix).
- `e2e_workflow/knowledge/learned/{INDEX.md, moe-int4-w4a16-tune-gfx942.md,
  method-cudagraph-safe-integration.md, paged-attn-nonpow2-gfx942.md}`: knowledge index/card updates
  (incl. the int4-MoE tune confirm on TP=4, cudagraph-safe integration notes).

**Merge conflicts.** None — GitHub reports the branch is **auto-mergeable**. The change is **purely additive**
(10 files, +1588 / −6): the new `apply_flydsl_moe_to_vllm` + `ensure_flydsl` expert skills, plus two small
workflow edits (the FlyDSL build-on-demand provisioning gate in `e2e_workflow.js` / `system_architect.md`).
No knowledge-base / `learned/` cards are touched, and the bench harness / serving are untouched. Conflict-free
after the GEAK v4 harness refactor (#344).

## Impact

- **Group-GEMM optimization direction:** adds the FlyDSL 2-stage grouped-GEMM as the Tier-C author target
  for int4-W4A16 fused-MoE, making it the primary optimization path for that op — now covering **both
  prefill-heavy and decode-heavy** serving via the per-M-bucket tiles (no code switch).
- **Backend selection:** when a FlyDSL skill matches, Strategize includes/prefers the `flydsl` backend and
  builds it on demand via `ensure_flydsl`; if it does not match or the build fails, it falls back to the
  existing backend, with preflight identical to GEAK_v4. **Purely additive, non-invasive; zero impact on
  existing flows when the skill does not match.**

## Testing

**Cross-model e2e (baseline = main branch, experiment = flydsl branch):**

| Model (TP) | baseline | experiment | Note |
|---|---|---|---|
| **Kimi-K2.6 (TP4)** | 49% | **+79% / +143%** | both prefill-heavy and decode-heavy **triggered our FlyDSL rewrite skill** — large, reproducible gain (int4-W4A16 MoE apply-back) |
| gpt-oss-120b (TP1) | +12.65% | +35.98% / +28.5% / +18.56% / +4.90% (4× runs) | FlyDSL rewrite not triggered; normal opt_flags config-tile optimization |
| Qwen3.5-27B-FP8 (TP1) | +54.83% | +46.8% | FlyDSL not triggered; normal optimization |
| DeepSeek-R1 (TP4) | 8.3% | +8% | FlyDSL not triggered; normal optimization |
| Qwen3-14B | 67.59% | 69.6% | FlyDSL not triggered; normal optimization |

> Only Kimi-K2.6 int4-W4A16 exercises the FlyDSL rewrite path end-to-end; on the other models the flydsl
> branch performs equivalently to main via the existing (non-flydsl) optimization, confirming the change is
> additive and non-invasive.

**Issue re-test (scale-dup KV-OOM).** After the fix, at `gpu-memory-utilization 0.95` the KV pool no longer
collapses, **0 fallbacks** (240 live `convert_layer_inplace`), and `EngineCore` no longer OOMs (previously
it OOM'd at `max-model-len 262144`).

### Reproduction / prompt

Reproduced via the GEAK v4 e2e workflow with the following prompt (paths are from our experiment box; edit
before running elsewhere — see the note below):

```
Use the GEAK v4 e2e workflow (workflow_e2e — invoke the Workflow tool to run the script
<REPO>/e2e_workflow/e2e_workflow.js, workflow_dir=<REPO>/e2e_workflow) to optimize vllm
inference for the model /nfs/data/Kimi-K2.6 (moonshotai Kimi-K2.6): ISL=8192 (8k), OSL=1024 (1k),
CONC=64, Precision=int4, TP=4 (gpu_ids=0,1,2,3), Budget=12 hours. InferenceX:
<INFERENCEX>. Save all outputs and artifacts to a new timestamped
directory. The reference kimi-k2.6 vllm server config is
<VLLM_REF_CONFIG>.
Notes (environment/config adaptations; everything else strictly follows the reference config):
- Take the baseline vllm server flags/env from the reference file (block-size 64, max-num-seqs 256,
  gpu-memory-utilization 0.95, max-model-len = ISL+OSL+256, --trust-remote-code,
  --no-enable-prefix-caching, --mm-encoder-tp-mode data, env only VLLM_ROCM_USE_AITER=1).
  The file specifies TP=8; adapt it to TP=4 on this box.
- Use the InferenceX client for benchmarking (measurement-protocol-aligned with Hyperloom/Magpie);
  use this prompt's workload ISL=8192 / OSL=1024 / CONC=64 (overriding the OSL=16 in the reference
  file's client section).
- Enable expert skills (use_expert_skills=true, directory <REPO>/perf_knowledge/expert_skills).
  Do not repeat the config search (config_tune=false). Produce the final deliverable package
  (apply_to_original=true).
```

> ⚠️ To run it yourself, edit these paths/params (the paths above are from our experiment box and won't
> work elsewhere as-is):
> - `<REPO>` → your local GEAK repo path (3 places: e2e_workflow.js / workflow_dir / expert_skills)
> - `/nfs/data/Kimi-K2.6` → your Kimi-K2.6 model weights path
> - `<INFERENCEX>` → your InferenceX path
> - `<VLLM_REF_CONFIG>` → your reference vLLM server config path
> - `"Save all outputs and artifacts to ..."` → your output directory
> - `TP=4 / gpu_ids=0,1,2,3` → adjust to your box's GPU count / available devices

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `faea99be20aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.