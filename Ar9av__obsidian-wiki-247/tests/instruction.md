# Issue

**Title:** fix(memory): read folded and literal frontmatter scalars

## Description

## Summary

The GraphRAG fix for #156 did not reach `memory.parse_frontmatter`. On v2026.9.3, `memory index` and `memory sync` still emit literal block indicators instead of the title and summary text from the recommended page template.

- Recognize block-scalar headers and consume their indented continuation lines, matching the existing GraphRAG behavior.
- Normalize folded and literal blocks into single-line previews, without adding a YAML dependency or changing existing scalar/list handling.
- Add parser coverage for indicators, indentation, blank lines, empty values, end-of-input, and existing scalar/list formats.
- Exercise both CLI writers with Markdown and wikilink output and verify an immediate index check is clean.

## Validation

- New regression cases reproduce the broken titles/summaries before the fix.
- Focused memory and GraphRAG suites: 172 passed.
- Full suite on Python 3.13 with an isolated HOME/XDG config: 1035 passed, 4 skipped, 29 subtests passed.

Related to #156.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2908fc99d9cf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.