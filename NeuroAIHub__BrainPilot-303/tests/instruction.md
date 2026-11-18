# Issue

**Title:** feat(runtime): per-run + per-session usage stats (tokens + tools + skills)

## Description

Adds runtime-authoritative counters for **behavioural research** — per-agent tool invocations, `skill_search` sub-mode-classified skill usage, tool errors, and per-run token deltas. Persisted to `.bp/<sid>/stats.json`, rehydrated on restart, and served over `GET /sessions/:id/stats`.

## Scope (minimum-tier — no runtime event surface change)

- `MasAgent` counts every `tool_execution_start`; `tool_execution_end.isError` is added to a sibling `errors` counter (never subtracted from `tools`).
- `skill_search` invocations are classified from `args` into `queries` / `loads` / `browses` via `usage-stats.ts:recordSkillCall`. Malformed / unknown sub-modes bucket to `__search__` — never dropped.
- **Tool coverage ~99%** (every Pi execution enters via one core-loop path that emits start/end).
- **Skill coverage limited to the `skill_search` tool path.** `/skill:<name>` slash-command expansions and implicit `<available_skills>` loads are out of scope and can be added later via a Pi extension without changing this schema.

## Protocol additions (`@brainpilot/protocol` SSOT)

`ToolCallCountsSchema`, `SkillCounterSchema`, `SkillCountsSchema`, `AgentStatsSchema`, `RunStatsSchema`, `SessionStatsSchema`; `GetSessionStatsResponseSchema` + `RUNTIME_ROUTES.getSessionStats` (`GET /sessions/:id/stats`).

## Runtime

- New `packages/runtime/src/usage-stats.ts` — pure helpers (`addStatsDelta`, `cloneAgentStats`, `subtractAgentStats`, `recordSkillCall`, `emptySessionStats`, `recomputeSessionTotal`).
- `MasAgent`: new `onRunStats` opts callback, `stats()`/`seedStats()` accessors, per-run delta = `cumulative_after − runStartSnapshot`.
- `SessionManager`: new `entry.stats: SessionStats`, `getSessionStats`, `writeStats`/`loadStats` (best-effort, mirrors `writeUsage`). Each `RUN_FINISHED` appends a `RunStats` and re-persists.
- `server.ts`: `GET /sessions/:id/stats` (auto-loads evicted sessions).
- `backend-core`: single byte-passthrough forward entry.

## Tests

- 14 new cases (`usage-stats.test.ts`): helper arithmetic, three `skill_search` sub-modes, malformed args → `__search__` fallback, `MasAgent` tool + skill counters, `errors` additive to `tools`, `SessionManager` E2E (`byRun` append, `stats.json` write, restart rehydrate, continued accumulation).
- Full suite: **630/630 non-web + 172/172 web** all pass locally.

## Compatibility

Behaviour-preserving for existing sessions: `stats.json` is a separate file from `usage.json`; absent-file loads silently to the zeroed default. Old sessions do not backfill history — they simply start accumulating from the next run.

## Notes on base

Targets `main` directly (per author's choice). Along with the stats change this PR also carries the four development-only commits that had not yet been merged into main:

- `#285` fix(cli): gate scaffold's bundled-skill copy behind BP_SKIP_SKILL_COPY ()
- `#291` fix(provider): probe selected responses protocols

**No npm release is intended** for this merge; the version stays at 0.0.14 on `main`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c57f87f3a90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.