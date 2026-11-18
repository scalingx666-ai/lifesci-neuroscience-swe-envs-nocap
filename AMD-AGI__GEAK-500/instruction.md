# Issue

**Title:** fix(bench_e2e): keep GPU events in profile traces of spawned engines

## Description

## Summary

- On ROCm, a vLLM engine process spawned after its parent initialized the GPU inherits `ROCPROFILER_REGISTER_LIBRARY`, and its torch profiler records no `kernel` or `cuda_runtime` events. New `e2e_workflow/scripts/adapters/profile_env/sitecustomize.py` drops the variable at interpreter start-up, before torch loads the HIP runtime, then imports the next `sitecustomize` on `sys.path` so an overlay's own hook still runs (a second run in the same process chains nothing, so it cannot loop).
- `bench_e2e.sh` stages the shim on `PROFILE_PYTHONPATH` only for `PROFILE=1` runs and warns if it cannot find it; the `vllm` and `magpie` adapters put `PROFILE_PYTHONPATH` ahead of `OVERLAY_PYTHONPATH`. Benchmark runs are unchanged.

## Test plan

- New `e2e_workflow/scripts/tests/test_profile_env_shim.py` (added to the L0 pytest list): the shim drops the variable and loads a following overlay `sitecustomize` once; the vLLM adapter puts the shim ahead of the overlay on the server's `PYTHONPATH`. Both fail on `main` and pass with this change.
- The L0 pytest list and all L0 Node regressions locally: the same results as `main` plus the new tests (three pre-existing failures in this environment are unchanged on `main`).
- On a ROCm GPU with vLLM, a `PROFILE=1` trace has kernel and runtime events with the shim and none without it.

## Related issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d3ce2f2c7a0a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.