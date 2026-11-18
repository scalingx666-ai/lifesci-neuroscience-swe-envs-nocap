# Issue

**Title:** feat(robustness): PR4 opaque-wrapper guards + LIMITATIONS.md + CI matrix

## Description

## Summary

Final wave of the robustness sprint. Closes the "silent-empty-log on opaque wrappers" hole, ships a user-facing limitations doc, and wires in a lean torch-version CI matrix.

### Opaque-wrapper guards
New `_reject_opaque_wrappers(model)` in `user_funcs.py`, called immediately before `_unwrap_data_parallel` at every log entry point. Raises `RuntimeError` with a pointer to `docs/LIMITATIONS.md` for:
- **`torch.compile`'d models** (`OptimizedModule`) — dynamo replaces the forward with a compiled graph; our Python wrappers are optimized away or bypassed.
- **`torch.jit.ScriptModule`** (script + trace) — the forward runs on the TorchScript interpreter; wrappers never fire.
- **`torch.export.ExportedProgram`** — a serialised IR, not a callable `nn.Module`.

Each error message tells the user to call `log_forward_pass` on the original un-wrapped model.

### docs/LIMITATIONS.md
Canonical one-page matrix + per-context explanation covering **every** limitation surfaced by the full robustness sprint (PRs 1-4):
- compile / jit / export / FSDP / meta / sparse / SymInt / quantized / vmap / multiprocess / nested re-entry
- Partial-support contexts with documented caveats (tensor subclasses, very deep hierarchies, hooks, bfloat16 tolerance, loop-detection false positives)
- "Reporting a new failure" instructions

### README pointer
A "Known limitations / unsupported contexts" section right before "Planned Features" links to the doc with a one-line summary so users can find it without reading source.

### CI torch-version matrix
`.github/workflows/tests.yml` runs smoke tests on:
- python 3.10 + torch 2.4.* (declared floor)
- python 3.11 + torch 2.7.*

`fail-fast: false` so both rows report independently. Smoke-only + two entries keeps CI minutes under control while still catching regressions at both ends of the support window.

### Tests (`tests/test_robustness_pr4.py`, 11 cases)
- `torch.compile`'d model raises; logging un-compiled original still works
- `torch.jit.script` and `torch.jit.trace` both raise with "ScriptModule"
- Logging the un-scripted original still works
- `torch.export.ExportedProgram` fails loudly at entry
- `_reject_opaque_wrappers` is a no-op on a bare `nn.Module`
- Helper raises directly on `ScriptModule`
- `docs/LIMITATIONS.md` exists and is substantive
- README links to the doc
- **Doc-accuracy staleness guard**: every context with a runtime guard is mentioned in the doc (catches future drift)

### Verification
- `pytest tests/ -m smoke` — 35/35 ✅ (up from 32 on main; +3 from PR 4)
- `pytest` targeted regression + PR 4 — 470/470 ✅ (3m47s)
- `ruff check .` ✅ / `ruff format` ✅
- `mypy torchlens/` — 67 source files clean ✅

## Test plan
- [x] `torch.compile`'d model raises with "torch.compile" message
- [x] `torch.jit.script`/`trace` raise with "ScriptModule" message
- [x] `torch.export.ExportedProgram` raises
- [x] Un-wrapped original still works after wrapping
- [x] LIMITATIONS doc exists, linked from README, covers every guard
- [x] CI matrix defined for torch 2.4 and 2.7

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ff5e1dc2bab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.