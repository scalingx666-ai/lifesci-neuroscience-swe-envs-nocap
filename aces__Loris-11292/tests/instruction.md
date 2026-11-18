# Issue

**Title:** [modules | document_repository] Backport (to 26.0-release) document repository access check (GHSA-qp6x-qfx7-54wp)

## Description

## What was wrong

The document_repository backend did not properly verify whether a user had access to a document before serving it. A user who knew or could guess a filename could potentially access a file associated with a site they were not authorized to access.

## What changed

Added a backend access check that:

- Looks up the documents associated site using its file path.
- Verifies that the current user has access to that site.
- Returns a Forbidden response when the user does not have access.

## Reference

Backport security fix addressing [GHSA-qp6x-qfx7-54wp](https://github.com/aces/Loris/security/advisories/GHSA-qp6x-qfx7-54wp).

This change is submitted as a security backport to the `26.0-release` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.