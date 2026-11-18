# Issue

**Title:** MAINT: Harden archive extraction and fix missing files error format in _manifest_check_download

## Description

### summary

1. **zip slip fix in `_manifest_check_download`**: before extracting, every archive member is now checked to resolve inside `destination.resolve()` using `path.is_relative_to(dest_resolved)`. if a member would land outside the extraction root, it raises a `RuntimeError`.
2. **error message fix**: the error string in `_manifest_check_download` was missing its `f` prefix, so when the archive contents didn't match the manifest it printed `"{'\n'.join(missing)}"` literally instead of the missing files. added the prefix.
3. **tests**: added a few assertions to the existing `test_manifest_check_download` instead of writing a new test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e484b06ba766`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.