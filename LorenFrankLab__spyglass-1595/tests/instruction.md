# Issue

**Title:** Allow RestrGraph to check non-spyglass tables

## Description

# Description

This PR adds a boolean flag to `RestrGraph` that allows a check of external tables.

To answer a question like, "what custom tables use X file?", a user could ...

```python
from spyglass.common import Session

restr_graph = Session().restrict_all(
    restriction='nwb_file_name="some_file.nwb"',
    allow_external=True
)
restr_graph.restr_ft # show all tables, including custom
```

# Checklist:

- [X] No. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/a. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [X] No? If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16817a398cc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.