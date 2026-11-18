# Issue

**Title:** FIX make compound metadata group keys collision-free

## Description

Fix a silent metadata-group collision in MOABB's group-aware splitters.

Multi-column `groups` are currently encoded with `"-".join`, so distinct tuples such as `("a-b", "c")` and `("a", "b-c")` both become `"a-b-c"`. This can collapse distinct groups, alter folds, and change the intended leakage boundary.

The fix keeps single-column/callable groups unchanged and encodes only compound groups as canonical JSON arrays. A `LeaveOneGroupOut` regression demonstrates the old failure and the corrected two-group behavior.

The branch also includes a changelog entry.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `775744b060da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.