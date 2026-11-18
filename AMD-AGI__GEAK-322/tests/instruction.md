# Issue

**Title:** feat(profile): add metrix as a fallback profiler in profile_kernel.sh

## Description

## What
  Append `metrix` to the default `PROFILER_PRIORITY` (last, after `rocprof`) and wire a generic,
  env-driven handler for it in `kernel_workflow/scripts/profile_kernel.sh`.

  ## Why
  Before this, `metrix` could be added to the priority list but the `case "$PROFILER"` had no matching
  branch — on a box where only `metrix` is available it would be selected yet **silently do nothing**
  (degrade to benchmark-only). This wires it up so it actually runs.

  ## How (general, no hardcode, minimal)
  - Reuses the `rocprofv3` pattern: run, then harvest every `*.csv/*.json/*.txt` produced into the report.
  - **Zero hardcoded flags**: `metrix $METRIX_ARGS bash -c "$CMD"`, `METRIX_ARGS` defaults to empty; the
    output dir is *hinted* via the `METRIX_OUTPUT_DIR` env var (ignored if metrix doesn't use it). No
    assumption about metrix's CLI shape.
  - Failures go through the existing `emit_profiler_failure` self-heal path → tells the engineer to set
    `METRIX_ARGS="..."` per `metrix --help` for the local toolchain.
  - One file, +23/−1; all existing profilers untouched.

  ## Note
  If metrix's native invocation is known (e.g. `metrix profile -o dir -- cmd`), set it once via
  `METRIX_ARGS` — no script change needed; or we can adjust the default in a follow-up.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `137724d5ca04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.