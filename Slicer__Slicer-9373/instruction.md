# Issue

**Title:** BUG: Report the cause of extension package download failures

## Description

downloadExtensionByName() returned nullptr without logging anything in four failure paths, and continued execution instead of returning when extension metadata was missing. Each path now reports what went wrong, including the error string from qRestAPI for failed requests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `583e9b37d50e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.