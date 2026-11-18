# Issue

**Title:** fix(e2e): let torch.compile trace through the seam_trace marker

## Description

## Problem

vLLM calls a marked seam (for example `rocm_unquantized_gemm`) inside a `torch.compile(fullgraph=True)` model forward. The marker in [`seam_trace.py`](https://github.com/AMD-AGI/GEAK/blob/f189eff7/e2e_workflow/scripts/seam_trace.py#L70) runs `torch.cuda.is_current_stream_capturing()` on every call. That query returns a Python `bool`, which Dynamo cannot put in a graph, so tracing fails and the engine does not start.

## Fix

- `install()` resolves `torch.compiler.is_compiling` once through `_compile_probe()`, so the marker never imports torch while Dynamo traces it.
- `marked()` returns `original(*args, **kwargs)` when `is_compiling()` is true, before the capture query and the profiler calls.
- Where torch or `torch.compiler.is_compiling` is absent, the probe is a constant `False`, so earlier behaviour is unchanged.

## Tests

- `test_seam_trace_compiled.py` (new, needs torch, skipped otherwise): a real `torch.compile(fullgraph=True, backend="eager")` of a function that calls a marked seam; a variant with the check disabled that raises `torch._dynamo.exc.Unsupported`; an eager call that still enters the marker.
- `test_seam_trace_capture_guard.py`: while compiling, the capture query runs 0 times and no profiler or `record_function` is entered; a variant with the check disabled shows the query runs; torch without `compiler.is_compiling` counts as not compiling.
- `test_seam_trace_compiled.py` is added to the pytest list in `ci-l0-checks.yml`. That job installs no torch, so the real-compile cases skip there; the fake-torch cases in `test_seam_trace_capture_guard.py` run.

Before the fix, `test_the_marked_callable_compiles_with_fullgraph` and `test_neither_the_capture_query_nor_a_marker_runs` fail (2 failed, 17 passed across the two files). After it, those two files give 19 passed, and `e2e_workflow/scripts/tests` gives 1800 passed, 1 skipped. `ruff check` on the touched files reports the same 7 findings as before the change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e66a557e7813`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.