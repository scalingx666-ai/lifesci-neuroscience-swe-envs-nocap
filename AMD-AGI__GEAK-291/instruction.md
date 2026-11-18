# Issue

**Title:** feat(dra): Deep Research Agent (DRA) for kernel_workflow

## Description

## What this adds
A v4-native **Deep Research Agent (DRA)** — an opt-in `Research` phase in `kernel_workflow` (gated by `dra_enabled`, default off).

## What DRA does
After profiling, DRA grounds the optimization in external + code evidence:
- extracts kernel facts and ranked bottleneck/design hypotheses,
- generates ranked research questions spanning **bottleneck** and **design-space / alternative-implementation** angles,
- researches them **in parallel** via native `WebSearch`/`WebFetch`,
- synthesizes a compact, ranked **portfolio of optimization directions** → `deep_search_brief.md` (full evidence in `deep_search.md`).

The brief is handed to the TechLead planner as **advisory suggestions**: the optimizer does its own profile/code analysis first, then decides which (if any) to adopt — never a script it must follow.

## Results (A/B: no-DRA vs DRA, budget=3)
| Kernel | no-DRA | DRA | Δ |
|---|---|---|---|
| KNN (HIP) | 9.25x | **11.70x** | **+2.45x (+27%)** |
| gemm_a16wfp4 (Triton) | 1.539x | 1.531x | ~tie |

On KNN, the DRA gain traces directly to adopted brief directions — warp-cooperative WarpSelect (wave64), `Template<K>` scratch-spill elimination into VGPRs, and wrapper/output-layout fixes.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04e6790c967b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.