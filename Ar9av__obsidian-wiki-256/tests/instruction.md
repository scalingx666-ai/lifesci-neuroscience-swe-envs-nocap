# Issue

**Title:** fix(config): name the .env whose empty OBSIDIAN_VAULT_PATH blocks resolution

## Description

## Problem

Copying `.env.example` to `.env` leaves a bare `OBSIDIAN_VAULT_PATH=` line. The CLI's walk-up stops at that file on purpose, because an empty value is how a project blocks the global vault (`test_context_pack_stops_at_empty_nearest_local_vault_config` pins this). But the error only said `vault not configured; pass a path or run obsidian-wiki setup`. Running setup doesn't help, and nothing pointed at the `.env`. I hit this while testing #255: `obsidian-wiki memory` in a dev checkout with a configured global vault failed this way.

## Change

- Both CLI resolvers now report the file that stopped the walk:
  - `_resolve_schema_command_context` (used by `memory`, `lint`, `staging`, `snapshots`, `trust`)
  - `_resolve_context_pack_vault`
  ```
  error: vault not configured; /path/to/project/.env sets OBSIDIAN_VAULT_PATH to empty, which blocks the global config. Set it, delete the line, or pass a path
  ```
- The Config Resolution Protocol (`AGENTS.md`, `.skills/llm-wiki/SKILL.md`) now tells agents to do the same instead of silently using an empty path.
- **No behaviour change.** Empty still blocks the global config.

## Tests

- Extended the existing context-pack test to assert the path appears in the error.
- Added a test for the schema-command resolver, via `memory status`.
- `pytest`: 1093 passed, 4 skipped.
- Manual check: `python3 -m obsidian_wiki memory status` in a checkout whose `.env` has a blank line now prints the message above.

## Open question for the maintainer

Not all resolvers treat an empty value the same way:

| Resolver | Empty `OBSIDIAN_VAULT_PATH=` |
|---|---|
| CLI (both resolvers) | **Blocks** the global config |
| `obsidian_wiki.client.resolve_vault` (Python API) | **Falls through** to the global config |
| `wiki-session-recap.sh` hook | **Falls through** to the global config |

I left this alone because "empty blocks" is tested and looks intentional. If falling through is preferred everywhere instead, another option is to comment out the line in `.env.example` (`# OBSIDIAN_VAULT_PATH=`). Either way, picking one rule would remove the surprise.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94e1c401dc23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.