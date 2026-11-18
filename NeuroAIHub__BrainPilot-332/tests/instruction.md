# Issue

**Title:** fix(web): implement @ mentions for MCP and files in composer

## Description

## Summary

- Implements composer `@` mentions promised by the placeholder (issue #316): MCP server candidates from `api.mcpServers.list()`, shallow `/workspace` file candidates when a sandbox is available.
- Shows explicit loading / empty / prerequisite states (e.g. files need a running Sandbox) instead of silently doing nothing; supports ↑↓ / Enter / Esc and listbox ARIA.
- Dynamic placeholders only advertise behavior that is actually available (`MCP+files` / `MCP only` / `files only` / plain).

## Implementation notes

- Pure logic in `mentionLogic.ts` (detect / filter / insert / placeholder matrix) with unit tests.
- `ComposerInput` owns open/query/highlight so keystrokes do not re-render the message stream.
- Insert format: `@mcp:<name> ` and `` `/workspace/...` `` (plain text for the agent; no protocol change).

## Test plan

- [x] `packages/web` vitest (289 tests, including 33 new mention tests)
- [x] `packages/web` `tsc --noEmit`
- [ ] Manual: new draft + running sandbox → type `@` → see MCP and/or files
- [ ] Manual: sandbox stopped → MCP still listed + files prerequisite row
- [ ] Manual: `@zzz` → explicit empty state, menu stays open
- [ ] Manual: keyboard ↑↓ Enter Esc; placeholder text matches capability

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e60c4555c27f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.