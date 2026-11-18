# Issue

**Title:** perf(preprocess): ccache + MAX_JOBS for aiter/CK kernel (re)compiles

## Description

. **Targeted at the v3.2.2 release line** (base `release/v3.2.2`, cut from tag `v3.2.2`) per the pinned Hyperloom pipeline.

## Problem
aiter/Composable-Kernel `.cu` kernels recompile on **every** candidate (Hyperloom forces `AITER_REBUILD=1` so edits recompile). The template-heavy CK build exceeds the 900s preprocess soft-cap **before any optimization round runs**, starving the optimization of the very kernel that most needs it.

**Data (same pinned pipeline, MI300X):**
| Kernel | type | preprocess |
|---|---|---|
| `dynamic_per_tensor_quant` (Llama-3.1-8B) | elementwise | baseline @ +472s, optimized fine ✅ |
| `paged_attention_ragged` (Llama-3.1-8B) | aiter/CK `.cu` | **soft-cap hit, no baseline after 34+ min** |
| `mha_batch_prefill` (Mixtral-8x7B) | aiter/CK `.cu` | **soft-cap hit, no baseline, correctness gate failed** |

## Fix
Inject two env-only, universally-safe accelerants in `_build_env` (the single place the harness/baseline subprocess env is assembled):
- **`MAX_JOBS`** = `cores*3/4` floor — parallelize the ninja/cpp_extension build (aiter further caps by `cores*0.8`/free-mem). Respects an explicit operator `MAX_JOBS`.
- **`CMAKE_{C,CXX,HIP}_COMPILER_LAUNCHER=ccache` + `CCACHE_*`** — cache unchanged CK translation units so a small kernel edit recompiles ~its diff. This is the correct ninja/cmake hook; a bare `hipcc` PATH shim is **not** honored by ninja's absolute compiler path (verified: 0 ccache hits via shim). Skipped entirely when `ccache` is absent.

## Safety / non-breaking
- No-ops for fast triton/elementwise kernels (nothing to parallelize/cache meaningfully).
- Never overrides operator-set values (`setdefault`).
- ccache block skipped when `ccache` not installed → zero behavior change on hosts without it.

## Validation
With `MAX_JOBS` active, the Llama `paged_attention` kernel — previously stuck >34 min in `harness-init` with no baseline — **cleared preprocess and optimized to 1.2647x verified (FULL_BENCHMARK)** across 5 rounds. (ccache further reduces per-candidate recompile where installed.)

## Test plan
- [ ] CI on release/v3.2.2
- [ ] Confirm fast-kernel runs unchanged (elementwise/triton baseline timing identical)
- [ ] Confirm no behavior change on hosts without ccache

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d44e1cb8a981`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.