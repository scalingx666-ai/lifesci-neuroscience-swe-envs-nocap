# Issue

**Title:** Minor DLC Fixes

## Description

# Description

A couple of minor errors were introduced in PR #870.

Parameter handling improvements:

* In `src/spyglass/position/v1/position_dlc_selection.py`, the code now ensures that `pose_estimation_params` is always a dictionary, preventing potential errors when accessing its values.
* In `src/spyglass/position/v1/position_dlc_position.py`, the interpolation parameters are now correctly fetched from `interp_params` instead of being tied to the existence of the `interpolate` flag, improving clarity and flexibility in parameter usage.

Default value corrections:

* The default value for the `debug` parameter in the position estimation call within `src/spyglass/position/v1/position_dlc_selection.py` has been changed from `True` to `False`, aligning with expected production behavior.

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
- [x] If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] If this PR makes changes to position, I ran the relevant tests locally.
- [x] If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d582951c039`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.