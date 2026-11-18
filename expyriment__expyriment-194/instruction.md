# Issue

**Title:** Design factor names: sort when casting set to list

## Description

Currently, when printing or saving designs, the block and trial factors will be differently ordered for every Python session. This is because sets don't have an order and when being casted to lists the assigned order seems to be random. I think we should explicitly order those factor names, such that the resulting design CSV file is better readable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c1b65aa40cd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.