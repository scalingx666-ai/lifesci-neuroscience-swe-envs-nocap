# Issue

**Title:** FIX: Remove redundant fmap_boldref resample in desc-fmapCoreg_bold.svg report

## Description

.

## Changes proposed in this pull request

- Remove the `fmap_boldref` `ApplyTransforms` node from `init_func_fit_reports_wf`.
- Connect `inputnode.fieldmap` directly to `sdcreg_report.fieldmap`.

This restores the wiring that existed before #3387, which is now correct because #3467 rewired `func_fit_reports_wf.inputnode.fieldmap` to receive `boldref_fmap.out_file` — a fieldmap already reconstructed onto the BOLD reference grid.

## Why

`fmap_boldref` was added in #3387 to resample a raw RAS fieldmap into BOLD space for the `FieldmapReportlet`. After #3467 introduced `boldref_fmap` (a `ReconstructFieldmap` node) and rewired its output into the reports workflow at `fit.py:500`, the resample became redundant. Removing `fmap_boldref` restores correct rendering. Actual SDC is unaffected — `unwarp_boldref` (`fit.py:614`) and the time-series `resample` (`apply.py`) use `ReconstructFieldmap` outputs directly. See the linked issue for figures and a centroid trace.

## Impact

- **Reports:** `desc-fmapCoreg_bold.svg` now plots the fieldmap at the correct location regardless of BOLD/fmap acquisition geometry.
- **Workflow:** one node removed, two connections deleted, one connection added. `grep -rn fmap_boldref` returns zero matches after the change.
- **Other outputs:** none affected. `fmap_boldref` was reports-only.

## Testing

- Built `init_func_fit_reports_wf` under `sdc_correction=True/False` × `freesurfer=True/False` and walked the workflow graph: `fmap_boldref` is gone, and `sdcreg_report.fieldmap` is connected directly from `inputnode.fieldmap` post-fix; the other three required inputs (`reference`, `moving`, `mask`) remain wired as before.
- Reproduced the bug on a real subject with fmriprep `25.2.5` (figures in the linked issue) and verified the fix produces correctly-located overlays by invoking `FieldmapReportlet` with the proposed wiring.
- `ruff check`, `ruff format --check`, and `codespell` pass on the modified file.

## Documentation that should be reviewed

None.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `acdb0fde1b8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.