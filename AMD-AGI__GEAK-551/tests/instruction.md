# Issue

**Title:** feat(e2e): allow SGLang as the R9700 E2E serving backend

## Description

## Summary

- Allow `backend=sglang` for R9700 E2E runs, next to `vllm`. The R9700 default stays `vllm`, R9600D stays vLLM-only, and any other backend (for example `atom`) still fails closed with a message naming the accepted backends. The R9700 condition sits beside main's GPU-family isolation (`GPU_FAMILY`), which this branch keeps.
- `interface/effective_config.py`: only `--cuda-graph-bs` and `--cuda-graph-bs-decode` take several values now. A scalar flag given a second value (for example `--ep-size 8 16`) raises `takes one value` instead of becoming a tuple that silently falls back to EP=1.
- `README.md` and `e2e_workflow/README.md` describe the R9700 backends. The README also says that R9700 + SGLang needs a supplied `IMAGE`: the default CI preset has no R9700 SGLang entry, so `ci/lib.sh` returns `E_IMAGE_UNAVAILABLE` without one.
- Scope: this branch no longer changes `scripts/adapters/sglang.sh`. The profiler-wait fix described in earlier revisions is already on `main`, so this PR does not claim it. Net diff against `main`: 7 files.

## Test plan

- `node e2e_workflow/scripts/test_rdna4_e2e_policy.js` and `node kernel_workflow/scripts/test_rdna4_policy.js`: pass on the merged tree.
- Node regression set from `ci-l0-checks.yml` (expert-skills OFF identity, script size, GPU-family table, smoke status, mode dispatch, pinned eval dir, AgentX declaration, time budget, tuning skillset, candidate floor, kernel canonicalization parity, speedup review): all pass.
- `bash -n` over `e2e_workflow/scripts` and `kernel_workflow/scripts`: clean.
- `pytest interface` in the run container (`pytest 9.1.1`): 1224 passed, 1 failed. The failure, `test_invoke_workflow_routes_to_the_runtime_only_with_ps_args`, also fails on `main` (the agent CLI is not logged in on the test host).
- Regression test for the parser: `test_a_scalar_flag_rejects_a_second_value` fails on the previous `effective_config.py` (`DID NOT RAISE`) and passes on this branch. The two multi-value tests pass on both.
- Not run here: GPU / L1 workflows.
- End to end: the run described in #546 (R9700 TP 1, `rocm/sgl-dev:v0.5.15.post1-ubuntu24.04-py3.14-rocm10.0.0`, Qwen3.5-9B BF16, concurrency 15, ISL/OSL 512/128) used the adapter change this PR no longer carries. `main`'s `sglang.sh` is what this branch uses.

## Related issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b22cf523be1e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.