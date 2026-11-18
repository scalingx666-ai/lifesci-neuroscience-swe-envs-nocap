# Issue

**Title:** feat(app-state): new @elata-biosciences/app-state package

## Description

## Summary
New SDK package: \`@elata-biosciences/app-state\` (0.1.0). Per-user, per-app key-value storage for sandboxed apps.

\`\`\`ts
import { getState, setState, deleteState } from "@elata-biosciences/app-state";

const save = (await getState("save_slot_1")) as SaveGame | null;
await setState("save_slot_1", { level: 8, hp: 75 });
await deleteState("save_slot_1");
\`\`\`

## Why a new package
The proxy pattern stopped being just-IAP. Apps that only need payments still install \`@elata-biosciences/app-payments\`; apps that only need state install this; apps that need both install both. A future broader package may absorb both — but that decision can wait until we have more primitives (scores, leaderboards, etc.).

## Shape
Mirrors \`app-payments\`:
- postMessage round-trip with requestId-keyed reply
- \`AppStateError\` with \`code\` field (\`no_parent\`, \`timeout\`, \`invalid_input\`, \`not_authenticated\`, \`value_too_large\`, \`fetch_failed\`, etc.)
- Default 10s timeout
- Same scripts (\`build\`, \`clean\`, \`verify:build\`, \`prepack\`), jest config, tsconfig

## Pairs with
Appstore PR Elata-Biosciences/elata-appstore#TBD which adds the matching route + PlayHeader handler.

## Test plan
- [x] 16 cases — well-formed message shape, value returned, null on missing, error code mapping, sync validation (empty / too-long key, undefined value, called outside iframe), timeout.
- [x] Suite passes; \`pnpm build\` succeeds; Biome clean.
- [ ] Manual: publish 0.1.0, link into the appstore PR, exercise round-trip end to end.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75a88f3762c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.