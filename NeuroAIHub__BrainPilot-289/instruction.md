# Issue

**Title:** refactor(runtime): flatten persistent library to data/

## Description

.

## Why

`SessionManager.persistentDir()` used to return `<dataRoot>/data/<userId>/`,
with `<userId>` sourced from `BP_USER_ID` (default `local`). Both current
deployment shapes make that inner layer redundant:

- **Open-source single machine** — always one user; `data/local/` is redundant.
- **BrainPilot Cloud** — each user already has an isolated bind mount at
  `users/<username>/.bp-root`, so the old layout duplicated the username.

## What

- `SessionManager.persistentDir()` now returns `<dataRoot>/data/`.
- `persistentUserId` and `BP_USER_ID` no longer control active path resolution.
  During upgrade only, the old value identifies the one legacy directory that
  may be migrated; when unset, only the former default `data/local/` is checked.
- Layout v2 is recorded in `<dataRoot>/.bp-persistent-layout.json`, outside the
  user-visible `data/` tree. Migration never infers a user id from directory
  count, so a valid v2 tree such as `data/project/` is left intact.
- Migration is a readiness gate and uses a journaled whole-directory rename via
  `<dataRoot>/.bp-persistent-data-v1-migration`. Interrupted migrations resume
  on restart; mixed v1/v2 layouts fail without moving or overwriting files.
- `startServer()` completes layout initialization before restore/listen, and all
  `/data` list/read/write/delete paths await the same single-flight promise.
- The logical `/data/...` API, frontend behavior, and agent usage are unchanged.
- English/Chinese root READMEs, runtime documentation, protocol comments, and
  Docker Compose comments now describe the single-user data-root contract.

## Acceptance criteria

- [x] New installs write directly to `<BP_DATA_DIR>/data/`.
- [x] `/data/foo` is reusable across sessions.
- [x] `BP_USER_ID` is not required and no longer selects the active root.
- [x] Legacy `data/<userId>/` data has a guarded, recoverable migration.
- [x] Documentation assigns multi-user isolation to the deployment layer.

## Tests

- Valid v2 `data/project/` is not flattened, including after restart.
- Only `BP_USER_ID` (or default `local`) is eligible as a legacy directory.
- Mixed v1/v2 layouts fail without changing either side.
- Concurrent `/data` writes before session creation single-flight migration.
- A staged migration resumes after interruption.
- Runtime readiness writes a v2 layout marker before serving requests.
- `npm run typecheck` passes.
- Full monorepo suite passes: **63 files, 745 tests**.

## Commits

- `8dd8cde` — original flat-layout implementation by GTC2333.
- `83aaa97` — follow-up safety fixes after migration-risk review.

🤖 Original implementation generated with [Claude Code](https://claude.com/claude-code); safety follow-up completed by the maintainer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00cc4ea695c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.