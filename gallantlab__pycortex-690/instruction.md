# Issue

**Title:** MNT replaced deprecated tempfile.mktemp with mkstemp

## Description

tempfile.mktemp() is deprecated (docs recommend mkstemp()) because it only returns a filename without creating the file, leaving a race window before the caller creates it. Switch all temp-path creation in this module to mkstemp(), closing the returned fd immediately since callers only need the path (flirt/nibabel write to it externally).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `505a0478ba44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.