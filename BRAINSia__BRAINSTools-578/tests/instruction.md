# Issue

**Title:** COMP: Propagate ccache launcher to all EPs; report CI hit rate

## Description

## Summary

- **`Common.cmake`** — add `CMAKE_C_COMPILER_LAUNCHER` and `CMAKE_CXX_COMPILER_LAUNCHER` to the `mark_as_superbuild` `ALL_PROJECTS` list so every ExternalProject (ITK, VTK, TBB, ANTs, SlicerExecutionModel, zlib, DCMTK, teem) routes through the same ccache hash store as the Phase II inner build.
- **`.github/workflows/build.yml`** — parse `ccache --print-stats` after the SuperBuild, compute `(direct_hit + preprocessed_hit) / (hits + misses)`, and emit a markdown table to `$GITHUB_STEP_SUMMARY` plus a `::notice` annotation so the hit rate is visible on the PR Checks tab without opening logs. Includes a legacy `--show-stats` fallback for older ccache.

## Motivation

Previously only Phase II (~10% of total object-file volume) benefited from ccache; Phase I external projects recompiled from scratch on every CI run regardless of cache state. Wiring the launcher variables through `mark_as_superbuild ALL_PROJECTS` reuses the existing Slicer `ExternalProjectDependency.cmake` propagation machinery — no per-EP plumbing needed.

## Test plan

- [ ] CI green on this branch
- [ ] First run populates the cache; verify hit rate reported in the job summary
- [ ] Second run (no source changes) shows a substantially higher hit rate in the \`Report ccache hit rate\` step
- [ ] Legacy \`--show-stats\` fallback path exercised on any runner with an older ccache

## AI disclosure

This change was drafted with Claude Code (Opus 4.6) assistance: identifying that top-level launcher vars were not propagated to EPs, locating the \`mark_as_superbuild ALL_PROJECTS\` mechanism in \`Common.cmake\`, and writing the \`ccache --print-stats\` parser. The author reviewed every line, verified the propagation path through Slicer's \`ExternalProjectDependency.cmake\`, and is accountable for the code. Per BRAINSTools policy this PR is opened as a **Draft** until CI passes and local verification is complete.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68ecdd6d0732`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.