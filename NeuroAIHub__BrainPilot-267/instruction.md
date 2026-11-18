# Issue

**Title:** docs(web): document disk-quota UI as a hosted trust-front hook

## Description

.

## Context — scope reversed

Issue #262 originally asked to **remove** the disk-quota UI. That was reversed: the hosting layer consumes `@brainpilot/web` as an **unpatched** npm artifact, so `components/quota/*` are the *only* way a managed deployment can surface quota inside `/app`. Removing them would leave hosted deployments with no in-`/app` quota surface (only raw 413s on over-quota upload). The correct framing is a **hosted trust-front hook** — same pattern as auth stripping (R-11) and subpath hosting (R-9): open-source ships the front, the hosted layer drives it.

So this PR **keeps everything** and instead documents + test-guards the hook. Pure additive — no deletions, no behavior change.

## Changes (the three asks)

1. **Document the contract** — comment on `SandboxStats.disk` (`contracts/backend.ts`) marking `quotaBytes` / `percentOfQuota` as hosted-only (default `0` single-user, dialogs inert). New `components/quota/README.md` explains the hook, its `/stats` data contract, and why it can't be deleted. Header comments on the three components point at the README.
2. **Lock in single-user inertness** — `DiskQuotaHostedHook.test.tsx` asserts: absent quota fields normalize to `0`; the `>= 90` / `>= 100` gates stay closed at the default; closed dialogs render empty markup; and the hook still lights up when a hosting layer supplies real quota fields.
3. **Keep `disk.workspaceUsedBytes`** — plain usage (the SandboxStatus disk meter), untouched.

## Verification

- `npx tsc -b packages/web` — clean
- `npx vitest run` (web) — 178 passed / 23 files, including the 4 new tests

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34ed99cb3218`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.