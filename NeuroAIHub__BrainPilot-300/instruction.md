# Issue

**Title:** chore(release): bump version to 0.0.14

## Description

Release cut for v0.0.14. This PR bumps the monorepo version so the release commit rides in as part of the merge (per CLAUDE.md release-on-dev→main workflow) — after this merges to `main`, run `npm run release` locally to publish the workspace packages.

## Scope of the release

Fixes/features landed on `main` since v0.0.13:

- **#285** CLI scaffold flakiness fix (`BP_SKIP_SKILL_COPY` gate skips the 600-file bundled-skill copy in test)
- **#286** `tool_toggles` hot-read on new sessions (drop process-wide cache)
- **#289** persistent library flattened to `data/`
- **#290** Live Demo bundle safety
- **#291** provider probes for selected Responses / Azure protocol variants
- **#292** knowledge base settings build flag
- **#293 / #295** raise `DEFAULT_MAX_TOKENS` 8k → 32k — fixes expert `write` / `edit` / `send_message` truncation on long content (the user-reported regression)
- **#294** empty `skill_name` fallback
- **#297** per-session domain resource isolation
- **#299** README research-cases docs

## Mechanical changes

- Root `package.json` `0.0.13` → `0.0.14`
- `npm run version:sync` propagated version + cross-package dependency ranges to all 8 workspace packages
- `npm install --package-lock-only` regenerated `package-lock.json`

## Verification

- `npm run typecheck` — pass
- `npm test` — 704 tests, 64 files, all green

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c33fd9b4747`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.