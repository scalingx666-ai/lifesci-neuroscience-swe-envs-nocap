# Issue

**Title:** Add --bids-database-dir and --spec-file command line options

## Description

For compatibility with Nipoppy, we need a mechanism to restrict inputs to one subject. The PyBIDS mechanism for this is passing a --bids-database-dir containing a database for only one subject. The --spec-file lets the user pass a specific spec file to be used for workflow construction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2736b09f508e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.