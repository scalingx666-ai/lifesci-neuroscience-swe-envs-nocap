# Issue

**Title:** fix(postprocess): correct _merge_buffer_entries call convention

## Description

## Summary

- `_merge_buffer_entries` is a module-level function in `postprocess.py`, not a method on `ModelHistory`. It was incorrectly called as `self._merge_buffer_entries(unique_buffer, buffer)`, causing `AttributeError` when processing recurrent/autoregressive models with duplicate buffer entries.
- Fixed to `_merge_buffer_entries(self, unique_buffer, buffer)`, consistent with all other module-level function calls in `postprocess.py`.

.

## Credit

This bug was originally reported by @eric-ayllon in #47 and independently fixed by @gilmoright in PR #56. Thank you both for identifying and diagnosing this issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3738449e0577`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.