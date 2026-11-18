# Issue

**Title:** Bench kernel candidates at the shapes the workload serves

## Description

## The defect

`op_bench.py` benched every candidate at one shape:

```python
M = max(buckets)   # "the DOMINANT (largest) m_bucket — the GPU-time mass"
```

Largest is not the mass. Mass is per-launch time × **launches**, and the analytic call model already sitting in `serving_weight_model.analytic_calls` counts `decode = OSL` passes against `prefill = CONC*ceil(ISL/chunk)`. Neither bucket dominates universally — prefill runs a few large passes, decode runs many small ones — so no single shape represents the mix, and the largest one is routinely the least-served.

`harness_lib.serving_weighted_speedup` has encoded the correct blend all along, but it has **no production Python caller**; it only runs if a role prompt is followed.

## Evidence

Corpus: `/shared_nfs/hyperloom-claw`, measured 19 Aug 2026.

| measurement | value |
|---|---|
| decode share of served forward passes | **94.1%**, identical in all 679 observations |
| served decode M (`est_shape`) | **64**, in all 993 observations |
| served prefill M | 8192 / 16384 / 7211 / 2048 / 1024 |
| `opbench_result.json` with no per-bucket timing | **122 of 123** |
| of the 19 recording their bench M, benched at the decode shape | **0** |
| tasks named `*decode*` benched at M=8192 | 3 |

The three: `aiter_a8w8_blockscale_ck_gemm_decode_task`, `decode_fp8_gemm_MT128x64_task`, `decode_fp8_gemm_MT32x32_task`.

## A/B replay over the same run logs

Replayed by calling the real `served_buckets`, over all 200 `kernels/*/meta.json`:

| | before | after |
|---|---|---|
| kernels benched at 1 shape | 60 | 0 |
| kernels swept over both served shapes | 0 | **60** |
| where the benched shape was the whole served mix | 0 of 60 | 60 of 60 |
| **median share of served passes the bench shape did not represent** | **94.1%** | 0% |

Old shape → shapes now swept:

| old | now swept | n |
|---|---|---|
| M=8192 | decode M=64, prefill M=8192 | 36 |
| M=16384 | decode M=64, prefill M=1024 | 6 |
| M=16384 | decode M=64, prefill M=16384 | 5 |
| M=1024 | decode M=64, prefill M=1024 | 4 |
| M=16384 | decode M=64, prefill M=8192 | 3 |
| *(6 more)* | decode M≈64, prefill = the old shape | 6 |

What those kernels scored under the single-shape bench:

| group | n | `==1.0` | `>1.05x` | no result |
|---|---|---|---|---|
| **would now sweep 2 buckets** | 54 | **47** | 1 | 6 |
| unchanged (0–1 served buckets) | 69 | 12 | 2 | 55 |

47 of 54 scored *exactly* 1.0 — no backend beat the baseline at a shape the vendor library is already tuned for.

The one kernel in the corpus benched at the decode shape (`grid=(64,1)`) is also the only large win: `kernel_paged_attention_2d`, **9.472x**, the corpus-highest Amdahl ceiling at **17.80%**.

## What this replay does and does not prove

It proves the **targeting** change exactly, because bench shape is a deterministic function of `meta`. It does **not** prove new kernel physics: the per-bucket timings do not exist in the logs (that is the defect), so re-measuring needs GPUs. No e2e number is claimed here.

## The change

- `harness_lib.served_buckets(meta)` — maps the serving model to the shapes to bench, snapping each phase to the nearest profiled `m_bucket`, honouring `served_regimes`, de-duplicating, and returning `[]` when there is no serving model.
- `bench_gemm` sweeps those buckets and `_merge_served` collapses the sweep into one served-weighted per-launch `ms`:

  `ms_served = Σ(ms_bucket × calls_bucket) / Σ(calls_bucket)`

Because the merged `ms` is what downstream reads, winner selection, `isolated_speedup` and the Amdahl ceiling all become served-weighted **with no further change**. `ms_by_bucket` publishes the per-shape numbers for audit. A candidate that wins at one served shape and breaks at another is not selectable.

Metas with no serving model, or a single served bucket, keep their previous single-shape behaviour.

## Tests

19 added. 840 pass; the 2 failures in `test_bench_e2e_teardown_lookup.py` are pre-existing on `main` (verified by stashing).

The regression test states the case the fix exists for: a candidate 5x faster at the prefill bucket and 2x slower at decode is a net **loss** once weighted, and is no longer selected.






---

# Second commit: never publish a speedup that was not measured

``. Same thesis as the shape fix — the published number must come from a real measurement of the real workload — applied to the other half of the problem.

## The defect

`op_bench` published `isolated_speedup: 0.0` whenever no backend produced a timing, which is the same value it publishes for a bake-off that *was* timed and found nothing faster. The gate could not tell a kernel it declined from one it never benched.

`bench_attn` takes that path unconditionally: one row, `available: True, correct: True, ms: None`, because attention backend choice is a server-level flag delegated to the Config Tuner. That delegation is fine. Publishing `0.0` for it is not.

## Evidence

All `opbench_result.json` under `/shared_nfs/hyperloom-claw`, sessions 14–19 Aug 2026. The `op_bench.py` staged in the session tree is byte-identical to `origin/main` (md5 `6ec52d11b75fc22bd4043a0e244411ac`), so this is the shipped code. 40 results carrying keys `op_bench` never writes (`bench_method`, `dominant_bucket`, `m1_bucket`) are hand-rolled harnesses that bypass it, and are separated out:

| produced by | op_kind | n | timed | isolated_speedup |
|---|---|---:|---:|---|
| `op_bench.py` | attn | **318** | **0** | `0.0` ×318 |
| `op_bench.py` | gemm | 87 | 69 | `0.0` ×21, `1.0` ×63, `1.0188` ×3 |
| hand-rolled bypass | attn | 14 | 14 | **`9.472` ×12**, `1.0` ×2 |
| hand-rolled bypass | moe | 23 | 0 | `1.6971` |
| hand-rolled bypass | fp8 gemm | 3 | 0 | `1.48` |

`op_bench` timed attention **0 times out of 318**, and `harness_suspect` was `false` on all 318 because nothing raised — the existing guard requires an exception, and this failure is silent.

Note the third row. The only real attention measurement in the campaign, **9.47×**, came from an agent that wrote its own bench keyed on `dominant_bucket` / `m1_bucket` — it hand-did what the first commit of this PR makes systematic, and found a 9.47× win `op_bench` could not see.

### Where the gains actually were

23 sessions scored *every* attention bake-off `0.0`. Eight still produced a positive e2e result, arriving through the e2e A/B path rather than the isolated gate:

| session | attn bake-offs, all `0.0` | e2e those attention kernels delivered |
|---|---:|---|
| gemma-4-26B-A4B-it/20260815T130915Z | 52 | +18.915%, +14.973%, +10.512% |
| Kimi-K3/20260816T122327Z | 34 | +11.710% |
| Llama-3.1-8B-Instruct/20260816T114410Z | 24 | +2.901% |
| gemma-4-26B-A4B-it/20260814T155153Z | 18 | +10.383% |
| Qwen3-14B-FP8/20260816T050457Z | 15 | +7.530%, +6.779%, +0.705% |
| GLM-5.2-MXFP4/20260814T163244Z | 14 | +29.994%, +2.818% |
| gemma-4-26B-A4B-it/20260816T112750Z | 14 | +14.040% |
| Qwen3-14B-FP8/20260814T163051Z | 2 | +14.924% |

110.40 pct-points of best-per-session e2e gain, from sessions where the isolated bench reported nothing was faster. Across the same window `micro_speedup` correlates with realised e2e gain at Pearson **r = +0.64**, Spearman **ρ = +0.71** (n=21): the micro number transfers when it exists, and for attention it never exists.

## The invariant

> `op_bench` must not publish an `isolated_speedup` it did not measure.

- No timing anywhere → `isolated_speedup: null`, `measured: false`.
- Timed, no correct backend → `0.0` stands. That is a real verdict.
- A row asserting `available` **and** `correct` with no `ms` contradicts itself → `harness_suspect`. A recorded skip (`available: False`) asserts nothing and stays out of the signal.

One rule over all op kinds, no attention special-case.

## A/B — every logged bake-off, replayed through the real decision path

The `results` list is what the backends actually produced on the GPU and is recorded verbatim in each `opbench_result.json`. Feeding it back through `main()` exercises the genuine winner/speedup/`harness_suspect` code in both versions, so this is a replay of the real predicate rather than a paraphrase of it.

| op_kind | n | control (`origin/main`) | this PR | rows changed |
|---|---:|---|---|---:|
| attn | 318 | `0.0` ×318, suspect 0 | `null` ×318, suspect 318 | **318** |
| gemm | 87 | `0.0` ×21, `1.0` ×63, `1.0188` ×3, suspect 18 | `null` ×18, `0.0` ×3, `1.0` ×63, `1.0188` ×3, suspect 18 | 18 |

**No genuinely measured row moves.** The 63 at `1.0`, the 3 at `1.0188` and the 3 timed-but-incorrect `0.0` all keep their verdict. Only never-timed rows change — 336 of 405.

## Tests

5 added (`TestUnmeasuredIsNotZero`), 845 pass. Two failures in `test_bench_e2e_teardown_lookup.py` are pre-existing on the base commit and unrelated.

## What this does not fix

Deliberately out of scope, each needing its own issue:

1. **`bench_attn` still does not time attention.** It now says so honestly instead of saying `0.0`. Timing the captured attention path at the served bucket is a larger change.
2. **`op_kind` routing.** `main()` routes on `op_kind == "gemm"`, so `moe` (23 results) and `fp8_a8w8_blockscale_gemm_bpreshuffle` (3) fall through to `bench_attn` and are never timed either. This PR makes that visible instead of silent; it does not reroute them.
3. **The journey records no kernel artifact.** All 13 integrated wins in the window carry `optimized_files: []`, `patch_path: null`, `target_file: null`, while authored kernels demonstrably exist on disk. That is `interface/run_e2e.py`, a different subsystem.
4. **Profile capture lands in prefill.** 40 re-captures across 22 of 29 sessions (76%), every one succeeding and re-run only because the window missed decode. That is `bench_e2e.sh`.


---

## A/B: the bench shape actually changes

Over the 37 `kernels/*/meta.json` written since 13 Aug in `/shared_nfs/hyperloom-claw`, calling the shipped `served_buckets` predicate rather than a paraphrase of it. **8 of 9 GEMM metas change bench shape.**

| task | `main` M | with this PR |
|---|---:|---|
| `aiter_gemm_a16w16_dense_bf16_decode_task` | 8192 | **64, 8192** |
| `aiter_gemm_a16w16_dense_task` | 8192 | 64, 8192 |
| `dense_fp8_blockscale_gemm_task` | 8192 | 64, 8192 |
| `dense_bf16_gemm_bundle_task` | **65536** | 64, 65536 |
| `Cijk_Alik_Bljk_..._UserArgs_MT128x` | 8192 | 64, 8192 |
| `Cijk_Alik_Bljk_..._UserArgs_MT256x` | **16384** | 64, 8192 |
| `Cijk_MT128x64x128_gate_up_proj_task` | 8192 | 64, 8192 |
| `dense_gemm_family_hipblaslt_Cijk_MT16x16x1024_task` | 8192 | 64, 8192 |
| `Cijk_hipBLASLt_dense_GEMM_cluster_task` | 8192 | 8192 — no serving model, unchanged |

A task named `..._decode_task` was benched at M=8192. Two tasks were benched at 16384 and 65536, shapes that are not served buckets at all.

### Scope this does *not* cover

- **No GPU re-measurement.** The shapes above are recomputed from logged metas; no workload was re-run. Kernel timings at the new shapes are not measured here.
- **Single-bucket path:** 0 of the 9 GEMM metas is single-regime, so that path is a **precondition**, not a present-day change. It is exercised by the 14 single-regime metas in the sample (13 `['decode']`, 1 `['prefill']`), which are attention tasks — and attention never produces a timing at all today (#418).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73937c840aef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.