# Issue

**Title:** ENH: Provide better mask processing for BRAINSFit

## Description

When an entire label map is used as a mask,
it should be interpreted as any non-zero value
is inside the mask.

This is accomplished by reading the data from disk as an unsigned long (type casting as needed) and then selecting all values inclusive in the range of
( 1, NumericTraits::<unsigned long>::max() )

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dece340ea4ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.