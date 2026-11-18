# Issue

**Title:** Fixing FilterNet bug (ON/OFF offset, issue #339)

## Description

Fix for Issue #339 
The test cases' expected values are also replaced with updated ones.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb8dce12d526`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.