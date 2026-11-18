# Issue

**Title:** ENH: Add a command line option to apply a transformation

## Description

Add a command line option to apply a transformation to the obtained tractography data. Relevant for data where the brain size of the subject is significantly different (e.g. infant data) from an adult's brain size (used for the ORG atlas). The option allows to apply a scaling transformation so that the registration process to the ORG atlas data can work reasonably. The inverse transformation is automatically applied after the clustering process has finished in case the transformation file is provided.

Document the use of the transform in documentation file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1b19a05d0f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.