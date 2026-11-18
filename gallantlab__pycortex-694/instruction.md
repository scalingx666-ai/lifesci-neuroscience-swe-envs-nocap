# Issue

**Title:** docs(surfinfo): add missing docstring for flat_border

## Description

flat_border had no docstring at all despite being on the website's API reference. Describes its outfile/subject parameters and the lines/ismwalls arrays it saves.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `505a0478ba44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.