# Issue

**Title:** Add `unit_criteria` to `UnitSelectionParams`

## Description

# Description

Previously `UnitSelectionParams` could only filter units on their curation labels (with the labels assumed to be in columns `label` or `curation_label` for v0 and v1, respectively). Berke lab uses `ImportedSpikeSorting` with a variety of labels and quality metrics in the units table, and we'd like to be able to filter on those. This PR lets us filter units based on arbitrary columns of the units table.

- Adds `unit_criteria` to `UnitSelectionParams`: a mapping of units table column to a criterion the unit must satisfy, so we can filter based on any criteria. Supports comparisons (`>`, `>=`, `<`, `<=`, `==`, `!=`), inclusive ranges (`between`, `outside`), and membership (`isin`, `notin`). A bare value or list is shorthand for `isin`, e.g. `{"phy_group": ["good", "accept"]}` is equivalent to `{"phy_group": {"isin": ["good", "accept"]}}`. A unit is kept only if it satisfies every criterion.

Changes:

- `src/spyglass/spikesorting/analysis/v1/group.py`: add `unit_criteria` to the table definition and `contents`; add `SortedSpikesGroup.filter_units_by_criteria`; apply it in `fetch_spike_data`.
- `tests/spikesorting/v1/test_group.py`: unit tests - NaN handling, missing columns, invalid operators, param round-trip, and a `fetch_spike_data` integration test.
- `notebooks/11_Spike_Sorting_Analysis.ipynb`, `notebooks/py_scripts/11_Spike_Sorting_Analysis.py`: document new option with an example insert.
- `CHANGELOG.md`: entry and `alter` snippet.
- `pyproject.toml`: add `notin` to the codespell ignore list.

# Checklist:

- [X] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [X] If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18b2bff0de7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.