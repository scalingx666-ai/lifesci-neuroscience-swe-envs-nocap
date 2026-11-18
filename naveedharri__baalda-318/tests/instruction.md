# Issue

**Title:** fix: isolate optional MinIO Compose configuration

## Description

<!--
Thanks for contributing to Baalda! By submitting this PR you agree your
contribution is licensed under the project's Apache-2.0 license (no CLA required).
-->

## What does this PR do?

Fixes the default Compose startup failing when optional MinIO credentials are unset.

Previously, `docker compose up -d` evaluated MinIO's required environment variables even though the `minio` profile was disabled. This contradicted the documented PostgreSQL-only setup.

This PR:
- Moves the MinIO service and volume into `docker-compose.minio.yml`.
- Keeps the default PostgreSQL stack independent of MinIO credentials.
- Preserves required credential validation when MinIO is explicitly included.
- Updates the READMEs, deployment guide, and `.env.example`.
- Adds Compose configuration regression checks and a CI job.

To enable MinIO, replace the previous `--profile minio` command with:

```bash
docker compose -f docker-compose.yml -f docker-compose.minio.yml up -d minio
```

Starting MinIO alone does not change the server's attachment storage backend. The updated documentation describes the additional configuration.

### Validation

- Confirmed the regression check fails against the original Compose configuration.
- `python3 scripts/test-compose-config.py` passes:
  - Default configuration works without MinIO credentials.
  - Optional MinIO configuration rejects missing or empty credentials.
  - Optional MinIO configuration accepts valid credentials.
- Default stack starts successfully; PostgreSQL and the server are healthy.
- Database migrations complete successfully; `/health` returns HTTP 200.
- `git diff --check` passes.

MinIO runtime verification was blocked by a `401 UNAUTHORIZED` response when pulling the existing `quay.io/minio/minio:latest` image. The image reference is unchanged. MinIO startup and object storage operations remain unverified.

Application test suites were not run; changes are limited to deployment configuration, documentation, and configuration checks.

## Related issue

No linked issue.

## Checklist

- [ ] I discussed non-trivial changes in an issue first.
- [x] Tests pass locally (`npm test` / `cargo test` as relevant). Scoped Compose regression checks pass; runtime limitation noted above.
- [x] I added or updated tests for my change.
- [x] New source files include `SPDX-License-Identifier: Apache-2.0`.
- [x] No secrets, credentials, or `.env` files are committed.
- [x] I did not break the core invariants (doc_id identity, binary-only wire, `.context/` untouched, load-bearing debounce timings). No application code was changed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a499d3eb005c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.