# Issue

**Title:** MCP: tool annotations for every tool

## Description

Every MCP tool now carries full annotations: title, readOnlyHint, destructiveHint, idempotentHint and openWorldHint, emitted in tools/list.

- Readers (list, read, search, access lookups) are read-only and idempotent.
- create_note, create_folder, append_note and edit_note are writers, not destructive.
- update_note, the three deletes, manage_access and set_access_default are destructive.
- Moves are non-destructive and idempotent.
- Annotations are a required typed field, so a new tool without them fails to compile; a test pins the table.

Server-only change, no desktop release. Tests: six MCP files, 72 passed; typecheck clean. After merge, staging is fast-forwarded onto main.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a97c3958a3c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.