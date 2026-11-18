# Issue

**Title:** fix(cli): gate scaffold's bundled-skill copy behind BP_SKIP_SKILL_COPY

## Description

.

## Problem

`packages/cli/src/commands/up.test.ts` flakily times out in CI (5000ms) while passing locally in ~100ms. Root cause is **structural, not random**: nearly every CLI test calls `up`/`scaffold`/`init`, and each scaffolds a fresh temp data dir that recursively copies the *entire* bundled `@brainpilot/skills` tree — **~600 files today and growing with every added skill** (357 when the issue was filed; #280 fmriprep added 13; spikeinterface added more). On a contended 2-core GitHub runner that disk IO — not the code under test — dominates wall-clock and eventually blows the per-test timeout. Every added skill slows all 29 `up.test.ts` cases a little; it's a trend that only worsens.

## Fix (issue's recommended option 1)

- `scaffold()` skips `materializeSkills()` when `BP_SKIP_SKILL_COPY=1|true` (or `ScaffoldOptions.skipSkillCopy`). The directory skeleton and all default files (README, example, providers, mcp_servers, config) are still written — **only the heavy recursive copy is elided**.
- New `packages/cli/vitest.{config,setup}.ts` sets the flag for the whole CLI suite, so every current *and future* CLI test benefits with zero per-test change.
- Regression tests pin the gate: it skips when set, and still copies with `skipSkillCopy: false` (proving it's a live path, not dead code).

**Safety**: production never sets the flag, and even if it did, the runtime server re-materialises skills on startup (`ensureSkillsMaterialized`) — a real launch is never stranded. The runtime's own `materialize-skills` tests call `materializeSkills` directly (bypassing the CLI gate), so real-copy coverage is untouched.

## Results

| | before | after |
|---|---|---|
| `up.test.ts` (29 cases) | 1579ms | 45ms |
| `up.test.ts` +200 fake skills | scales up | 42ms (flat) |

- Full workspace: **614 tests green** (59 files).
- Runtime `materialize-skills` / `two-skill-paths` (real copy): still green.
- Typecheck clean.

## Acceptance criteria

- [x] `up.test.ts` wall-clock no longer scales with skills dir size
- [x] Adding a new skill leaves `up.test.ts` time basically unchanged (verified with +200 files)
- [x] `scaffold`/`init`/`template` tests no longer trigger the full skill copy

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4969d029ea0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.