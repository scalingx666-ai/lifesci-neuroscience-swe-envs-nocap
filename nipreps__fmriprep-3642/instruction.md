# Issue

**Title:** FIX: Restrict carpet plot crown mask to BOLD coverage

## Description

.

## Changes proposed in this pull request

- Add `_clip_mask_to_coverage` helper in `fmriprep/workflows/bold/confounds.py` that
  restricts a mask to voxels with non-zero BOLD variance.
- Add `crown_clip` Function node to `init_bold_confs_wf` and route it between
  `subtract_mask` and the three downstream consumers (`outputnode.crown_mask`,
  `crowncompcor.mask_files`, `mrg_compcor.in3`).

## Why

When the brain mask is dilated past the BOLD coverage region, the resulting
crown includes voxels with no time-series content. These zero-variance rows are
grouped together by the carpet plot's row-sort and surface as a flat gray band:

![diagnostic](https://raw.githubusercontent.com/lobennett/fmriprep/issue-assets/.github/issue_assets/3359/diagnostic.png)

| Before | After |
|---|---|
| ![orig](https://raw.githubusercontent.com/lobennett/fmriprep/issue-assets/.github/issue_assets/3359/orig.png) | ![fix](https://raw.githubusercontent.com/lobennett/fmriprep/issue-assets/.github/issue_assets/3359/fix.png) |

This is a visualization-only change; `edge_comp_*` columns in
`desc-confounds_timeseries.tsv` are unaffected (zero-variance voxels contribute
nothing to PCA). See  for the verification.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e9488062378`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.