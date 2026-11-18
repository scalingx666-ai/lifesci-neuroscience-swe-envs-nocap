# Issue

**Title:** feat(runtime): cross-user read-only shared root (/shared, legacy parity)

## Description

## What

Reintroduce the legacy `users/shared → /shared:ro` **cross-user shared directory** in the TS architecture. Multi-user deployments isolate users by container/dataRoot, so a genuinely cross-user folder must live **outside** any user's dataRoot and be mounted separately — matching the legacy design.

Adds a fourth addressable root `/shared`, parallel to the existing `/workspace`, `/data` (#257), and `/attachments` roots.

## Design decisions

- **Read-only** (legacy `/shared:ro` parity) — all users read; nobody writes.
- **Agent-visible only** — no Web file-panel changes in this PR.
- **Off by default** — when `BP_SHARED_DIR` is unset the `/shared` prefix is not recognized and `/shared/...` falls through to the session workspace, so single-user deployments see **zero behavior change**.

## Changes

- **runtime** (`session-manager.ts`): `sharedDir` option + `resolveSharedDir` (env `BP_SHARED_DIR`). New `/shared` branch in `resolveManagedPath` (only when configured), independent traversal guard. Read-only enforced via `assertWritable` on write / stream-write / delete. `/shared` prefix round-trips in `relManagedPath`.
- **personas**: `sharedRootDirective` / `withSharedRootDirective` tell non-trace agents where the read-only shared library lives (absolute path), injected only when configured.
- **docker** (`docker-orchestrator.ts`): bind-mount the shared dir **`ReadOnly:true`** alongside the dataDir mount and inject `BP_SHARED_DIR`; wired from `create-orchestrator` via env. Mounts refactored to an array so multiple binds compose.
- **protocol** (`http.ts`): document the `/shared` file-route prefix.

## Read-only guarantee (two layers)

1. Docker bind mount `ReadOnly:true` (Docker mode).
2. Runtime prefix rejection in `assertWritable` — the **only** barrier in local/static modes.

## Usage

Deployment sets `BP_SHARED_DIR=/path/to/shared`:
- local/static: the runtime reads the env directly (inherited by the child).
- docker: auto read-only-mounted at container `/shared`, re-exported as `BP_SHARED_DIR`.

Agents then read `/shared/...` as input; writes/deletes are rejected.

## Testing

- `npm run typecheck` ✅
- `npm test` ✅ **712 passing**

New coverage: shared-root resolve/read/list/read-only-write/read-only-stream/read-only-delete/traversal + unconfigured backward-compat; persona directive; docker read-only mount + env, incl. factory env wiring.

## Note

Branched from `main` (not `development`) because `development` currently lacks the `resolveManagedPath` / `/data` / `/attachments` multi-root infrastructure this feature extends (it is 0-ahead/20-behind `main`). Targeting `main` accordingly.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86c37ad27051`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.