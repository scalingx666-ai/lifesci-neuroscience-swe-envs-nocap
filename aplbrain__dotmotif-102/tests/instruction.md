# Issue

**Title:** Upgrade grandiso to use generator API

## Description

Switches the GrandIso executor to use `grandiso.find_motifs_iter` from ^1.2.0.

This will dramatically improve worst-case performance by eliminating all search overhead past the requested count `limit`.

No API changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42335b81c7e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.