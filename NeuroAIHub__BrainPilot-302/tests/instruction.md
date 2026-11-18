# Issue

**Title:** chore(web): replace legacy "MAS" with "BrainPilot" in chat placeholder

## Description

## What

The chat composer's placeholder text still referenced **MAS** (the legacy
Python *Multi-Agent System* name, now archived under `legacy/`). Update both
zh-CN and en-US strings in `packages/web/src/i18n/messages/chat.ts` to the
current product name.

## Diff

- `向 MAS 提问。输入 @ 使用插件或提及文件` → `向 BrainPilot 提问。输入 @ 使用插件或提及文件`
- `Ask MAS. Type @ to use plugins or mention files` → `Ask BrainPilot. Type @ to use plugins or mention files`

## Verification

- `grep "MAS"` on `packages/web/src` → no remaining references (built bundles
  under `dist/` are unaffected — regenerated on next build).
- `packages/web` vitest: 22 files / 172 tests pass.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c57f87f3a90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.