# Issue

**Title:** fix(vllm): run shape capture and read the server identity on vLLM 0.27

## Description

## Problem

Two GEAK steps do not work on vLLM 0.27 (seen on a Radeon AI PRO R9600D, Qwen3.5-9B):

1. Shape capture: vLLM compiles the model forward with `torch.compile(fullgraph=True)`. The capture hook (`capture_shapes._wrapper`) calls `torch.*` ops that Dynamo cannot trace (`Unsupported: torch.* op returned non-Tensor`), so the engine fails to start under the hook and GEAK has no shapes to tune.
2. Server identity: the baseline-alignment check recognises SGLang `ServerArgs` and ATOM `Engine kwargs` only, so every vLLM run reads `unverified`.

## Change

Two commits:

1. `fix(capture)`: `install()` resolves `torch.compiler.is_compiling` once, and the wrapper calls the original callable while Dynamo is tracing, so the wrapper itself never imports torch. Eager calls are still recorded.
2. `fix(identity)`: `_read_server_identity_evidence` reads vLLM's one-line `non-default args: {...}` record. Each top-level item is evaluated on its own, and an identity field whose value is not a literal (for example `CompilationConfig(...)`) is listed under `unparsed`, so a version-drifted log reads as unverified rather than as a value. `host` and `port` are left out. `model` and `tokenizer` are compared as logged, the same rule SGLang's `model_path` follows.

## Tests

- `test_capture_shapes_compiled.py` (PyTorch 2.12, Python 3.14): the `fullgraph` case fails against `main`'s `capture_shapes.py` with Dynamo's `Unsupported` error and passes here.
- `test_run_e2e_alignment.py` adds the vLLM record, the mismatch against the orchestrator log, the unrecognised-log message, and config objects landing in `unparsed`.
- `interface/test_run_e2e_alignment.py` and `e2e_workflow/scripts/tests`: 1822 passed, 1 skipped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a522a3ae586`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.