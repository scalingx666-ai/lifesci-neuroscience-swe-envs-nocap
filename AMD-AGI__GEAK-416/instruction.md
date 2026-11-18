# Issue

**Title:** Fix/389 Harness baseline/opt comparison direction and timeout

## Description

Fix issue #389 

## Bug 1 — the isolated speedup could point the wrong way

The isolated unittest timed the candidate against `baseline_src/`, a second copy of the
source *inside* the task dir, selected by a `meta.baseline_callable` string that the
generated harness bound by hand. Both trees held byte-identical, identically-named code,
so "which one is the baseline" was a coin flip — and it failed **silently**: both legs are
correct implementations, so correctness still passed and only the ratio inverted. A real
1.055x candidate was reported as 0.96x and rejected. The same hole let `mode=author` time
optimized-HIP against its own naive-HIP seed: 15.7x isolated, ~0% e2e.

Both legs now run the **same** `leg_runner.py` over the **same** `cases.py`, differing only
in the overlay on `PYTHONPATH`:

| leg | overlay | contents |
|---|---|---|
| baseline | `<task>/baseline_overlay` | frozen `CURRENT_OVERLAY` = install + every already-accepted kernel (identical to the e2e gate's ref leg) |
| candidate | `<task>/_cand_overlay` | that same stack + exactly one entry built from `kernel_src/` (`meta.candidate_bind`) |

Direction becomes a property of the environment rather than of a name, so
`speedup = baseline_ms / optimized_ms` cannot invert. `assert_legs_differ` refuses to measure
until both legs provably resolve `target_callable` to different code *and* the baseline
resolves outside the task dir.

This also closes the ~8% loader gap from comparing a from-file loader against the installed
package — both legs now import through the identical mechanism.

Two consequences worth calling out:
- The extractor finally receives `CURRENT_OVERLAY` (every other role already did), so
  isolated speedup and `e2e_delta_pct` share a denominator and the Amdahl cross-check means
  something.
- Two accepted kernels in the same module now **compound** instead of the second silently
  reverting the first, because `kernel_src/` starts from the module as the current stack
  resolves it.

## Bug 2 — startup budget graded by purpose, not by evidence

Shape capture for the MiniMax-M3 MoE kernel died at `Server not healthy within 360s`, so the
most valuable editable target in the run was never authored. `bench_e2e.sh` graded its
`/health` budget by "is an overlay set" (72 × 5s = 360s) — a budget that exists to reject a
**wedged candidate** overlay. Shape capture sets `OVERLAY_PYTHONPATH` too, so a legitimate
slow TP4 cold start inherited a fail-fast deadline.

Raising the constant per purpose (capture → 1800s) would still be a guess per model, and
would still treat *slow* as a proxy for *wedged*. Wedged shows up as **silence**, not as
elapsed time. So judge on that:

- Keep waiting while the server log keeps growing; declare death only after
  `STALL_WINDOW_SEC` (600) with no new bytes. Both backends print continuously through dist
  init, shard load and graph capture, so no-new-bytes *is* wedged. This rejects a wedged
  candidate **sooner** than the old 360s while letting a legitimately slow cold start run as
  long as it makes progress.
- The absolute ceiling is a single 7200s backstop, overridable via
  `SERVER_STARTUP_TIMEOUT_SEC` and named in the failure message. It is a backstop against a
  server that spins printing forever, not a prediction — the progress wait is what decides
  liveness.
- Always write `OUT_DIR/server_start.json` (`status`, `reason`, `phase_hint`, `wait_sec`,
  `ceiling_sec`, …), so a failed cold start is a readable reason downstream instead of an
  empty task dir that reads as "authored and found no gain". Classification
  (`engine_core_timeout`, `dist_init_fail`, `oom`, `died_early`, `stalled`) is preserved for
  the caller to act on.
- No startup retry: #389 does not ask for it, and the misclassification it would paper over
  is exactly what the stall window fixes. OOM in particular must not be retried at a lower
  `MEM_FRACTION` — "this candidate does not fit" is a result.

`OVERLAY_KIND` / `CAPTURE_HEALTH_TRIES` / `OVERLAY_HEALTH_TRIES` no longer select a budget;
`OVERLAY_KIND` survives as a provenance label. That incidentally fixes callers that never set
it — `director.md`'s final validation leg was silently getting the 360s fail-fast budget.

## Unit tests

- `test_leg_runner.py` (new, 423 lines) — the four `leg_runner` modes against a stub task dir.
- `test_harness_lib.py` two-leg section — `_run_leg` `PYTHONPATH` ordering,
  `build_candidate_overlay`, and both of `assert_legs_differ`'s refusals.
- `test_leg_runner.py` is added to the explicit pytest list in `ci-l0-checks.yml`; that list
  is what decides whether a test file ever runs.

## e2e validation on real hardware

Both fixes have since driven a full multi-model e2e batch on **gfx950**, across both vLLM and
sglang — 17 model × backend workflows run to completion.

### Bug 2 — startup

427 `server_start.json` records were written (378 `ok`, 49 `failed`):

| evidence | result |
|---|---|
| successful cold starts with `wait_sec > 360` | **50** — every one would have been killed by the old fail-fast budget |
| slowest successful start | **1738s** (MiniMax-M3-MXFP8, sglang); also 1391s same model, 1284s DeepSeek-V4-Pro |
| the #389 repro | MiniMax-M3 shape capture now completes instead of dying at 360s |
| stall window firing | 1 × `reason=stalled` at **155s** on a candidate overlay — wedged rejected *sooner* than the old 360s |
| `oom` | 1, not retried, as designed |
| `died_early` | 47, each carrying a `phase_hint` line lifted from the server log |

### Bug 1 — leg direction

The two-leg path is what actually ran: `baseline_overlay` + `_cand_overlay` are present across
the batch and **zero** `baseline_src/` directories remain. `leg_runner.py` was staged into 196
task dirs and `--mode oracle` was invoked 843 times. 353 measurement records carry real
`baseline_ms` / `optimized_ms` pairs, so `measure_legs` timing and the oracle `.pt` roundtrip
are both exercised (including a 1.7 GB `reference_io.pt` replayed for MiniMax-M3).

The direct evidence that direction is now sound is the Amdahl cross-check — every accepted
kernel's isolated speedup and its measured e2e delta agree in sign and rough magnitude. The
pathology this PR fixes (15.7x isolated against ~0% e2e) does not appear anywhere in the batch:

| model | kernel | isolated | e2e Δ% |
|---|---|---|---|
| Qwen3.5-27B-FP8 | `kernel_gemm_xdl_cshuffle_v3` (dense fp8 a8w8) | 3.17x | +16.14 |
| Qwen3-14B-FP8 | `dense_fp8_a8w8_blockscale_gemm` | 2.34x | +104.61 |
| Qwen3-14B-FP8 | `fp8_a8w8_blockscale_bpreshuffle_GEMM` (qkv/o) | 1.61x | +13.88 |
| DeepSeek-V4-Flash-0731 | `matmul_ogs_mxfp4_grouped_fused_moe` | 1.065x | +3.61 |

### End-to-end throughput

Workflows that reached a validated win with output parity:

| model | backend | baseline tok/s | final tok/s | speedup | parity |
|---|---|---|---|---|---|
| DeepSeek-V4-Pro | vllm | 1295.9 | 1607.3 | **1.260x** | pass |
| Qwen3-14B-FP8 | sglang | 1667.5 | 1719.5 | **1.175x** | pass |


The remaining workflows completed as `validated_no_win` — the harness ran, measured, and
correctly declined to claim a gain, which is the outcome this PR is meant to make trustworthy.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `598183f3dc0f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.