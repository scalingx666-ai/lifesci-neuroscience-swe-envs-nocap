# Issue

**Title:** Removed trial annotation from HED FacePerception_events.json example

## Description

There is one event file in the HED examples that has two event consecutive event markers at exactly the same time. The `trial` column in the example was annotated as a value column, resulting in duplicate tags when event marker annotations over multiple rows corresponding to the same time are combined.  

The trial information can be correctly incorporated using the curly brace notation, but the hed-javascript validator's handling of this feature is still under development as is the detecting of errors when multiple rows in the `events.tsv` file have the same onset values.

Both types of errors are now detected by the hed-python validator, so we realized the need to correct the examples.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c30c6ecb0b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.