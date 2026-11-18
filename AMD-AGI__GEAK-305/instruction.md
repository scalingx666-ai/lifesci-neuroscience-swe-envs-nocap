# Issue

**Title:** feat(e2e): forward orchestrator wall-clock budget to the workflow (time_budget_s)

## Description

## What
  Forward run_e2e's hard wall-clock limit (`PERFSKILLS_E2E_TIMEOUT_S`) to the JS
  workflow as a new `time_budget_s` arg, so GEAK self-paces and finishes
  Finalize/Report/Validate **before** the SIGKILL instead of being torn down
  mid-flight.

  ## Why
  `timeout_s` was only a hard SDK/CLI kill; the workflow never saw it. deep_mode's
  default 24h budget vastly exceeds a typical 12h kill → the run was SIGKILLed
  mid-wave and never reached Finalize/Validate. Default mode had no time awareness
  at all.

  ## Changes
  - **run_e2e.py**: `map_args` forwards `timeout_s → ps_args.time_budget_s`;
    `build_prompt` adds an advisory budget line.
  - **e2e_workflow.js**: `TIME_BUDGET_MS`/`TIME_BUDGET_EFFECTIVE_MS` (carve 8%/min-20m
    safety tail, single source); cap `FAST_BUDGET_MS` & `DEEP_HEAD_BUDGET_MS` to it;
    add a default-mode deadline (`TIME_DEADLINE_HIT`) wired into the head + Milestone
    loops.
  - **interface/run_e2e.md**: documents the mapping + off=byte-identical guarantee.

  ## Safety
  Opt-in. When `time_budget_s` is absent (direct, non-interface invocation) every
  budget branch short-circuits → behavior is byte-identical to before. Verified:
  `py_compile` clean; dry-run shows `time_budget_s` in args + budget note in prompt.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `169189d32d6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.