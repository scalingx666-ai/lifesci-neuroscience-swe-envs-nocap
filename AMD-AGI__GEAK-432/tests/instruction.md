# Issue

**Title:** Fix capture storage reclaim

## Description

## Summary
: process-local `capture.pid-*` directories each retaining a full `reference_io.pt` were not reclaimed after selection/finalize, which could blow ephemeral disk (~128Gi) under multi-rank / retry capture.

This PR:
- Promotes **one** authoritative `meta.json` + `reference_io.pt` to the task root, then deletes process-local `capture.pid-*` dirs (`promote_and_reclaim` / selection `--task-dir`).
- Adds capture storage bounds (`CAPTURE_BYTE_BUDGET`, `CAPTURE_CASE_BYTE_LIMIT`, `CAPTURE_PERSIST_POLICY=share_large`) and finalize-time `--reclaim-workspace`.
- Injects those bounds into extraction `EXTRA_ENV` from `e2e_workflow.js`, and reclaims leftover captures before Finalize (kept across merge with `main`, alongside `TIME_FINAL_DEADLINE_HIT`).

## Test plan

### CI
```bash
python3 -m pytest -q \
  e2e_workflow/scripts/tests/test_capture_shapes.py \
  e2e_workflow/scripts/tests/test_kernel_selection.py
```
**Result (2026-08-26, tip after merge with `main`):** `134 passed, 51 subtests passed in 1.13s`

These L0 suites cover #429 unit behavior (promote/reclaim, budget skip, `share_large`, selection reclaim). Please also let GitHub Actions L0 re-run on the PR.

### Offline deep tests — conclusions (issue-fix evidence)
**69/69 PASS.** The fix is demonstrated by behavior, not only by green status:

- Multi-rank / retry amplification ends with **exactly one** authoritative root oracle; process-local `capture.pid-*` dirs are **gone**.
- Selection and CLI reclaim paths remove capture dirs and report **positive `bytes_reclaimed`**; workspace size shrinks after reclaim (example: ~18.9MB → ~2.1MB).
- `share_large` writes a complete oracle that is **smaller than `full`** (example: 48.4MiB → 16.4MiB) while still capturing the same case count, with a shared tensor pool.
- Simulated optimize under the historical 128Gi risk: naive multi-copy retention would reach **~97GiB**; after reclaim the workspace stays at **~5.7GiB** with **~40GiB reclaimed**; symlink engineer rounds add **no extra oracle copies**.
- Real claw MoE / attn / decode tasks keep a **single** oracle copy under the fixed reclaim contract.

### Hyperloom E2E — conclusions (issue-fix evidence)
Real KERNEL-phase run on this fix branch (Qwen3-14B-FP8 / sglang / MI355X), with continuous #429 monitoring during extract/capture:

- Workspace stayed **≤ ~65MiB** throughout — **no** ~128Gi ephemeral blowup.
- At most **one** `capture.pid-*` dir at a time; **zero** ticks with multiple captures under the same task.
- **Zero** capture / `reference_io` artifacts landing outside the session GEAK worktree; `CAPTURE_OUT` stayed under the expected task path.
- E2E therefore proves **no unbounded multi-copy / path hygiene**; the full **promote → reclaim full oracles** path is covered by offline + CI above.

## How to review
- `e2e_workflow/scripts/capture_shapes.py` — budgets, `share_large`, `promote_and_reclaim`, `--reclaim-workspace`
- `e2e_workflow/scripts/kernel_selection.py` — task-dir promote/reclaim after selection
- `e2e_workflow/e2e_workflow.js` — `CAPTURE_STORAGE_ENV` injection + Finalize reclaim (merged with `main` time-budget gate)
- Unit tests in `test_capture_shapes.py` / `test_kernel_selection.py` marked for issue #429

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8e50e08808c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.