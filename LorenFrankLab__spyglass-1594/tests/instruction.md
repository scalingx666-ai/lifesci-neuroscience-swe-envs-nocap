# Issue

**Title:** Analysis write efficiency

## Description

# Description

-  
    - When using the builder, moves the file open and write management to the builder context
    - avoids reopening and writing file for each object added
    - No change to interface when using standard builder or analysis table methods 

- Adds `builder.open_nwb` property
   - property is a tuple (io, nwb) in writable mode
   - `write` and `io.close` are handled by the builder at `register` and/or context exit 
   - Deprecates `open_nwb_for_write` in favor of this managed property (edits docs and doc-strings accordingly)

- corrects intended default naming for numpy arrays stored in analysis nwb files with `add_nwb_object`

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
- [x] NA If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da3cbb766af9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.