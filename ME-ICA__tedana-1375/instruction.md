# Issue

**Title:** fix: Update open_rica_report.py with current Rica file patterns

## Description

## Summary

Updates the `RICA_FILE_PATTERNS` list and file filtering logic in the generated `open_rica_report.py` launcher script to work correctly with Rica v2.1.5+ output structure.

## Changes

### RICA_FILE_PATTERNS Update
- Removed outdated `stat-z_components.nii.gz` pattern (removed in Rica v2.1.4)
- Added `_desc-ICA_components.nii.gz` to match current naming convention
- Added QC NIfTI files: T2starmap.nii, S0map.nii, rmse_statmap.nii
- Added decision tree files: decision_tree.json, status_table.tsv
- Added registry.json to enable proper file listing
- Maintained backward compatibility with original convention files

### send_file_list() Exclusion Filters
The file listing endpoint now excludes:
- Echo-specific component files (echo-1 through echo-5 variants)
- Derived maps like ICAAccepted and ICAAveragingWeights
- These were being served unnecessarily, preventing the brain map/time series/power spectrum from loading correctly

## Problem Solved
The local server (generated open_rica_report.py) was unable to load brain maps, time series, and power spectrum visualizations because:
1. Outdated file patterns didn't match current Rica output
2. Echo-specific and derived component files were being returned by the file listing, interfering with proper component loading

## Testing
The launcher script will now correctly serve only the intended Rica output files when users run the local server.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `586542b37420`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.