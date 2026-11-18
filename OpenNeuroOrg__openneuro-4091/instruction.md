# Issue

**Title:** feat(worker): Add remote streaming to git_show_content as an option

## Description

Preserves the fast path for failing quickly on local files but allows callers to enable remote streaming.

Used by bids_mosaic for streaming the remote images during mosaic creation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f628ce787fdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.