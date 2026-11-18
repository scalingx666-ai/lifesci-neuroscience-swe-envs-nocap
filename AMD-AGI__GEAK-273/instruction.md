# Issue

**Title:** fix(baseline): run .sh harnesses with bash, not python, in correctness gate

## Description

## Problem
`_benchmark_command` (preprocess_v3/baseline.py) always builds the harness argv as `[sys.executable, harness, flag]`, i.e. it assumes every harness is a Python file. When the harness is a shell script (e.g. a sanitized `.sh` wrapper that exports PYTHONPATH then `exec python <inner>`), it gets invoked as `python wrapper.sh` → Python tries to parse `#!/usr/bin/env bash` / `set -euo pipefail` → instant `SyntaxError` (rc=1, ~0.02s) → the correctness gate marks the kernel "broken" and skips it (micro=0.0 → REVERT), even though the harness runs perfectly under bash.

## Fix
Pick the interpreter by harness suffix: `.sh` → `bash`, otherwise `sys.executable`. Minimal, general, and unblocks any shell-based harness.

## Evidence
- Before: gate on a `.sh` wrapper fails rc=1 in 0.022s.
- After: same wrapper runs rc=0 in ~32s emitting `GEAK_RESULT_LATENCY_MS`.

## Test plan
- [x] `_benchmark_command(Path("x.sh"))` → `['bash','-lc','bash x.sh ...']`
- [x] `_benchmark_command(Path("x.py"))` → `['bash','-lc','python x.py ...']` (unchanged)
- [x] End-to-end `_run_benchmark_once` on a real `.sh` harness returns rc=0

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f798589ea9e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.