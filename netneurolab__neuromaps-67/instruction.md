# Issue

**Title:** [FIX] Fixed bug in load_data()

## Description

This commit fixes a bug in `images.load_data`: on Unix OS, an OSError is
raised when the function tries to load a parcellated brain map
(`ndarray`) that does not contain bytes corresponding to the NUL character.

This happens becauses `load_data` does not catch the OSError raised on
Unix OS.

This commit modifies the `load_data` function such that it now catches
the error. To distinguish between this OSError raised when trying to
load an array and the OSError raised when the file we're looking for
does not exist, the function now checks if `data` is an array-like object
with `int` or `float` array items. If it is not (i.e. it is not a
parcellated brain map), then it raises the OSError.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b20039590654`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.