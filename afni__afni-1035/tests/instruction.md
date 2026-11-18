# Issue

**Title:** 1dXmatTool fixes

## Description

## Summary

Update `1dXmatTool` and its shared Xmat helpers with design inspection, selection, comparison, TR queries, and manifest-export improvements extracted from `MakeItSo`.

Improve diagnostics for censored designs:
- Distinguish fully lost, zero, and cross-run IM support.
- Report support-row and peak-retention fractions and per-run IM counts.
- Add opt-in `-warn_support_frac` warnings without changing validation outcomes.
- Preserve retained-row counts when run extraction fails.
- Summarize report failures on stderr and clarify event-table mismatches.
- Suppress timeline-dependent diagnostics when required metadata is missing. Add `-force_inferred_metadata` to inspect explicitly labeled reader assumptions without bypassing extraction or reference checks.

Update command help, documentation, regression tests, and the installation-component entry. Preserve existing exit-code semantics and selector-only stdout for `-show_trs`.

## Validation

- Make build of `1dXmatTool`: passed.
- Extraction/LSS regression suite: passed; maximum synthetic beta error `7.09e-07`.
- Feature and TR-selector suites: passed.
- New warning and missing-metadata regression checks: passed.
- `git diff --check`: passed.
- CMake configuration blocked by GitHub DNS failure while fetching `nifti_clib`.
- Beta-export integration suite not run: `1dXmatMaker` and `3dPicard` executables unavailable.

## AI assistance

Codex (GPT-6) assisted with isolating the changes, implementing diagnostics, updating documentation, and running regression checks. Human review and validation run by PJM and (soon) CREW.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e5d7b30b335a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.