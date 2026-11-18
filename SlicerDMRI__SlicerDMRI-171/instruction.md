# Issue

**Title:** ENH: Remove unnecessary stat serialization whitespaces around separator

## Description

Remove unnecessary whitespaces around separator in fiber measurement stat printing and serialization. These whitespaces make it such that:
- The column names have some unnecessary/unexpected/undesired head and tail whitespaces, which makes it such that to call a column programmatically we need to do e.g. `[" Num_Fibers "]` instead of the expected `["Num_Fibers"]`.
- Numerical data are considered as strings or objects, and not as scalars.

So removing such whitespaces at the time of writing the data to a CSV file becomes necessary to ease automation/object manipulation downstream.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34dca8edf493`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.