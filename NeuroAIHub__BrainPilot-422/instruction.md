# Issue

**Title:** feat(plugins): add Playwright MCP integration

## Description

## Summary

- add a BrainPilot-native wrapper for Microsoft `@playwright/mcp@0.0.78`
- run an isolated headless browser with service workers blocked and plugin-scoped output
- discover cached/system Chromium with an explicit environment override
- expand `${BRAINPILOT_PLUGIN_ROOT}` and related variables in plugin MCP commands, args, and env
- expose publisher, repository, Apache-2.0 license, pinned npm integrity, requirements, and local-code warning
- add upstream drift, marketplace installation, projection, and MCP merge tests

## Stack

Stack 4/4. Depends on #421 → #420 → #419. This PR intentionally targets `main`; preceding commits disappear from its diff as the earlier PRs merge.

## Runtime verification

- BrainPilot MCP bridge discovered 24 Playwright tools
- `mcp__playwright__browser_navigate` opened the local BrainPilot UI and returned title `BrainPilot`
- disable removed the runtime projection; re-enable restored it
- `npm run typecheck`
- full suite: 933/933 passed on latest upstream `main`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c048b0387b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.