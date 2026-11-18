# Issue

**Title:** Bugfix file attrib

## Description

This PR has to goals:

1. Double-check the answer from `file_attrib(FILE, 'w')` in Windows, since there are reported false positives.

2. Allow Windows users to load protocols from folders that are symbolic links. Users would need to select either the `anat` or `data` folders inside the folder (which is the symbolic link).

@yashvakilna, @chinmaychinara91, please try this on different scenarios on Windows.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c113225a8136`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.