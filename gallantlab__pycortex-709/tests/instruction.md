# Issue

**Title:** ENH item access support for subject/surface/transform names

## Description

## Summary
This PR adds `__getitem__` support throughout the database access hierarchy, enabling users to access subjects, surfaces, and transforms by name using bracket notation (e.g., `db['S1-test']`). This is essential for names that are not valid Python identifiers and cannot be accessed via attribute notation.

## Key Changes

- **Database class**: Added `__getitem__`, `__contains__`, and `__iter__` methods to support item access for subjects. Improved `__getattr__` to provide helpful error messages directing users to use item access for non-identifier names.

- **SubjectDB.surfaces (Surfaces class)**: Added `__getitem__` method with informative KeyError messages listing available surfaces. Updated `__getattr__` to avoid recursion issues with dunder attributes.

- **SubjectDB.transforms (Transforms class)**: Added `__getitem__` method, `__dir__` method, and improved `__getattr__` to support both item and attribute access patterns.

- **XfmSet class**: Added `__getitem__` method for accessing transform types (e.g., 'coord', 'magnet'), `__dir__` method, and improved `__getattr__` with better error handling.

- **Error handling**: All `__getitem__` implementations now raise `KeyError` (not `AttributeError`) with helpful messages listing available options. Dunder attributes are explicitly excluded from filestore lookups to prevent recursion during object construction, copying, or pickling.

- **Documentation**: Updated `docs/database.rst` with examples and explanation of item access for non-identifier names, including usage of `in` operator and iteration.

- **Tests**: Added comprehensive test suite (`cortex/tests/test_database.py`) covering item access, attribute access, error messages, dunder attribute handling, and warning behavior.

## Notable Implementation Details

- Dunder attributes (`__*__`) are explicitly checked and raise `AttributeError` before attempting filestore lookups, preventing infinite recursion during object operations.
- Error messages consistently list available options to help users discover valid names.
- The implementation maintains backward compatibility with existing attribute-based access while adding the new item-based access pattern.

https://claude.ai/code/session_01XvzkAD2Fu6irNYq4uKyfRT

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f8797a82898`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.