# Issue

**Title:** deprecated -> obsolete

## Description

I changed all deprecated classes, methods to obsolete. That is, they now raise an runtime error. Only one deprecated parameter remains (control.start). See also new stimuli module _obsolete.py What do you think?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c06bda1d4ae1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.