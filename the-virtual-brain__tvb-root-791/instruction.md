# Issue

**Title:** hybrid-4-sweep-cpu: unified CPU parameter sweep (prange kernel + sweep API)

## Description

## Scope

Part 5 of 7 of the hybrid split series. **Unified CPU parameter sweep**: prange sweep kernel + sweep API (`nb_hybrid_sweep_cpu.py`, `nb-hybrid-sweep-cpu.py.mako`) and its test suite (sweep API, prange, sweep-contract regressions).

| Branch | Depends on | Status |
|---|---|---|
| #786–#788 (support, framework, models) | — | merged |
| #790 hybrid-3-backend | 786–788 | merged |
| **#this hybrid-4-sweep-cpu** | 3 | **this PR** |
| hybrid-5-demos | — | parallel PR |
| hybrid-6-cuda-sweep | 4 | rebases after merge |

## Verification

- Rebased onto master post-#790; only the two sweep commits replayed (backend commits already merged via #790).
- inslurm cluster verification: whole vep4 node (96 cores), pytest-xdist `-n 96`, full `tvb/tests/library` — results in checks/watchdog report (prior standalone verification: 573 passed / 11 skipped on the pre-rebase stack).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0356155dcd9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.