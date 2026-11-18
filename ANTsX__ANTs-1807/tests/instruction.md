# Issue

**Title:** ENH: More image read checks

## Description

Check if the imageIO object can be created on read

This helps avoid seg faults if the file exists but is not a supported image or is corrupt

Will still need downstream code to actually check if ReadImage returns false

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1892feff83b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.