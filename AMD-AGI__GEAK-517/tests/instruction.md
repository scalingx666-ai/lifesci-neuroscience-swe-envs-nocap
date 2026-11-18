# Issue

**Title:** fix(profile/sglang): wait for every rank's trace to finish before returning

## Description

## Summary

`adapters/sglang.sh` `adapter_profile_window` returned as soon as a new `*.trace.json*` file appeared (+2 s). Torch creates that file when the export *starts*; `bench_e2e.sh` then GROUP-kills the server, so every rank's gzip was truncated — and since torch writes GPU kernel events last, the truncation removed exactly those. Downstream: `profile_topN.json` never produced, `kernel_journey.json` `"kernels": []`, the run continued on analytic estimates (#516).

The window now waits for **one complete (`gzip -t`) new trace per TP rank** (`TP`, overridable via `SGLANG_PROFILE_EXPECTED_RANKS`). The quiet deadline (`PROFILE_WINDOW_TIMEOUT`) restarts while any new trace is still growing; `SGLANG_PROFILE_FINALIZE_TIMEOUT` (default 900 s) bounds the whole wait; if nothing finishes, it sends `/stop_profile` once (num_steps not honored on some builds) and gives the export another quiet window. A partial capture is refused (`return 1`) and its files are renamed `*.PARTIAL_missing_ranks` so the parser never reads them as a whole capture — the contract the ATOM adapter already has. (A shared helper for the ATOM/sglang rank census would be a natural follow-up; kept out to keep this PR to one adapter.)

.

## Test plan

- `e2e_workflow/scripts/tests/test_sglang_adapter_profile.py` (new, GPU-free): a stub `curl` makes `/start_profile` write a truncated trace per rank and finish them 1 s later.
  - every rank finishes → returns 0 only once both traces are valid gzip containing the kernel event (fails on `main`: it returns while both are truncated);
  - one rank never finishes → non-zero, `finalized 1/2 expected rank traces`, no `*.trace.json.gz` left, both renamed `.PARTIAL_missing_ranks` (fails on `main`).
- With the L0 unit tests and the adjacent adapter/teardown tests (`test_run_e2e_recovery`, `test_workload_alignment`, `test_atom_adapter_lifecycle`, `test_bench_warm_server_lifecycle`, `test_bench_e2e_teardown_lookup`, `test_server_teardown`): 193 passed, 4 skipped. `ruff check` clean on the new test; `bash -n` on the adapter.
- Hardware (8× MI355X, `lmsysorg/sglang-rocm:v0.5.20-rocm720-mi35x-20260923`, GLM-5.2 MXFP4, TP4/EP4, under load): the patched window returned rc=0 after 293 s, once all 4 traces were complete gzip (84–90 MB each). The server log shows why the old wait cannot work at this size: `Stop profiling` 07:45:38 → `Profiling done` 07:47:05, an 87 s export. On `main` in the original run the same 4 traces were cut at 8–11 MB, all failing `gzip -t`.

## Not fixed here (separate finding)

On this image the complete traces still contain **no GPU `kernel` events** (`cpu_op` ~3.4 M, `user_annotation` ~1.7 M, `cuda_runtime` 1) — also for a short manual `/start_profile` + `/stop_profile` capture with `activities: ["CPU","GPU"]`. A standalone `torch.profiler` (CPU+CUDA) matmul in the same container does record `kernel` events, and the schedulers carry no `ROCPROFILER_*` variables (so not the #500 inheritance case). This PR is necessary for a usable sglang profile but not sufficient on this stack; I'm filing the GPU-events gap separately with the repro.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f372f99533ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.