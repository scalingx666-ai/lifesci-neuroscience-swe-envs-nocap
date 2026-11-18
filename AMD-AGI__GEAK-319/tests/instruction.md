# Issue

**Title:** feat(eval): GEAK_VERIFY_IN_LOOP — full-set in-loop verified speedup, drop redundant post-round FULL_BENCHMARK

## Description

## What
`GEAK_VERIFY_IN_LOOP` (default-off): make the per-candidate **in-loop** benchmark the authoritative full-set verified signal, and **skip the redundant post-round FULL_BENCHMARK** (which currently times out via `GEAK_BENCH_TIMEOUT`).

## Why
Across the last 40h of CI, **0 kernels** ever produced a FULL_BENCHMARK-verified speedup — the post-round re-run times out and `select_best_verified` finds nothing, so only the quick `report_scan` survives. The two harness modes also disagreed (`--benchmark`=`_pick(25)` vs the "same full set" rule), so the optimization signal scored different shapes than verification.

## Changes
- `run/postprocess/evaluation.py`: when `GEAK_VERIFY_IN_LOOP=1`, keep the **clean-worktree CORRECTNESS** (the sole worktree-bypass guard, see `contract.py`), skip the post-round FULL_BENCHMARK timing, and adopt the in-loop full-set `verified_speedup` so `select_best_verified_round_evaluation` ranks it.
- `subagents/preprocess/harness-generator/SUBAGENT.yaml`: resolve the contradiction — `--benchmark` runs the **same full config set** as `--full-benchmark` (no `_pick(25)`).

Default-off ⇒ byte-identical. `py_compile` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aaa908f1f575`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.