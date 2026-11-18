# Issue

**Title:** BUG: Fix error when nodes are removed while loading DICOM data

## Description

loadLoadables only records nodes that are not storage or display nodes, but when any node was removed during loading, it tried to remove it from the list of loaded nodes, which raised "ValueError: list.remove(x): x not in list".

Only remove nodes from the list that were added to it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46891eee252d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.