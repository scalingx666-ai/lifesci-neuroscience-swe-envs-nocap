# Issue

**Title:** Seed the new-member access default from each existing vault's posture

## Description

## Why

Migration 032 gave every organization a Private default for people who join later. For a vault that already exists with a Shared posture, the org-wide grant carries `access_revision = 0`, which the new member's snapshot ignores for pre-join content. The next invitee to an existing Shared vault would land on an empty sidebar.

## What

Migration 033 seeds `organization_access_settings.join_default` once from each existing vault's posture: org-wide vault grant `edit` → `open` (Shared), `view` → `readonly`, sealed or never shared → `private`. `ON CONFLICT DO NOTHING`, so a default already set through the Access panel is never overwritten. Vaults created after the deploy keep 032's Private default. Column default and the member trigger are untouched.

`access_revision` stays 0: the snapshot mode maps directly to edit/view for pre-join content, independent of the revision comparison that gates only direct grants.

## Tests

- `tests/join-default-seed.test.ts`: 7 new cases (edit → open with a later joiner getting edit and seeing the docs, view → readonly, existing row not overwritten, denied/no grant stays private, idempotent, multi-org single pass, post-migration orgs not seeded).
- Ten access-related suites green against a scratch DB; `tsc --noEmit` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f98b138603c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.