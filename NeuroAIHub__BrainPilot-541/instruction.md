# Issue

**Title:** feat(research): enable adaptive librarian retrieval

## Description

## Summary
- give Librarian bounded Bash/Edit access for direct public retrieval fallbacks
- give literature-scout and api-librarian the same bounded shell capability while keeping evidence-extractor shell-free
- integrate MCP-first retrieval, timeout/size bounds, untrusted-content handling, and exact evidence provenance into the existing English prompts

## Validation
- Runtime build: passed
- Runtime typecheck: passed
- Full test suite: 106 files, 1122 tests passed
- Repository build: pre-existing Web TypeScript errors on origin/dev; this PR changes Runtime files only

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a4b0a1ce635`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.