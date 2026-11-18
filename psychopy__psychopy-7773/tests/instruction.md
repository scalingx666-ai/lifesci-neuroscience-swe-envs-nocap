# Issue

**Title:** BF: Strip trailing spaces from data file paths in handleFileCollision

## Description

## What this fixes

Issue #7755: on Windows, if the participant ID (used to build the data folder) contains a
trailing space, the whole experiment runs without complaint and only fails when the data is
saved — at which point **all collected data is lost**.

## Root cause

Windows silently strips trailing spaces from folder names when they are created, so a
requested path like `001 /x.tsv` ends up in a folder called `001` on disk while the path
held by `ExperimentHandler` still contains the space — and the final `open()` raises
`FileNotFoundError` after all data has been collected.

## The fix

Per maintainer feedback, instead of rejecting such paths we now strip the spaces ourselves:

- `handleFileCollision()` (in `psychopy/tools/fileerrortools.py`) removes trailing spaces
  from each path component before the overwrite/rename/fail logic runs, and logs a warning
  when the path is changed. `dataFileName` always passes through this function before being
  stored on `ExperimentHandler`, so the stored name matches what is actually created on
  disk.
- `checkValidFilePath()` is back to its original behaviour — it no longer rejects
  trailing-space paths and the `platform` test hook is gone.
- `ExperimentHandler` now validates `self.dataFileName` (the stripped name) rather than the
  raw argument, so `makedirs` runs on the corrected path.

## Tests

- `psychopy/tests/test_tools/test_fileerrortools.py`: new test covering trailing-space
  stripping of folder and file-name components for both `overwrite` and `rename`, plus a
  check that internal spaces are left untouched. Existing collision tests still pass.
- `psychopy/tests/test_data/test_utils.py`: the previous rejection test is replaced by a
  simple `checkValidFilePath` sanity check.

```
$ pytest psychopy/tests/test_tools/test_fileerrortools.py  -> 7 passed
$ pytest psychopy/tests/test_data/test_utils.py            -> 13 passed
```

**Not run**: the repository's full test suite (needs wxPython/pygame and a display).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `602bfdee4529`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.