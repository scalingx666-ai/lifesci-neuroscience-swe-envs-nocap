# Issue

**Title:** ENH: Allow path-like objects for tractogram load/saving

## Description

Allow path-like objects for tractogram load/saving.

Add the corresponding tests.

Change the docstrings to mark the types of the filenames as `path-like` objects instead of only `str` objects.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ee2a49cccbd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.