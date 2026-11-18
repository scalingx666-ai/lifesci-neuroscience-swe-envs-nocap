# Issue

**Title:** feat(lint): report Markdown files too large for Obsidian to open

## Description

Obsidian's renderer exhausts its heap on a Markdown file of roughly 1-2 MB
and the window goes blank; since it loads every file in the vault, one
oversized page breaks the whole vault (#311).

- lint: new `oversized_pages` warning for every non-hidden .md over
  1,000,000 bytes, `_raw/` included, with the size in bytes.
- wiki-lint: how to split an oversized page into focused pages behind a
  hub at the original path; never edit archived snapshots.
- wiki-ingest: keep pages well under 1 MB, plan large sources as several
  pages, never paste a whole conversion into one page.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `acc0ac176934`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.