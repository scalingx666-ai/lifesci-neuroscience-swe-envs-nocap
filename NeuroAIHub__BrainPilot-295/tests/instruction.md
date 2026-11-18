# Issue

**Title:** fix(runtime): raise DEFAULT_MAX_TOKENS to 32k so long tool args don't truncate

## Description

.

## Symptom

Expert agents' `write` / `edit` / `send_message` calls with long content fail repeatedly. The tool is invoked with only `path` populated; `content` is missing/empty. Short writes work; long writes get stuck retrying.

## Root cause

The per-session `models.json` synthesized in `packages/runtime/src/pi-provider.ts` defaults `maxTokens` to **8192**.

Anthropic and OpenAI stream `tool_use` arguments as a single JSON payload in field order, so a `write` / `edit` / `send_message` whose `content` runs long has its response cut off mid-string once `max_tokens` is hit. Pi's streaming JSON repair (`pi-ai/dist/utils/json-parse.js` → `parseStreamingJson`) recovers the earlier `path` field but the truncated `content` is silently lost — the tool call reaches `system-tools.ts` with `content=''`. The agent retries into the same ceiling and never succeeds.

Principal rarely trips this (short handoffs). Experts trip it constantly: they write files (engineer / experimentalist) and deliver long results back to PI via `send_message`. This is also the sibling issue behind #97 / #125's "silent expert failures" — many of those were truncated payloads, not actual silence.

## Fix

Bump `DEFAULT_MAX_TOKENS` `8192` → `32768` in `packages/runtime/src/pi-provider.ts` (used by both auto-generated gateway configs and per-session provider registries).

- `32768` matches the modal `maxTokens` across Pi's built-in model catalogue (`pi-ai/dist/models.generated.js`; most modern models advertise 32k–128k).
- Sits above the SDK-side fallback of `16384` (`pi-ai/dist/core/model-registry.js:458`).
- The env override `ANTHROPIC_MAX_TOKENS` still wins for anyone who wants to go higher/lower.

## Tests

`pi-provider.test.ts` had a pin at `8_192` — updated to `32_768` with a comment linking back to this issue. All 751 tests pass.

## Follow-ups (out of scope here)

- UI-exposed per-provider `maxTokens` in the Providers settings, backed by `providers.json`, so users don't need to know about the env var.
- Guard in `send_message`: reject `content === ''` with `isError: true` so a truncated call surfaces immediately instead of writing an empty envelope.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70b32b8781c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.