# Issue

**Title:** Update grandiso to use inlined node attribute matching

## Description

This uses the new node-matching path in grandiso≥2.0.0 in order to search for node attribute matches during the execution of the isomorphism algorithm itself. This greatly reduces the time complexity of attribute-heavy searches (potentially by multiple orders of magnitude, as it did in tests).

Awaiting the publication of grandiso 2.0.0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `699d6682f2e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.