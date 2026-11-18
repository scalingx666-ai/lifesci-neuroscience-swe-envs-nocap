# Issue

**Title:** [BEP032] Review and clean-up suggestions

## Description

## Units & Dimensions

- 3fece848: Removed dimension_unit column and instead explicitly mentioned unit in the height, width and depth columns for probes. Based on discussions in the [meeting](https://docs.google.com/document/d/1-BDsaAZ-3EMxnhkpEgQT-n9D1zgTDZM7JvjpLeXW5kI/edit?tab=t.0#heading=h.x72fh473xqm7), changes in the [doc](https://docs.google.com/document/d/1oG-C8T-dWPqfVzL2W8HO3elWK8NIh2cOCPssRGv23n0/edit?tab=t.0#heading=h.xusg1m9qm1ca) and this [comment](https://docs.google.com/document/d/1oG-C8T-dWPqfVzL2W8HO3elWK8NIh2cOCPssRGv23n0/edit?disco=AAABIGPAMOw). Rationale: fits BIDS TSV concept better and default unit was agreed upon.
- be82cb98, 923349ad, 3a86a528: Fixed electrode `size` unit to um² and removed remaining `dimension_unit` references per ProbeInterface conventions.

## Schema Refactoring (Column Unification)

- 938e9f9a: Refactored `x__electrodes`, `y__electrodes`, `z__electrodes` to use base `x`, `y`, `z` columns with `description_addendum` for microephys-specific context (matching iEEG pattern).
- 866aced1: Refactored `units__channels` to use base units column (matching iEEG, EEG, MEG, EMG pattern).

## Resolved TODOs

- 4e28f8e6: Removed `gain` TODO - no objections and [comment](https://docs.google.com/document/d/1oG-C8T-dWPqfVzL2W8HO3elWK8NIh2cOCPssRGv23n0/edit?disco=AAABK7UN2lo) favoring current implementation.
- 80d70dd0: Removed `MicroephysCoordinateSystem` TODOs - enums already added in 6284d368, unified system preferred over ecephys/icephys split.
- 06a3c6e: Removed duplicate `RequiredCoordsystem` check from checks/microephys.yaml

## Future Unification Comments

- e8b12685, 65b5289a, 9444263e: Added TODO comments marking `hemisphere__probes`, `manufacturer__probes`, and `material__probes` for future unification with base columns (requires generalizing base descriptions from "electrode" to be context-agnostic).

## Documentation Fixes

- 89ed1f57: Added proper markdown link to 2D coordinate systems section in `MicroephysCoordinateSystem` description.
- 57b0292b, 5112f4fd: Fixed `events.yaml` to include microephys in channel column addendum, fixed typo.
- Unused Code Removal
- add8b6ff: Removed unused surgery_date column (moved to PR #1839).
- 7a238309, 5e91f380: Removed unused `contact_count` column and old `probe` suffix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c6aed25da5a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.