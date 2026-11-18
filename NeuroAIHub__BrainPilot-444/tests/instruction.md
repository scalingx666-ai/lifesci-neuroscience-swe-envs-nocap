# Issue

**Title:** fix(plugins): validate MCP activation failures

## Description

## Summary
- run declared plugin preflight checks before persisting the enabled state
- make the Playwright wrapper reject activation when Chrome/Chromium is unavailable
- preserve per-server MCP startup failures while keeping healthy servers available
- surface an explicit session error when every configured MCP server fails

## Tests
- `npm test -- --run` (88 files, 971 tests passed before the latest upstream rebase)
- targeted post-rebase tests (77 passed)
- `npm run typecheck`

## Note
`npm run check:playwright-mcp-upstream` reports the pre-existing 0.0.78 pin is behind 0.0.79; this PR intentionally does not mix in an upstream dependency upgrade.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c8b0afaa584`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.