# Issue

**Title:** Add external regressor correlation data to metrics file

## Description

## Summary
- Add external regressor correlation data to the metrics file (component_table TSV)
- When tedana generates `confound_correlations.svg`, the correlation matrix is now saved

## Changes Made
- Add `compute_external_regressor_correlations()` function to `tedana/metrics/external.py`
- Modify `plot_heatmap()` in `static_figures.py` to accept precomputed correlations
- Update `tedana_workflow()` to compute correlations, add to component_table, and re-save
- Add metadata for new correlation columns in `get_metadata()`
- Add unit tests for the new correlation function

## Use Case
This enables Rica (and other tools) to display interactive external regressor correlation heatmaps without needing to recompute the correlations from external regressors files.

## Output Format
New columns are added to the metrics TSV file with names like:
- `external regressor correlation Mot_X`
- `external regressor correlation Mot_Y`
- etc.

## Test plan
- [x] Unit tests added for `compute_external_regressor_correlations()`
- [x] All existing tests pass
- [x] flake8 linting passes

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0c71ef2341c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.