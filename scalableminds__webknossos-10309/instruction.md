# Issue

**Title:** Expand volume annotation docs on magnifications and interpolation

## Description

### Summary
A support chat user asked whether Trace + interpolation work at mag 4-4-4. The docs bot said yes, but with a default layer Trace is disabled there. The docs didn't cover this.

- `tools.md`: new section on how edits are propagated to all mags (coarse painting may look blocky at full resolution) and on the per-tool zoom limits (Brush: finest mag + 3 coarser; Trace/Fill: finest mag + 1 coarser)
- `tools.md`: expanded Volume Interpolation: supported tools, same segment only, 2–100 slices apart counted in the current mag, visible area only, follows the tool's zoom limit
- `import_export.md`: expanded "Restricting magnifications" with when it's useful (large structures, annotating while zoomed out) and caveats. The section stays here because the in-app warning links to this anchor

### Steps to test:
- Read the changed sections in the rendered docs

------
- [x] Updated [documentation](../blob/master/docs) if applicable

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3a804de970f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.