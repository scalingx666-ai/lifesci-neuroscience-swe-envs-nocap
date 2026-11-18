# Issue

**Title:** core: `maybe_script` / `maybe_compile` / `maybe_jit` for leaf kernels

## Description

## Summary
Addresses the design questions in #157: when to use `torch.compile` and when to use TorchScript, given that nitorch supports a wide range of torch versions. This PR is **stacked on #245**, so its base is `claude/perf/158-exp-backward` and the diff shows only the #157 commits.

New module `nitorch/core/jit_policy.py`, with three decorators for **leaf kernels**:

| decorator | torch < 2 | torch ≥ 2 |
|---|---|---|
| `maybe_script(fn)` | `torch.jit.script(fn)` | `fn` (TorchScript is deprecated) |
| `maybe_compile(fn)` | `fn` | `torch.compile(fn)` for large inputs |
| `maybe_jit(fn)` | `maybe_script` | `maybe_compile` |

`maybe_jit` is the one meant for general use.

### Design (answers to the questions in #157)
- **Version range.** `torch.compile` is only used when it exists, on torch ≥ 2. Older versions keep TorchScript, as before.
- **Nesting.** `torch.compile` cannot be nested, and it should not trace through opaque ops such as nitorch's C++ extension. So the rule is to decorate leaf kernels only: elementwise chains that call neither another decorated kernel nor the C++ code. A decorated kernel that needs another one calls its undecorated `_impl` instead. The public functions stay plain Python dispatchers.
- **TorchScript interaction.** Decorated kernels are called from Python, not from scripted code. The `_impl` kernels stay TorchScript compatible, so `maybe_script` can script them on torch < 2. I checked that every `_linalg_small` and `_jhj*` kernel scripts and matches eager.
- **Lazy compilation.** Nothing is compiled at import. Scripting or compiling happens at the first qualifying call.
  - In `auto` mode, `maybe_compile` compiles only when the largest tensor argument has at least `NI_COMPILE_MIN_NUMEL` (2²⁰) elements. Small calls (tests, 2D, coarse pyramid levels) stay eager and pay no compile time.
- **Fallback without hiding bugs.** If scripting, compiling, or running the fused kernel fails, the same call is retried in eager mode:
  - If eager succeeds, the fused kernel is disabled for good, with one `RuntimeWarning`. This covers a missing C++ compiler for inductor, a missing triton, an unscriptable function, and so on.
  - If eager fails too, the error is genuine. It propagates unchanged and the fused kernel stays enabled.

### TorchScript CPU fusion
TorchScript's CPU fuser (NNC) is off by default in torch. It needs LLVM, which some builds lack; the torch 2.15 pip wheel here fails with "LLVM Backend not found".

A build check such as `torch._C._llvm_enabled()` is a private API and does not guarantee that fusion works, so this PR uses a functional probe (`_probe_cpu_fusion`) instead:
- it looks up the private switches defensively;
- it scripts a tiny function with CPU fusion on and checks for a `TensorExprGroup` in the optimised graph;
- it checks the result against eager;
- it restores the previous setting whatever happens.

CPU fusion is a process-wide setting that also affects other TorchScript code, so it stays **opt-in** (`NI_TORCHSCRIPT_CPU_FUSION=1`). With the flag set, it is enabled only if the probe succeeds; otherwise it warns.

### Environment variables
| variable | values | default |
|---|---|---|
| `NI_TORCHSCRIPT` | `auto` / `0` / `1` | `auto`: script on torch < 2 |
| `NI_COMPILE` | `auto` / `0` / `1` | `auto`: compile on torch ≥ 2 for large inputs |
| `NI_COMPILE_MIN_NUMEL` | int | 2²⁰ |
| `NI_TORCHSCRIPT_CPU_FUSION` | `0` / `1` | `0` |

### Call sites
- `nitorch/core/_linalg_small.py`, the closed-form 2×2/3×3 helpers from #245: rewritten as TorchScript-compatible per-dimension kernels (`_det3_impl`, `_solve3_impl`, …) and decorated with `maybe_jit`. The public `small_*` functions dispatch on `D`.
- `nitorch/spatial/_svf.py`: `_jhj1/2/3` go from `@torch.jit.script` to `@maybe_jit`. Behaviour is unchanged on torch < 2, and they are compiled on torch ≥ 2.

## Effect
`exp_backward` at 192³ on CPU, torch 2.15, 4 threads, on a loaded machine:

| | eager | compiled (steady state) |
|---|---|---|
| with Hessian | 82 s | 66 s |
| gradient only | 47 s | 37.5 s |

- That is about 20% faster in steady state. The per-voxel J H Jᵀ product alone is about 13× faster.
- Compiled results are bitwise equal to eager, and none of the kernels fell back.
- The first call pays about 21 s of compilation. This is amortised over a registration but not over a single call, which is why `NI_COMPILE=0` exists.

## Tests
- `nitorch/tests/test_jit_policy.py`:
  - dispatch for each mode, torch version and input size;
  - compilation happens once and lazily;
  - fallback warns once and is not retried, for both compile-time and runtime failures;
  - genuine errors propagate without disabling compilation;
  - unscriptable functions fall back;
  - the CPU-fusion probe restores the setting, and CPU fusion is opt-in;
  - a real `torch.compile` run (slow test).
- Existing `test_linalg_small.py` and `test_svf_backward.py` pass with the decorated kernels.
- Full suite (TS backend, torch 2.15): 3393 passed, 111 skipped, 0 failed.
- **CI:** the workflow only runs on PRs to master, so this stacked PR gets no CI of its own. It is covered by the integration PR #251, which includes this branch.
  - The first #251 run failed on torch 1.13.1 in the tests only: `monkeypatch.setattr(torch, 'compile', …)` raised because `torch.compile` does not exist there.
  - Fixed in 5f85664b with `raising=False`. I reproduced the failure locally by deleting `torch.compile` and checked that the fix passes.
  - Everything else passed on 1.13.1, including the scripted `linalg.small_*` kernels.

Part of #157 and #154.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaUGFKHtAQeNPPDHTHh

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3fcb953c8852`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.