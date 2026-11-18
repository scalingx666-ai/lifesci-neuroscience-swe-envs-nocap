# Issue

**Title:** refactor(e2e): remove dead wall-clock note from build_prompt

## Description

Removes the advisory budget line from `build_prompt` — dead text, since the driver
  agent only invokes the Workflow tool once and never acts on it. Enforcement stays
  in the JS (`time_budget_s` → setTimeout); value still passed via `args.time_budget_s`.

  No behavior change. .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34d5bce2bae8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.