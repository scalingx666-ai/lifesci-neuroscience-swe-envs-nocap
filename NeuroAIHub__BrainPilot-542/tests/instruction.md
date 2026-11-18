# Issue

**Title:** fix(kb): make paper search evidence-safe

## Description

## Summary
- return a structured paper-search status envelope and distinguish recoverable misses from infrastructure failures
- normalize title and phrase matching without erasing semantic symbols, while keeping exact matches first
- keep metadata search metadata-only and preserve full-text recall in full-paper mode
- bound topk, report missing/unreadable text and unavailable pages, and prevent zero-hit keyword-only results
- document the updated English and Chinese contracts

## Compatibility
- searchPapers is internal to Runtime and has no public package export or additional direct callers
- search_papers_local continues to return JSON text, now as an explicit object with status and results

## Validation
- Runtime build: passed
- Runtime typecheck: passed
- Focused search/tool tests: passed
- Full test suite: 107 files, 1133 tests passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `863f8727f219`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.