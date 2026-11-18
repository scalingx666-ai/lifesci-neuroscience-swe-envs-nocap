# Issue

**Title:** Helpers for prepping data for dandi

## Description

# Description

- New Tables to organize and track remaining Dandi validation errors for an export
    - `DandiViolationsSelection().check_paper_for_dandi_errors` runs a validation audit for every file in a populated `Export` entry
    - results are stored per file and violation in `DandiViolations.Violations`
    - Allows querying by violation type and file to enable easier management and debugging of dandi standars errors
- Add `ensure_weight_units` to `update_analysis_for_dandi_standard`
    - add a unit to the weight string in dandi files if necessary to comply with new dandi standards 

# Checklist:

<!--
For items below with `if`, please mark those that do not apply with N/A

For example:
- [X] N/A. If this PR X, related item.
- [X] If this PR Y, other item.
- [X] I have updated the `CHANGELOG.md` ...

Alter notes example:
```python
from spyglass.example import Table
Table.alter() # Comment regarding the change
```
-->

- [x] NA If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] NA If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] NA If this PR makes changes to position, I ran the relevant tests locally.
- [x] If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a80027e0e86b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.