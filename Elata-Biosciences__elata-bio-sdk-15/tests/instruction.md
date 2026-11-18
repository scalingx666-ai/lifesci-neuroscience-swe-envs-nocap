# Issue

**Title:** feat(app-payments): add hasItem and getOwnedItems entitlement queries

## Description

## Summary
Two new SDK methods that let sandboxed apps query the session user's offchain entitlements:

```ts
if (await hasItem(7)) unlockPermanentSkin();
const owned = await getOwnedItems();
```

Same `postMessage` round-trip / promise / timeout pattern as `requestPurchase`, but resolve directly to `boolean` / `number[]` rather than a discriminated union — query failures are exceptional, not part of the normal flow.

## Why
Pairs with appstore PR Elata-Biosciences/elata-appstore#TBD, which adds the matching host handler in `PlayHeader.tsx` and a session-authed `GET /api/apps/[tokenAddress]/entitlements` route. Together they unblock **type-2 durable IAPs** (permanent unlocks, owned levels, story chapters) — purchases that need to survive the user closing the app. Ephemeral type-3 purchases continue to work with `requestPurchase` alone.

## Changes
- `protocol.ts`: 4 new message-type constants + `IapHasItemMessage` / `IapListOwnedMessage` / their result types + 2 type guards.
- `client.ts`: `hasItem(contentId, opts?)` and `getOwnedItems(opts?)`; `AppPaymentsError` code union widens to include `not_authenticated` and `fetch_failed`. Default query timeout is 10s (vs `requestPurchase`'s 5min, since these are non-interactive).
- `index.ts`: re-exports new functions + types.

## Test plan
- [x] 12 new cases (7 `hasItem`, 5 `getOwnedItems`) — well-formed message shape, owned true/false, error code mapping (`not_authenticated`, `fetch_failed`), source-spoof rejection, sync `invalid_input` for non-integer `contentId`, integer-filtering on `getOwnedItems`, timeout, host error.
- [x] Suite 22/22 green (10 pre-existing + 12 new). Biome clean.
- [ ] Manual: build the package, link into the appstore from its sibling PR, run the iframe round-trip end-to-end.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4ffbee84c86`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.