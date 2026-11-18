# Issue

**Title:** Remove old-implementation reference from JSON mapping tests

## Description

### Summary

. Now that the native JSON mapping path is merged, the test no longer needs a copy of the old per-voxel implementation as proof.

- `JsonMappingTestSuite` now checks explicit expected ids per element class (voxel data and single segment ids), plus random data against a simple per-voxel `Long` lookup.
- `MappingParser` and `DataLayerMapping` are plain `Long` instead of generic. The unused `parse(Path)` overload is removed.

No behaviour change.

### Steps to test:
- `sbt "testOnly backend.JsonMappingTestSuite"`

------
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08b96af6d058`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.