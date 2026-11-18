# Issue

**Title:** Fix revisit of cascaded nodes with new restriction

## Description

# Description

This PR fixes cascade traversal when a previously visited upstream node receives a newly expanded restriction from another branch, ensuring restrictions are unioned instead of being prematurely skipped.

It also adds a focused regression test for the A/B→Parent revisit scenario to prevent future regressions.

- `src/spyglass/utils/dj_graph.py`: updates revisit/cascade restriction behavior and deferred merged restriction handling.
- `tests/utils/test_graph.py`: adds `test_rg_revisits_with_expanded_restriction` with a minimal fixture graph that reproduces the revisit-union case.

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

- [x] If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [x] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0793e37912fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.