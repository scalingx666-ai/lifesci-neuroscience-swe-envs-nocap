# Issue

**Title:** Fix fetching position dataframe in `SortedSpikesDecodingV1.get_ahead_behind_distance()`

## Description

# Description

`fetch_position_info` returns a tuple of `(position_info, position_variable_names)`, but the `.loc` here is supposed to operate on just the dataframe. Fix it to grab the `position_info` dataframe only
https://github.com/LorenFrankLab/spyglass/blob/2d7bc523cae7a948056095053cc267eecd00c2ca/src/spyglass/decoding/v1/sorted_spikes.py#L639-L641

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

- [X] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [X] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef61465950e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.