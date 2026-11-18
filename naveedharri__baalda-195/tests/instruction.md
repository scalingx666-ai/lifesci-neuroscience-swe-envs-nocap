# Issue

**Title:** Answer the plan before the path for unregistered file uploads

## Description

A Free vault ("2nd Brain (Master Vault)", 0 `files` rows) was retrying every standalone file on prod: intents with no/dead `docId` got 400 `invalid_rel_path` before the plan check, so the desktop never saw the 402 `attachment_sync_requires_pro` that shows the notice and stops retries. Both upload routes now answer the plan first when the vault cannot sync files; self-hosts/Pro still get the 400 (which #191's client self-heal handles).

Tests: new case in `blobs.test.ts` (fails on old order); server suite 943 passed, the 3 `blob-text` failures are pre-existing on staging.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab132168b095`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.