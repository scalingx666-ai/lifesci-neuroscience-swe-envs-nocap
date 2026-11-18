# Issue

**Title:** feat(fastlog): add activation_postfunc parity with slow path

## Description

## Summary
- Adds `activation_postfunc` and `save_raw_activation` to fastlog (`record()`, `Recorder`, `RecordingOptions`) so callers can transform retained activations the same way slow path does.
- Stores transformed payloads on parallel `ActivationRecord` fields (`transformed_ram_payload` / `transformed_disk_payload`) without touching `LayerPassLog`.
- Persists transformed copies as `kind=\"transformed_activation\"` blobs in the disk bundle and propagates the new metadata through load/recover.
- Surfaces `activation_postfunc_repr` on `Recording` and in `metadata.json` for in-memory and on-disk introspection.
- Behavior is byte-identical for callers that do not pass the new arguments.

## References
- Authoritative research: `.project-context/research/fastlog_postfunc_parity_2026-04-27.md`.
- Slow-path counterpart: PR #166 (commit 59ae72c).

## New surface
- `tl.fastlog.record(..., activation_postfunc=None, save_raw_activation=True)`.
- `tl.fastlog.Recorder(..., activation_postfunc=None, save_raw_activation=True)`.
- `tl.fastlog.RecordingOptions(activation_postfunc=None, save_raw_activation=True)`.
- New `ActivationRecord.transformed_ram_payload` / `transformed_disk_payload` (default `None`).
- Disk bundles gain a `transformed_activation` manifest kind. `metadata.json` carries `activation_postfunc_repr` and `save_raw_activation`.
- `Recording.activation_postfunc_repr` exposes the callable repr.

## Intentional divergences from slow path (per research)
- Fastlog uses parallel `transformed_*_payload` fields on `ActivationRecord` rather than reusing `LayerPassLog.transformed_activation`.
- The postfunc runs inside `_storage_resolver._resolve_storage()`, after `safe_copy` and `_apply_payload_transforms`, never inside the predicate evaluator.
- Predicates continue to see raw `RecordContext` metadata.
- `dry_run()` never invokes the postfunc (it suppresses payload capture entirely via `no_tensor_capture`).
- No `gradient_postfunc` parameter; that ships with fastlog gradient capture.
- Train-mode validation enforces graph-connected, gradient-capable transformed RAM payloads only; disk copies stay detached inspection copies.

## Errors and storage abort
Postfunc failures are wrapped in `TorchLensPostfuncError` with `label`, `kind`, `func_name`, `shape`, `dtype`, `storage_target`, and `keep_grad` context, and bypass the predicate-failure aggregation so the pass fails and the disk writer aborts cleanly. `TrainingModeConfigError` from train-mode validation propagates the same way.

## Test plan
- [x] `ruff format .`
- [x] `ruff check . --fix`
- [x] `mypy torchlens/`
- [x] `pytest tests/ -m smoke -x --tb=short`
- [x] `pytest tests/test_fastlog_postfunc_parity.py -v`
- [x] `pytest tests/test_fastlog/ -v`
- [x] `pytest tests/ -m \"not slow\" -x --tb=short`

## Tests
Added `tests/test_fastlog_postfunc_parity.py` with 14 behavioral cases covering: raw + transformed RAM payloads, `save_raw_activation=False` opt-out, no-postfunc default, disk-only transformed blobs (including manifest counts), RAM+disk mirror, train-mode well-behaved + detaching + integer postfunc cases, source events, predicate-postfunc invocation count, dry-run isolation, error wrapping, repr exposure on RAM and disk, and disk load/recover roundtrip.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9c5a1a5ff74`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.