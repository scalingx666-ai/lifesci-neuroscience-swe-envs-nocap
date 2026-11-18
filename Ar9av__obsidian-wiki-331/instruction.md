# Issue

**Title:** feat(context-pack): show validity window and successor per page

## Description

Borrowed from Zep's context format, which prints a date range next to every fact ([arXiv 2501.13956](https://arxiv.org/abs/2501.13956)).

**What changes**
- Each page block in a context pack now includes `Valid: <from> – <until|present>` and `Superseded by: [[x]]` when the page carries `valid_from` / `valid_until` / `superseded_by`.
- Pages without these fields render byte-for-byte as before.
- Added a test: `test_pack_shows_validity_window_and_successor`.

The full test suite passes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7b07334ae5d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.