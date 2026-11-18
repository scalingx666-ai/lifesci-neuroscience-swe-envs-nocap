# Issue

**Title:** ENH: Fix label geometry

## Description

Broken on the ANTs side, which would be fixed by 

Some R changes to accomodate new filter and pass label image with correct pixel type.

See also

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5fb52b1616eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.