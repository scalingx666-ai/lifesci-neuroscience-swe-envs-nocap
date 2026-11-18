# Issue

**Title:** feat(app-payments): add getCatalog() to list available offchain items

## Description

## Summary
New SDK method `getCatalog()` that lets sandboxed apps fetch the host's catalog of active offchain items instead of hard-coding `contentId`s and prices:

\`\`\`ts
const items = await getCatalog();
for (const item of items) renderTile(item);
\`\`\`

Returns \`CatalogItem[]\` with \`contentId\` / \`title\` / \`description\` / \`imageUrl\` / \`priceUsdc\`. Throws \`AppPaymentsError\` on host errors (\`app_not_found\`, \`fetch_failed\`) — matches the error model of \`hasItem\` / \`getOwnedItems\`.

## Why
Closes the IAP loop together with #15 (entitlements) and the matching appstore PR Elata-Biosciences/elata-appstore#TBD: \`getCatalog()\` → render store, \`requestPurchase()\` → buy, \`hasItem()\` / \`getOwnedItems()\` → restore. Devs no longer need to hard-code listings or stay in sync with admin price edits.

## Changes
- \`protocol.ts\`: 2 new message-type constants + \`CatalogItem\` + \`IapGetCatalogMessage\` / its result type + type guard.
- \`client.ts\`: \`getCatalog(opts?): Promise<CatalogItem[]>\`. Same promise/timeout/cleanup pattern as the entitlement methods. \`CatalogItem\` re-exported.
- \`index.ts\`: re-exports new function + types.

## Test plan
- [x] 5 new cases — well-formed message shape, items returned, non-array \`items\` field handled as empty, host error → \`fetch_failed\`, timeout.
- [x] Suite 27/27 green (22 pre-existing + 5 new). Biome clean.
- [ ] Manual: rebuild + bump version, exercise the round-trip with a real app via the appstore PR.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d46256b57b16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.