# Issue

**Title:** hybrid-6-cuda-sweep: CUDA parameter-sweep backend

## Description

## Scope

Part 7 of 7 (final) of the hybrid split series. **CUDA parameter-sweep backend** — 5 files, +4,333. Depends on #791 (unified CPU sweep, merged).

| Branch | Depends on | Status |
|---|---|---|
| #786–#788, #790, #791 | — | merged |
| #792 hybrid-5-demos | — | in review (this PR is stacked on it) |
| **#this hybrid-6-cuda-sweep** | 4 (and stacked on 5 for CI) | **this PR** |

**Known limitation:** sweep GPU kernels achieve ~30% of peak SM occupancy (register pressure in the fused state-update kernel); sequential-mode parity and correctness are verified, throughput optimization is future work.

## Verification

- Stacked on `hybrid-5-demos` so CI runs in parallel with #792's rebase; will retarget to master when #792 merges.
- GPU verification on the inslurm cluster g1 node (RTX A5000, driver 580.178.04) — results in the watchdog report.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c74d5a036b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.