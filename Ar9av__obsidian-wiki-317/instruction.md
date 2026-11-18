# Issue

**Title:** feat(ingest): ingest-guard keeps one source to one primary page

## Description

Ingesting a conversion (_raw/import/report.md) and later its original
(report.pdf) produced references/report.md and references/report.pdf.md:
stems, titles and hashes all differ, so nothing caught it (#315).

`obsidian-wiki ingest-guard <vault> <sources...>` is a read-only
preflight. It reduces each source name to an identity (document
extensions stripped, slugged) and reports, per source:

- create:  no page claims the identity
- update:  exactly one page does (by stem or title) - the primary page
- blocked: two or more do; exit 2, merge them with wiki-dedup first

plus prior_sources (manifest keys with the same identity) and siblings
(same document in two formats in one run). Redirect stubs are ignored,
and a source kept in the vault is not counted against itself.

wiki-ingest runs it before writing, before batch fan-out, and after the
batch; names new pages after the identity; and records the original
source against the same primary page.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72a7fe07ea62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.