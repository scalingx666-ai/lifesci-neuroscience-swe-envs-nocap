# Issue

**Title:** Switch to an on-device synced vault before any network or reconcile

## Description

## Why

Switching to a synced vault took seconds and grew with vault size, while switching to a local vault was instant — even though the synced vault was already fully on disk.

The "Switching to…" overlay (and the dimmed, click-blocked tree) stays up until `switchToOrg` returns, and that closure awaited, serially: 6–7 HTTP round trips (set-active, get-session, organizations, members, invitations, user invitations, billing), then the folder open, then the **entire registry reconcile** (`enableSyncForVault` → `syncManager.enable` → `registry.reconcile`) *before* reading the tree. The reconcile walks the whole vault, fetches the unpaginated note list three times, and waits on the Rust index-rebuild lock via `list_note_titles` — that is the size-dependent part.

## What changed (`store.ts` only, plus one doc row)

1. **`applyVaultFolder`** starts `enableSyncForVault` without awaiting it, then reads the tree and titles immediately. Sync already re-refreshes the tree after the reconcile to surface materialized notes, and every post-await state write in that path is epoch-gated (the "user switched away mid-reconcile" case was already handled). A note opened before sync lands is re-attached by the editor when `syncEnabled` flips (existing `Editor.tsx` effect dependency). New `deferSync` option for the caller below.
2. **`setActiveOrganization` fast path**: when the vault's folder is already bound and on disk, open it and paint the tree **before** any network call, clear the overlay, then activate the org and re-read the session, and start sync + roster + billing refresh in the background. Sync is deliberately not started until the session names the new org, because `enableSyncForVault` derives the org from the session.

Not changed: the sync engine, reconcile, download/upload phases; the no-folder fallbacks (rediscover / mint / prompt) still run network-first exactly as before; a bound folder that fails to open still lands on the same prompt, after the org is active.

## Verification

- `tsc --noEmit` clean; desktop vitest 870 passed / 12 skipped.
- Manual (to test on staging): switch between two on-device synced vaults — tree should swap well under 200 ms with no overlay, header renames at once, sync pill shows registering then settles. Rapid A→B→A ends on A synced. Fresh join with no local folder still rediscovers/mints and syncs. New vault still seeds and opens Welcome. Offline switch still shows the local tree.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `981657db5d69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.