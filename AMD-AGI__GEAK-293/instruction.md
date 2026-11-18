# Issue

**Title:** Merge v4_Researcher → GEAK_v4: Deep Research Agent (DRA) for kernel_workflow

## Description

Promotes the Deep Research Agent (DRA) work from `v4_Researcher` into `main` (originally staged via #291).

> **Rebased onto `main` (2026-08-04).** The original base `GEAK_v4` is now 0 ahead / 199 behind `main` (it was fully merged), so the PR base was retargeted to `main` and the branch rebased from 284-behind to 0-behind. Two real conflicts, both mechanical:
> - `kernel_workflow.js` — upstream added `...KB_INPUTS` to the `plan_round` inputs where DRA adds `DEEP_SEARCH_BRIEF`; **both kept**.
> - `interface/run_e2e.py` — upstream renamed `PERFSKILLS_CLAUDE_*` -> `GEAK_CLAUDE_*` (#346); **upstream names kept**, with only `WebSearch`/`WebFetch` added to `ALLOWED_TOOLS`.
>
> Net diff is unchanged in substance: 5 files, +567/-4, and the 4 deleted lines are only the lines DRA extends. `roles/researcher.md` is byte-identical to pre-rebase. Local L0 passes (183 pytest passed / 1 skipped, both OFF-identical node regressions, `run_e2e` dry-run mapping).

## What DRA does
An opt-in `Research` phase in `kernel_workflow` (gated by `dra_enabled`, default off). After profiling, DRA:
- extracts kernel facts + ranked bottleneck/design hypotheses,
- generates ranked research questions (bottleneck + design-space / alternative-implementation),
- researches them **in parallel** via native `WebSearch`/`WebFetch`,
- synthesizes a compact, ranked **portfolio of optimization directions** → `deep_search_brief.md` (full evidence in `deep_search.md`).

The brief is handed to the TechLead planner as **advisory suggestions**: the optimizer does its own profile/code analysis first, then decides which (if any) to adopt.

## Results (A/B: no-DRA vs DRA, budget=3)
| Kernel | no-DRA | DRA | Δ |
|---|---|---|---|
| KNN (HIP) | 9.25x | **11.70x** | **+2.45x (+27%)** |
| gemm_a16wfp4 (Triton) | 1.539x | 1.531x | ~tie |

On KNN, the DRA gain traces to adopted brief directions — warp-cooperative WarpSelect (wave64), `Template<K>` scratch-spill elimination into VGPRs, and wrapper/output-layout fixes.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5514f2049e2c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.