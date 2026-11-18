# Issue

**Title:** Speed up Access panel summaries and fix misleading Restricted badge

## Description

Access panel was slow on bigger teams and vaults, and showed "Restricted" for everyone when only one person was read-only.

**Why it was slow**
- Every per-person summary resolved every folder/note under the row one by one: ~5 queries per note per person. "Entire vault" with 3 people on a ~3,700-note vault ≈ 50k queries.
- Every visible row sent its own request (4 at a time), and every person ticked started the whole set again while the previous requests were still running on the server.

**Server**
- `loadAccessIndex` preloads the org's share rows, folders, notes and files once per request. The resolver's branch logic is unchanged (`resolveAccessForUser`); only where it reads rows from changes. `tests/access-index.test.ts` checks the in-memory answer equals the per-query answer for every resource × user across all four vault postures.
- New `POST /api/orgs/:orgId/access/summaries` answers many rows in one request. `/access/summary` now uses the same path.

**Desktop**
- Row badges are batched into one request per render (chunks of 200). Falls back to per-row requests on a server without the new route.
- People selections settle for 300 ms before resolving.
- Everyone view keeps the team badge and shows "Read-only for <name>" instead of "Restricted".
- Assistant without a key shows a single "Connect a provider" prompt instead of a disabled Scan button plus a second button.

**Tests**
- Server: `access-index` + `team-access` pass. The full suite has 3 failures in `blob-text.test.ts`, and the same 3 fail on unmodified `staging` (402 from the standalone-file Pro gate).
- Desktop: full suite passes apart from a flaky `codeFence` clipboard test, which passes on its own.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd612421549c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.