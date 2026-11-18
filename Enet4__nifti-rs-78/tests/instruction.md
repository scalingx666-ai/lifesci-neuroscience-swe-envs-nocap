# Issue

**Title:** Remove public AsPrimitive trait bounds on scalars

## Description

.

- Replicate `AsPrimitive` conversion into multiple constructor functions in DataElement
- Rewrite `convert_bytes_and_cast_to` as a macro
   - one for each scalar type
   - reduced trait bounds
- Relax trait bounds on `LinearTransform` impls
- Relax trait bounds on `IntoNdArray` methods
- Relax trait bounds on generic test functions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `abefc896d53e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.