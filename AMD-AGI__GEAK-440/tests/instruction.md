# Issue

**Title:** fix aiter .so files storage usage

## Description

## Summary

Fixes unbounded disk growth during kernel optimize / E2E lanes when engineer / verify / integrate workspaces repeatedly copy nested `aiter/**/*.so` (esp. `module_aiter_operator.so`, ~0.3–0.6 GiB each). Production arena peaks hit **~110–146 GiB** from nested clones × `wave*_archive_*` full-tree archives; live workspace was only ~1 GiB.

This PR centralizes workspace materialization, excludes JIT `.so` trees, optionally shares immutable `aiter` via symlink, and **reclaims superseded artifacts under disk pressure while continuing optimize** (never abort the loop for disk budget).

Also includes a small `capture_shapes.py` fix so `Module:Class.method` capture targets resolve correctly (needed for RMSNorm-style seams).

## Root cause (corrected)

Not primarily `capture.pid-*` / `reference_io.pt`. The amplifier is:

1. Agents inlining `tar`/`cp` and omitting recursive `*.so` / `aiter/jit` excludes → multi-GiB `.so` copies per engineer/verify workspace.
2. Unpruned rounds + outer `wave*_archive_*` full-tree archives compounding the same trees.

## Code changes

| Path | Change |
|------|--------|
| `kernel_workflow/scripts/materialize_workspace.sh` | **New** single copy path: exclude nested `*.so`/`*.o` and `aiter/jit`, never `-h`/`--dereference`, optional `--link-aiter` under `EVAL_DIR/_shared` |
| `kernel_workflow/scripts/reclaim_eval_artifacts.sh` | **New** reclaim of old rounds / verify / archives; `--force-heavy` under hard pressure |
| `kernel_workflow/kernel_lane.js` | Engineer materialize via script; post-round reclaim then **continue** |
| `kernel_workflow/roles/{director,verify_engineer,integrator,tech_lead}.md` | Same materialize/reclaim contract (`WORKFLOW_DIR`/`SKILL_DIR`) |
| `kernel_workflow/docs/eval_archive_contract.md` | Contract for outer AKA/Hyperloom archives (do not full-tree archive without excludes) |
| `kernel_workflow/scripts/tests/test_eval_storage_reclaim.py` | Unit tests for materialize exclude + reclaim bounds |
| `.github/workflows/ci-l0-checks.yml` | Wire new tests into CI L0 |
| `e2e_workflow/scripts/capture_shapes.py` | Support dotted attrs (`Class.method`) when installing capture hooks |

**Policy:** soft/hard eval disk pressure → reclaim (optionally `--force-heavy`) → keep optimizing. Per-workspace `TORCH_EXTENSIONS_DIR` / `.torch_ext` isolation unchanged; only immutable aiter is shared.

## Test plan / validation

### CI L0 (local clean env on GEAK tree with these changes)

- [x] New storage tests: **6 passed**
- [x] Coverage gate: **97.19%** (gate 97) — PASS (Python 3.11 mirror of CI)
- [x] Contract / KB / lane ref checks — PASS
- [x] Full pytest: **1794+ passed**; 2 local-env failures look pre-existing (`TestLegTimeoutReleasesTheGpu` flaky; `test_both_planes_offer_the_same_candidates` ROCm-version id on boxes with `/opt/rocm`)

### Synthetic / real `.so` amplification harness (`issue_429`)

Using real `module_aiter_operator.so` (~313 MB) under a planted multi-workspace tree:

| Metric | OLD (broken tar) | NEW (materialize + reclaim) |
|--------|------------------|-------------------------------|
| Eval bytes | **~9.8 GB** | **~64 KB** after reclaim |
| `*.so` copies | **32** (~10.5 GB) | **0** in clones after reclaim |

Also: dual-GPU gemm smoke OK on GPU0/1; claw Qwen3-8B dense gemm with planted JIT `.so` → materialize telemetry `n_so=0` on workspaces.

### Full GEAK E2E — Qwen3-8B · sglang · gfx950 · TP=1

- Run dir: `e2e_qwen3_8b_sglang_20260829T055936Z` (~12 h wall budget)
- Result: `status=no_gain`, speedup **1.0×** (baseline ≈ 4957.9 tok/s) — no accepted kernels (perf outcome unrelated to this storage fix)
- **Storage telemetry (issue focus):**
  - **7×** `materialize_telemetry.jsonl` entries, all `n_so=0`, `link_aiter=1`, workspace ≈ 24–53 MB
  - Disk timeseries peak ≈ **0.72 GB** for the eval tree (vs production 100 GB+ class blowups)
  - **1×** reclaim observed; residual `.so` was a **self-built** `.torch_ext` candidate (~1.3 MB), not aiter JIT clone amplification

### Full GEAK E2E — Qwen3-14B-FP8 · sglang · gfx950 · TP=1 (primary FP8 validation)

- Run dir: [`e2e_qwen3_14b_fp8_sglang_20260830T061622Z`](e2e_qwen3_14b_fp8_sglang_20260830T061622Z)
- Host: `crsuse2-m2m-237` · GEAK `fix/enhance_storage_usage` @ `80b1f1e4`
- Config: ISL/OSL=1024, conc=64, TP=1, gpu_ids=0, FP8 · wall budget **10h** (`--timeout-s 36000`)
- Wall clock: **2026-08-30T06:16:32Z → 16:14:26Z**, `run_e2e exit=0`
- Artifacts: `result.json`, `geak/e2e_Qwen3-14B-FP8_*/{final_report.md,workflow_return.json,tuning/tuning_report.md}`

| Item | Value |
|------|--------|
| `result.json` status | **`ok`** (`result_source=workflow_return`) |
| Baseline → final | **4410.543 → 5905.002 tok/s** |
| Throughput speedup | **1.339× (+33.9%)** |
| Primary lever | Tuning skillset: aiter CK **a8w8 blockscale bpreshuffle** FP8 dense GEMM per-shape DB (env+CSV, no source patch) |
| Tuning interleaved A/B | **4927.004 → 5905.002 tok/s (+19.85%, ×1.1985)**, engagement 304 `is tuned on cu_num` hits |
| Accepted env | `SGLANG_USE_AITER=1` + `AITER_CONFIG_GEMM_A8W8_BLOCKSCALE_BPRESHUFFLE=<tuned.csv>` |
| Director validate | `flagged` (serving-GPU lock held by orphaned hung smoke unittest; carried tuning A/B — not a storage regression) |

**Storage / #429 on this run:**

| Metric | Observed |
|--------|----------|
| Disk timeseries peak | **≈ 0.92 GB** (1232 samples) |
| `n_so` / `aiter_so` | **0 / 0** for the entire run |
| `materialize_logs` / `reclaim_logs` | **0 / 0** — HeadKernel stopped at **extract** (4× dead_end/flagged: already-tuned wall / no editable seam / aiter circular ImportError); never entered engineer/verify materialize rounds |
| Eval tree size | ≈ **236 MB** |

## Notes for reviewers

- Related historical PR #432 addressed capture/selection under the same issue number; this PR is the **workspace `.so` amplification / reclaim** fix.
- Outer arena archivists should follow `kernel_workflow/docs/eval_archive_contract.md` so `wave*_archive_*` does not reintroduce full-tree copies.

## How to re-check locally

```bash
# unit tests
python -m pytest kernel_workflow/scripts/tests/test_eval_storage_reclaim.py -q

# optional: materialize dry-run on a fixture tree
bash kernel_workflow/scripts/materialize_workspace.sh --src <src> --dst <dst> --link-aiter --shared-root <eval>/_shared
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e1ef5463560`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.