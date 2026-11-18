# Issue

**Title:** Add S3_KEY_PREFIX so two environments can share one bucket

## Description

Operator-only: optional `S3_KEY_PREFIX` puts every new object under `<prefix>/vaults/<vaultId>/<sha256>`, so staging (`staging`) and production (empty) can share one R2 bucket without touching each other's objects. Rows keep the full key in `blobs.storage_key`, so reads, deletes, GC and the migrate script keep resolving objects written under any earlier prefix; changing the prefix is additive. Validated at boot when `BLOB_STORAGE=s3` (`.`/`..` segments refused). Documented in .env.example and DEPLOY.md; name added to the Railway preserve list. Server suite 745 passed, tsc clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2a42e47b996`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.