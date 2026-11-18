# Issue

**Title:** Fix for ImportedSpikeSorting ingestion

## Description

# Description


- add flag `_single_entry_per_table` to the `IngestionMixin`
    - default of `False` will attempt to create a table entry for each row of a nwb DynamicTable (e.g. `TaskEpochs`)
    - if set `True` will create on entry for the entire table (e.g. `ImportedSpikeSorting`)
-  Add tests for ingestion to `ImportedSpikeSorting`

# Checklist:

- [x] NA If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] NA If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] NA If this PR makes changes to position, I ran the relevant tests locally.
- [x] NA If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3c700526b18`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.