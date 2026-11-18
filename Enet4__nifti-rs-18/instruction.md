# Issue

**Title:** Improve integration with code type definitions

## Description

- specify memory representation in `typedef::*` (u16 or u8 depending on attribute)
- make utility methods in `typedef::*` take `self` by value (cheaper than by ref)
- make volume construction methods yield an `InvalidCode` error (instead
of the less specific `InvalidFormat`)
- add `NiftiError::InvalidCode` variant
- add validating getters for these codes
- add methods for retrieving xyzt units with space-time separation

At first I considered modifying the attributes of `NiftiHeader` to contain these types immediately upon reading the header. With the repr directives, the header could still be packed without wasting memory and providing an extra layer of abstraction. However, I feel reluctant to make the entire reading process break just because of a single unknown code, which for the most part (`datatype` is an exception) are not critical. By keeping unvalidated codes, the library will give more flexibility to eventual file diagnostic tools.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5908eea6b90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.