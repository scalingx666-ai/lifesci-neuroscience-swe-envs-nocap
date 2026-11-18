# Issue

**Title:** Automated version-control documentation for 2.1.9 and up

## Description

- Removing portray and using mike (+ mkdocs) to version-control our docs.
- GHA was modified to build and keep each version (release x.x.x version or master for dev version)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26840f33936b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.