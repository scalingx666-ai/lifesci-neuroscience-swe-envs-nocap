# Issue

**Title:** fix(runtime): tool_toggles takes effect on new sessions (drop process-wide cache)

## Description

## The bug

`SessionManager.ensureToolToggles()` cached `tool_toggles.json` for the entire process lifetime. The first `ensureAgent` seeded `this.toolToggles` with whatever was on disk at that moment; every later session hit the guard `if (this.toolToggles !== undefined) return this.toolToggles;` and got the same stale value. If the user opened Settings → 工具 and unchecked a tool **after** any session had been created, the flip was silently ignored for the rest of the process.

The frontend hint (`settings.builtinTools.restartHint`) already told users "改动会立即生效于新会话 / New sessions pick up the new setting on their first turn" — that promise was broken by the cache.

### Reproduce

Verified in my running system (see below), and mechanically explained by the timestamps:

| Time | Event | State |
|---|---|---|
| 20:57 | runtime starts | `toolToggles` = `undefined` |
| 21:04:08 | first session created → `ensureToolToggles()` reads disk; file doesn't exist yet | cache pinned to `null` (= all enabled) |
| 21:04:22 | user unchecks `skill_search` in UI → PUT `/api/tool-toggles` writes file | disk = `{skill_search:false, ...}` |
| 21:09, 21:11, 21:17 | 3 new sessions created | all short-circuit the cache — `skill_search` still injected |

## The fix

Drop the process-wide cache. Read `tool_toggles.json` on every `ensureAgent`.

- The file is tiny (three booleans, ~100 bytes) and only three keys are recognized.
- `ensureAgent` isn't hot — it fires on session create + expert spawn, not per turn. One extra `fs.readFile` per agent creation is negligible next to the Pi SDK setup that follows (which itself does dozens of file reads for skill materialization).
- Test injection preserved via a renamed `injectedToolToggles` field populated only from the constructor's `opts.toolToggles`. When present, disk is never touched — keeps existing tests hermetic.

### Behavior after fix

- Flip a toggle in UI → **next new session** (or the next expert spawned in an existing session — `ensureAgent` also fires per expert) picks it up immediately. No restart needed.
- **Already-running agents** keep the tool list they were given at `agentFactory` time — Pi caches it inside the provider session, so mid-flight mutation is fragile. Restart-to-apply is still the escape hatch for currently-active sessions.

Both parts are now spelled out accurately in the frontend hint (zh-CN + en) and in the backend comment block.

## What changed

- **`packages/runtime/src/session-manager.ts`**
  - `ensureToolToggles()`: always call `loadToolToggles`; return injected value verbatim if the constructor provided one.
  - Field renamed `toolToggles` → `injectedToolToggles` to make its "test seed only" role obvious. JSDoc rewritten.
- **`packages/runtime/src/__tests__/tool-toggles-hot.test.ts`** — new regression file, 3 cases:
  1. Mid-run flip via disk write is picked up by the next `createSession`.
  2. Removal of the file reverts to default-on on the next session.
  3. Explicit `opts.toolToggles` injection still wins over disk (test hermeticity).
- **`packages/backend-core/src/app.ts`**: ⚠️ IMPORTANT block around `PUT /tool-toggles` rewritten.
- **`packages/web/src/i18n/messages/settings.ts`**: `restartHint` copy in zh-CN and en updated to distinguish "new sessions" (immediate) from "already-running agents" (restart-to-apply).
- **`packages/web/src/components/settings/BuiltinToolsSection.tsx`**: docstring updated.

## Test

```
npx vitest run
# 739 passed, 3 pre-existing failures in azure-responses-reasoning-id.test.ts
# (also fail on main; unrelated to this PR)

npm run typecheck  # clean
npm run build      # clean
```

Manual: rebuilt, restarted runtime, `curl POST /api/sessions` succeeds; the new `tool-toggles-hot.test.ts` provides the actual contract-level verification.

## Non-goals

- **Hot-mutating already-running agents.** Pi's `createAgentSession` takes the tool list upfront and it lives inside the provider connection. Poking it mid-flight risks state divergence between our view and the SDK's. Restart-to-apply is correct for currently-active sessions.
- **Persona-prompt cleanup.** `personas.ts` hard-codes ~30 references to `skill_search`. When the tool is disabled and the model still follows the prompt, Pi returns "unknown tool". That's a separate problem (make those persona sections conditional on the toggle) worth its own PR — noting here so it doesn't get lost.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b92631310f58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.