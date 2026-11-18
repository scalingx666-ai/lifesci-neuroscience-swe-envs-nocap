# Issue

**Title:** hybrid-5-demos: hybrid simulation notebooks + KIonEx tutorial

## Description

## Scope

Part 6 of 7 of the hybrid split series. **Hybrid simulation demo notebooks** — 9 notebooks (+5,797 −844), including the KIonEx tutorial. No production code: notebooks only, all file-disjoint from the other PRs in the series.

| Branch | Depends on | Status |
|---|---|---|
| #786–#788, #790 | — | merged |
| **#this hybrid-5-demos** | — (independent of 4) | **this PR** |
| hybrid-6-cuda-sweep | 4 | last |

## Verification

- Rebased onto master post-#790.
- All 9 notebooks re-executed top-to-bottom on the inslurm cluster (executed outputs in the branch are from those clean runs).
- inslurm re-verification of the rebased branch running (hs-demos2).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b7009cd8356`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.